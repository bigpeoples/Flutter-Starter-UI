import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:nb_utils/nb_utils.dart';

class BarCodeScannerScreen extends StatefulWidget {
  @override
  BarCodeScannerScreenState createState() => BarCodeScannerScreenState();
}

class BarCodeScannerScreenState extends State<BarCodeScannerScreen> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () => scanBarcodeNormal(), child: Text('Scan Barcode')),
          8.height,
          Text('Scan result : $_scanBarcode\n', style: TextStyle(fontSize: 20)),
        ],
      ).center(),
    );
  }
}
