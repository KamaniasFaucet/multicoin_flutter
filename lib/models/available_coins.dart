import 'dart:math';

import 'package:multicoinlib_flutter/multicoinlib_flutter.dart';

import 'coin.dart';

class AvailableCoins {
  static final Map<String, Coin> _availableCoinList = {
    'peercoin': Coin(
      name: 'peercoin',
      displayName: 'Deutsche eMark',
      uriCode: 'peercoin',
      letterCode: 'DEM',
      iconPath: 'assets/icon/ppc-icon-48.png',
      iconPathTransparent: 'assets/icon/ppc-icon-white-48.png',
      networkType: Network.mainnet,
      opreturnSize: 256,
      fractions: 6,
      minimumTxValue: 10000,
      fixedFee: true,
      fixedFeePerKb: 0.02,
      explorerUrl: 'https://chainz.cryptoid.info/dem/',
      genesisHash: '000000bc0ddf15573115c44b81d8b10e9ebd868b5c967f408bda273656f30e28',
      txVersion: 3,
      electrumRequiredProtocol: 1.4,
      electrumServers: [
        'wss://electrum1.deutsche-emark.com:50004',
        'wss://electrum2.deutsche-emark.com:50004',
      ],
      marismaServers: [
        ('marisma.ppc.lol', 8443),
      ],
    ),
    'peercoinTestnet': Coin(
      name: 'peercoinTestnet',
      displayName: 'Deutsche eMark Testnet',
      uriCode: 'peercoin',
      letterCode: 'tPPC',
      iconPath: 'assets/icon/ppc-icon-48-grey.png',
      iconPathTransparent: 'assets/icon/ppc-icon-48-grey.png',
      networkType: Network.testnet,
      opreturnSize: 256,
      fixedFee: true,
      fractions: 6,
      minimumTxValue: 10000,
      fixedFeePerKb: 0.01,
      explorerUrl: 'https://tblockbook.peercoin.net',
      genesisHash:
          '00000001f757bb737f6596503e17cd17b0658ce630cc727c0cca81aec47c9f06',
      txVersion: 3,
      electrumRequiredProtocol: 1.4,
      electrumServers: [
        'wss://testnet-electrum.peercoinexplorer.net:50009',
        'wss://allingas.peercoinexplorer.net:50009',
      ],
      marismaServers: [
        ('test-marisma.ppc.lol', 2096),
      ],
    ),
  };

  static Map<String, Coin> get availableCoins {
    return _availableCoinList;
  }

  static Coin getSpecificCoin(String identifier) {
    final coin = identifier.split('_').first;
    if (_availableCoinList.containsKey(coin)) {
      return _availableCoinList[coin]!;
    } else {
      throw Exception('Coin not found');
    }
  }

  static int getDecimalProduct({
    required String identifier,
  }) {
    return pow(
      10,
      getSpecificCoin(identifier).fractions,
    ).toInt();
  }
}
