import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/web3dart.dart';

abstract class Web3Service {
  Future<Tuple2<String, String>> signMessage(String message, String address);
  Future<double> getBalance(String address);
}

@Injectable(as: Web3Service)
class Web3ServiceImpl extends Web3Service {
  final WalletConnect walletConnector;
  final Web3Client web3client;

  Web3ServiceImpl({required this.walletConnector, required this.web3client});

  @override
  Future<Tuple2<String, String>> signMessage(String message, String address) async {
    final signature = await walletConnector.sendCustomRequest(
      method: 'personal_sign',
      params: [message, address],
    );

    return tuple2(message, signature);
  }

  @override
  Future<double> getBalance(String address) async {
    final balanceInWei = (await web3client.getBalance(EthereumAddress.fromHex(address))).getInWei;

    return balanceInWei.toDouble() / BigInt.from(10).pow(18).toDouble();
  }
}
