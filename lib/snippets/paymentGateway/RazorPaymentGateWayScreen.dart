import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppConstants.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPaymentGateWayScreen extends StatefulWidget {
  static String tag = '/RazorPaymentGateWayScreen';

  @override
  RazorPaymentGateWayScreenState createState() => RazorPaymentGateWayScreenState();
}

class RazorPaymentGateWayScreenState extends State<RazorPaymentGateWayScreen> {
  late Razorpay razorPay;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    razorPay = Razorpay();
    razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorPay.clear();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: AppButton(
            color: appStore.cardColor,
            height: 40,
            width: 160,
            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text('Pay with RazorPay', style: boldTextStyle(size: 14)),
            onTap: () {
              payment();
            },
          ),
        ),
      ),
    );
  }

  void payment() async {
    var options = {
      'key': RazorPayKey,
      'amount': 2000,
      'name': 'Razorpay T-Shirt',
      'theme.color': '#4C76EA',
      'image': 'https://www.73lines.com/web/image/12427',
      'description': 'Razorpay T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'john@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorPay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "SUCCESS: " + response.paymentId!);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "ERROR: " + response.code.toString() + " - " + response.message!);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "EXTERNAL_WALLET: " + response.walletName!);
  }
}
