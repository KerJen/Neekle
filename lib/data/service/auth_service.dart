import 'dart:async';
import 'dart:math';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/web3dart.dart';

import '../../core/error/exception.dart';
import '../../core/web3/wallet_connect_credentials.dart';

abstract class AuthService {
  Stream<SessionStatus> walletSessionStatus();

  Stream<User?> authStateChanges();
  Future<String> createSession();
  Future<Tuple2<String, String>> signSignInMessage(String address);
  Future<String> sendTransaction(Transaction transaction);
  Future<UserCredential> logIn({required String address, required String message, required String signature});
  Future<void> logOut();
}

@LazySingleton(as: AuthService)
class AuthServiceImpl extends AuthService {
  final WalletConnect walletConnector;
  final Web3Client web3Client;
  final FirebaseAuth auth;
  final FirebaseFunctions functions;

  AuthServiceImpl({
    required this.walletConnector,
    required this.web3Client,
    required this.auth,
    required this.functions,
  }) {
    walletConnector.on<SessionStatus>(
      'connect',
      (session) => _walletSessionController.add(session),
    );
  }

  final _walletSessionController = BehaviorSubject<SessionStatus>();

  @override
  Stream<SessionStatus> walletSessionStatus() => _walletSessionController.stream;

  @override
  Stream<User?> authStateChanges() => auth.authStateChanges();

  @override
  Future<String> createSession() async {
    final completer = Completer<String>();

    if (walletConnector.connected) {
      await walletConnector.killSession();
      walletConnector.reconnect();
    }

    walletConnector.createSession(
      chainId: (await web3Client.getChainId()).toInt(),
      onDisplayUri: (uri) => completer.complete(uri),
    );
    return completer.future;
  }

  @override
  Future<Tuple2<String, String>> signSignInMessage(String address) async {
    final message = 'Sign in with your Ethereum wallet to authenticate with Neekle. Nonce: ${Random().nextInt(100000)}';

    final signature = await walletConnector.sendCustomRequest(
      method: 'personal_sign',
      params: [message, address],
    );

    return tuple2(message, signature);
  }

  @override
  Future<String> sendTransaction(Transaction transaction) async {
    final credentials = WalletConnectCredentials(
      provider: EthereumWalletConnectProvider(walletConnector),
    );

    return await web3Client.sendTransaction(
      credentials,
      transaction,
      chainId: (await web3Client.getChainId()).toInt(),
    );
  }

  @override
  Future<UserCredential> logIn({
    required String address,
    required String message,
    required String signature,
  }) async {
    final result = await functions.httpsCallable('generateCustomToken').call({
      'walletAddress': address,
      'message': message,
      'signature': signature,
    });

    final token = result.data['customToken'] as String?;
    if (token == null) {
      throw UnauthorizedException();
    }

    return await auth.signInWithCustomToken(token);
  }

  @override
  Future<void> logOut() async {
    await auth.signOut();
    await walletConnector.killSession();
    walletConnector.reconnect();
  }
}
