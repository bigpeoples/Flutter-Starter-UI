import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import '../../main/models/StripModel.dart';
import '../../main/utils/AppConstants.dart';

class StripePaymentScreen extends StatefulWidget {
  @override
  StripePaymentScreenState createState() => StripePaymentScreenState();
}

class StripePaymentScreenState extends State<StripePaymentScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    Stripe.publishableKey = STRIPE_PAYMENT_PUBLISH_KEY;
    if (Platform.isIOS) {
      Stripe.merchantIdentifier = "YOUR_App_Identifier";
      await Stripe.instance.applySettings();
    }
  }

  void stripePay() async {
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: 'Bearer $stripePaymentKey',
      HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
    };

    var request = http.Request('POST', Uri.parse(stripeURL));

    request.bodyFields = {
      'amount': '${(500 * 100).toInt()}',
      'currency': 'INR'.toLowerCase(),
    };

    request.headers.addAll(headers);

    await request.send().then((value) {
      http.Response.fromStream(value).then((response) async {
        if (response.statusCode == 200) {
          var res = StripePayModel.fromJson(await handleResponse(response));

          await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: res.client_secret!,
              testEnv: true,
              merchantCountryCode: 'IN',
              merchantDisplayName: 'MeetMighty',
              customerId: Platform.isIOS ? null : '1',
              customerEphemeralKeySecret: res.client_secret!,
              setupIntentClientSecret: res.client_secret!,
            ),
          );

          await Stripe.instance.presentPaymentSheet(parameters: PresentPaymentSheetParameters(clientSecret: res.client_secret!, confirmPayment: true)).then(
            (value) async {
              toast("Payment Successfully");
            },
          ).catchError((e) {
            print("presentPaymentSheet ${e.toString()}");
          });
        }
      }).catchError((e) {
        print(e.toString());
      });
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        width: context.width(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            16.height,
            AppButton(
              color: context.cardColor,
              child: Text("Pay with StripPayment", style: boldTextStyle(size: 14)),
              onTap: () {
                stripePay();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future handleResponse(http.Response response, [bool? avoidTokenError]) async {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      try {
        var body = jsonDecode(response.body);
        throw parseHtmlString(body['message']);
      } on Exception catch (e) {
        log(e);
      }
    }
  }
}

String parseHtmlString(String? htmlString) {
  return parse(parse(htmlString).body!.text).documentElement!.text;
}
