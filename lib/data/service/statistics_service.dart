import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';

abstract class StatisticsService {
  Future<double> getBalance(String address);
}

@Injectable(as: StatisticsService)
class StatisticsServiceImpl extends StatisticsService {
  Web3Client web3client;

  StatisticsServiceImpl({required this.web3client});

  @override
  Future<double> getBalance(String address) async {
    final balanceInWei = (await web3client.getBalance(EthereumAddress.fromHex(address))).getInWei;
    return balanceInWei.toDouble() / BigInt.from(10).pow(18).toDouble();
  }
}
