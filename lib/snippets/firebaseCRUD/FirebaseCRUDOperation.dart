import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/snippets/firebaseCRUD/CRUD/FirebaseCreate.dart';
import 'package:mighty_ui_kit/snippets/firebaseCRUD/CRUD/FirebaseRead.dart';
import 'package:nb_utils/nb_utils.dart';

class FirebaseCRUDOperation extends StatefulWidget {
  static String tag = '/FirebaseCRUDOperation';

  @override
  FirebaseCRUDOperationState createState() => FirebaseCRUDOperationState();
}

class FirebaseCRUDOperationState extends State<FirebaseCRUDOperation> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
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
          AppButton(
            color: appStore.cardColor,
            onTap: () {
              FirebaseCreate().launch(context);
            },
            child: Text("Firebase Create", style: boldTextStyle()),
          ),
          16.height,
          AppButton(
            color: appStore.cardColor,
            onTap: () {
              FirebaseRead().launch(context);
            },
            child: Text("Firebase Read, Update & delete", style: boldTextStyle()),
          ),
        ],
      ).center(),
    );
  }
}
