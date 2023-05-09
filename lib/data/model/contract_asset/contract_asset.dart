import 'package:web3dart/web3dart.dart';

class ContractAsset {
  final String id;
  final EthereumAddress seller;
  final String assetLink;
  final double price;

  ContractAsset({
    required this.id,
    required this.seller,
    required this.assetLink,
    required this.price,
  });
}
