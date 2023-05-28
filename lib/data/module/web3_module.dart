import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:walletconnect_secure_storage/walletconnect_secure_storage.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';

import '../../core/const.dart';

@module
abstract class Web3Module {
  @preResolve
  @lazySingleton
  Future<WalletConnect> get walletConnector async => WalletConnect(
        bridge: 'https://bridge.walletconnect.org',
        session: await WalletConnectSecureStorage().getSession(),
        sessionStorage: WalletConnectSecureStorage(),
        clientMeta: const PeerMeta(
          name: 'Neekle',
          description: 'Neekle',
          url: 'https://walletconnect.org',
        ),
      );

  @lazySingleton
  Web3Client get web3client => Web3Client(
        iphoneRpcUrl,
        http.Client(),
        socketConnector: () => IOWebSocketChannel.connect(iphoneRpcUrl.replaceFirst('http', 'ws')).cast<String>(),
      );

  @preResolve
  @lazySingleton
  Future<DeployedContract> get contract async => DeployedContract(
        ContractAbi.fromJson(await rootBundle.loadString('assets/strings/abi.json'), 'DigitalAssetsMarketplace'),
        EthereumAddress.fromHex(contractAddress),
      );
}
