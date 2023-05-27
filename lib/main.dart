import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
import 'core/ui/colors.dart';

import 'core/di/di.dart';
import 'core/const.dart';
import 'core/ui/router/router.dart';
import 'core/ui/text_styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _appRouter = AppRouter();

  final web3 = Web3Client(
    iphoneRpcUrl,
    Client(),
    socketConnector: () {
      return IOWebSocketChannel.connect(iphoneRpcUrl.replaceAll('http', 'ws')).cast<String>();
    },
  );

  DeployedContract contract = DeployedContract(
    ContractAbi.fromJson(
        '[{"inputs":[],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"owner","type":"address"},{"indexed":true,"internalType":"address","name":"approved","type":"address"},{"indexed":true,"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"Approval","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"owner","type":"address"},{"indexed":true,"internalType":"address","name":"operator","type":"address"},{"indexed":false,"internalType":"bool","name":"approved","type":"bool"}],"name":"ApprovalForAll","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"string","name":"assetId","type":"string"},{"indexed":true,"internalType":"address","name":"seller","type":"address"},{"indexed":false,"internalType":"string","name":"assetLink","type":"string"},{"indexed":false,"internalType":"uint256","name":"price","type":"uint256"}],"name":"AssetCreated","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"string","name":"assetId","type":"string"},{"indexed":true,"internalType":"address","name":"seller","type":"address"},{"indexed":true,"internalType":"address","name":"buyer","type":"address"},{"indexed":false,"internalType":"uint256","name":"price","type":"uint256"}],"name":"AssetSold","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"from","type":"address"},{"indexed":true,"internalType":"address","name":"to","type":"address"},{"indexed":true,"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"Transfer","type":"event"},{"inputs":[{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"approve","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"string","name":"","type":"string"}],"name":"assets","outputs":[{"internalType":"string","name":"assetId","type":"string"},{"internalType":"address","name":"seller","type":"address"},{"internalType":"string","name":"assetLink","type":"string"},{"internalType":"uint256","name":"price","type":"uint256"}],"stateMutability":"view","type":"function","constant":true},{"inputs":[{"internalType":"address","name":"owner","type":"address"}],"name":"balanceOf","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function","constant":true},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"getApproved","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function","constant":true},{"inputs":[{"internalType":"address","name":"owner","type":"address"},{"internalType":"address","name":"operator","type":"address"}],"name":"isApprovedForAll","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function","constant":true},{"inputs":[],"name":"name","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function","constant":true},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"ownerOf","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function","constant":true},{"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"safeTransferFrom","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"bytes","name":"data","type":"bytes"}],"name":"safeTransferFrom","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"operator","type":"address"},{"internalType":"bool","name":"approved","type":"bool"}],"name":"setApprovalForAll","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"bytes4","name":"interfaceId","type":"bytes4"}],"name":"supportsInterface","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function","constant":true},{"inputs":[],"name":"symbol","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function","constant":true},{"inputs":[{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"tokenURI","outputs":[{"internalType":"string","name":"","type":"string"}],"stateMutability":"view","type":"function","constant":true},{"inputs":[{"internalType":"address","name":"from","type":"address"},{"internalType":"address","name":"to","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"transferFrom","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"string","name":"assetId","type":"string"},{"internalType":"string","name":"assetLink","type":"string"},{"internalType":"uint256","name":"price","type":"uint256"}],"name":"createAsset","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"string","name":"assetId","type":"string"}],"name":"buyAsset","outputs":[],"stateMutability":"payable","type":"function","payable":true}]',
        'DigitalAssetsMarketplace'),
    EthereumAddress.fromHex('0xb9fCDd9B12447f850984DC7DEC6914Bd7a495e5b'),
  );

  @override
  void initState() {
    super.initState();

    // final authorAddress = EthereumAddress.fromHex('0x7D1907ea2AEAb4789eA27ED1154f51cf13ED7bE1');

    // web3
    //     .events(
    //   FilterOptions(
    //     address: contract.address,
    //     topics: [
    //       [bytesToHex(contract.event('AssetCreated').signature, padToEvenLength: true, include0x: true)],
    //       // [bytesToHex(authorAddress.addressBytes, forcePadLength: 64, include0x: true)],
    //     ],
    //   ),
    // )
    //     .listen((event) {
    //   print(contract.event('AssetCreated').decodeResults(event.topics!, event.data!));
    // }).onDone(() {
    //   print('done');
    // });

    // createNewAsset();
  }

  // void m() async {}

  void createNewAsset() async {
    final seller = EthPrivateKey.fromHex('ab7b84abe42038b00d6d452e23406520a18a3f0d80e3ace632907e71ba65882f');
    const assetId = 'YhMUu3BqvBbqFGKX3ltl';
    const assetLink = 'https://example.com/asset2';
    final price = BigInt.from(10000000000000000); // 0.01 ETH in Wei

    // final t = await getIt.get<Web3Client>().getBalance(seller);

    await createAsset(seller, assetId, assetLink, price);
  }

  Future<void> createAsset(Credentials seller, String assetId, String assetLink, BigInt price) async {
    // final abi = await rootBundle.loadString('assets/strings/abi.json');

    final createAssetFunction = contract.function('createAsset');

    await web3.sendTransaction(
      seller,
      Transaction.callContract(
        contract: contract,
        function: createAssetFunction,
        parameters: [assetId, assetLink, price],
      ),
      chainId: (await web3.getChainId()).toInt(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          elevation: 2,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: currentColorScheme(context).background,
          titleTextStyle: headline,
          centerTitle: false,
        ),
        tabBarTheme: const TabBarTheme(
          indicator: BoxDecoration(),
          labelPadding: EdgeInsets.zero,
          splashFactory: NoSplash.splashFactory,
          overlayColor: MaterialStatePropertyAll(Colors.transparent),
          dividerColor: Colors.transparent,
        ),
        textTheme: TextTheme(
          bodySmall: small,
          bodyMedium: medium,
          bodyLarge: large.copyWith(color: currentColorScheme(context).onBackground),
          titleSmall: larger,
          titleMedium: title,
          titleLarge: headline,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: currentColorScheme(context).surface),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: currentColorScheme(context).surface),
            borderRadius: BorderRadius.circular(8),
          ),
          hintStyle: medium.copyWith(color: currentColorScheme(context).onSurface),
          labelStyle: medium.copyWith(color: currentColorScheme(context).onBackground),
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: currentColorScheme(context).background,
          elevation: 0,
          labelTextStyle: MaterialStateProperty.resolveWith(
            (states) {
              final currentStyle = medium;
              if (states.contains(MaterialState.selected)) {
                return currentStyle.copyWith(
                  color: currentColorScheme(context).primary,
                  fontWeight: FontWeight.w600,
                );
              }

              return currentStyle;
            },
          ),
        ),
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
