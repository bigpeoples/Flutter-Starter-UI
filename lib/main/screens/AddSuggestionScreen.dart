import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/components/AppBarScoller.dart';
import 'package:mighty_ui_kit/main/models/AppModel.dart';
import 'package:mighty_ui_kit/main/services/SuggestionService.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppConstants.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class AddSuggestionScreen extends StatefulWidget {
  static String tag = '/AddSuggestionScreen';

  @override
  AddSuggestionScreenState createState() => AddSuggestionScreenState();
}

class AddSuggestionScreenState extends State<AddSuggestionScreen> {
  final formKey = GlobalKey<FormState>();
  SuggestionService suggestion = SuggestionService();

  TextEditingController feedCont = TextEditingController();

  FocusNode feedFocus = FocusNode();

  bool mIsLoading = false;
  bool mIsSuggestionExist = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    suggestion.getSuggestionByEmail(getStringAsync(UserEmail)).then((value) {
      feedCont.text = value.feedback.validate();
      feedCont.selection = TextSelection.fromPosition(TextPosition(offset: feedCont.text.length));

      mIsSuggestionExist = feedCont.text.validate().isNotEmpty;

      setState(() {});
    }).catchError((e) {
      return e;
    });
  }

  Future<void> add() async {
    mIsLoading = true;
    setState(() {});

    SuggestionModel data = SuggestionModel(
      name: getStringAsync(UserName),
      email: getStringAsync(UserEmail),
      feedback: feedCont.text.toString(),
      timestamp: Timestamp.now(),
    );

    await suggestion.isUserSuggestionExists(getStringAsync(UserEmail)).then((id) async {
      if (id.validate().isNotEmpty) {
        await suggestion.updateDocument(data.toJson(), id).then((value) {
          toast('Thank You!. We have received your suggestion');
        });
      } else {
        await suggestion.addDocument(data.toJson()).then((value) {
          toast('Thank You!. We have received your suggestion');
        });
      }
    }).catchError((e) {
      toast(e.toString());
    });

    mIsLoading = false;
    setState(() {});
    finish(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AppBarScroller(
          title: 'Give your suggestion',
          child: Stack(
            children: [
              Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 16),
                  child: Column(
                    children: [
                      AppTextField(
                        minLines: 5,
                        maxLines: 10,
                        focus: feedFocus,
                        controller: feedCont,
                        textFieldType: TextFieldType.OTHER,
                        autoFocus: true,
                        textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        validator: (v) {
                          if (v!.trim().isEmpty) return errorThisFieldRequired;
                          return null;
                        },
                        decoration: inputDecoration(label: 'Feedback'),
                        onFieldSubmitted: (s) {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            add();
                          }
                        },
                      ),
                      16.height,
                      AppButton(
                        width: context.width(),
                        color: appPrimaryColor,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                            hideKeyboard(context);
                            add();
                          }
                        },
                        text: mIsSuggestionExist ? 'Update' : 'Submit',
                      ),
                    ],
                  ),
                ),
              ),
              Loader().visible(mIsLoading),
            ],
          ),
        ),
      ),
    );
  }
}
