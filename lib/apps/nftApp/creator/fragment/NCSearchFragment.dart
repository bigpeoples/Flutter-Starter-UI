import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/StepperOneWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/StepperSecondWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/StepperThirdWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

import '../../../../main.dart';

class NCSearchFragment extends StatefulWidget {
  @override
  NCSearchFragmentState createState() => NCSearchFragmentState();
}

class NCSearchFragmentState extends State<NCSearchFragment> {
  int currentStep = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    List<Step> step = [
      Step(title: Text('Step 1'), content: StepperOneWidget(), isActive: true, state: currentStep == 0 ? StepState.editing : StepState.indexed),
      Step(title: Text('Step 2'), content: StepperSecondWidget(), isActive: true, state: currentStep == 1 ? StepState.editing : StepState.indexed),
      Step(title: Text('Step 3'), content: StepperThirdWidget(), isActive: true, state: currentStep == 2 ? StepState.editing : StepState.indexed),
    ];
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add wallet to pay', style: boldTextStyle(size: 22)),
          SizedBox(height: 8),
          Text('Easy to sell your Digital Art with 3 step', style: primaryTextStyle()),
          SizedBox(height: 16),
          Expanded(
            child: Theme(
              data: appStore.isDarkModeOn ? ThemeData.dark() : ThemeData.light(),
              child: Stepper(
                controlsBuilder: (context, ControlsDetails) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: currentStep != 2,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.grey)),
                          onPressed: () {
                            setState(() {
                              if (currentStep < step.length) {
                                if (currentStep == 0) {
                                  currentStep = currentStep + 1;
                                } else if (currentStep == 1) {
                                  currentStep = currentStep + 1;
                                }
                              } else {
                                currentStep = 0;
                              }
                            });
                          },
                          child: Text('Continue', style: boldTextStyle(color: nftPrimaryColor)),
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.grey)),
                        onPressed: () {
                          setState(() {
                            if (step.length > 0) {
                              if (currentStep != 0) {
                                currentStep--;
                              }
                            } else {
                              currentStep = 0;
                            }
                          });
                        },
                        child: Text('Cancel', style: boldTextStyle(color: nftPrimaryColor)),
                      ),
                    ],
                  );
                },
                elevation: 2,
                currentStep: currentStep,
                steps: step,
                type: StepperType.horizontal,
                onStepTapped: (step) {
                  setState(() {
                    currentStep = step;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
