import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';

import '../../core/ui/const.dart';

@module
abstract class Web3Module {
  @lazySingleton
  WalletConnect get walletConnector => WalletConnect(
        bridge: 'https://bridge.walletconnect.org',
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
  Future<DeployedContract> get contract async => DeployedContract(
        ContractAbi.fromJson(await rootBundle.loadString('assets/strings/abi.json'), 'DigitalAssetsMarketplace'),
        EthereumAddress.fromHex('0xb9fCDd9B12447f850984DC7DEC6914Bd7a495e5b'),
      );
}
