import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:signature/signature.dart';

class MWDigitalSignatureListScreen1 extends StatefulWidget {
  @override
  MWDigitalSignatureListScreen1State createState() => MWDigitalSignatureListScreen1State();
}

class MWDigitalSignatureListScreen1State extends State<MWDigitalSignatureListScreen1> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 4,
    penColor: black,
    exportBackgroundColor: salmon,
  );

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
      bottomNavigationBar: Container(
        width: context.width(),
        decoration: BoxDecoration(color: Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.check),
              color: white,
              onPressed: () async {
                if (_controller.isNotEmpty) {
                  final Uint8List? data = await _controller.toPngBytes();
                  if (data != null) {
                    await Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return Scaffold(
                            appBar: AppBar(),
                            body: Center(
                              child: Container(
                                color: Colors.grey[300],
                                child: Image.memory(data),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
              },
            ),
            //CLEAR CANVAS
            IconButton(
              icon: Icon(Icons.clear),
              color: white,
              onPressed: () {
                setState(() => _controller.clear());
              },
            ),
          ],
        ),
      ),
      body: Signature(
        controller: _controller,
        height: context.height(),
        backgroundColor: salmon,
      ),
    );
  }
}
