import 'package:flutter/cupertino.dart';
import 'package:mynotes/extentions/buildcontext/loc.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: context.loc.delete,
    content: context.loc.delete_note_prompt,
    optionBuilder: () => {
      context.loc.cancel: false,
      context.loc.yes: true,
    },
  ).then((value) => value ?? false);
}