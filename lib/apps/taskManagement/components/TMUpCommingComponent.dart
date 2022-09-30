import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mighty_ui_kit/apps/taskManagement/model/TMNotesModel.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class TMUpComingComponent extends StatefulWidget {
  final TMNotesModel data;
  final Function() onEditClicked;
  final Function onDeleteClicked;
  final Function() onTapped;

  TMUpComingComponent({required this.data, required this.onEditClicked, required this.onDeleteClicked, required this.onTapped});

  @override
  State<TMUpComingComponent> createState() => _TMUpComingComponentState();
}

class _TMUpComingComponentState extends State<TMUpComingComponent> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: SettingItemWidget(
        title: widget.data.title.validate(),
        onTap: widget.onTapped,
        leading: noteCheckWidget(
          context,
          color: widget.data.isCheckList! ? tmSecondaryColor : context.cardColor,
          checkIconColor: widget.data.isCheckList! ? white : checkColor,
          onTap: () {
            widget.data.isCheckList = !widget.data.isCheckList!;
            setState(() {});
          },
        ),
        trailing: Row(
          children: [
            Text(widget.data.startTime.validate(), style: secondaryTextStyle(size: 12)),
            8.width,
            Icon(Icons.arrow_forward_ios_rounded, color: textSecondaryColorGlobal, size: 12),
          ],
        ),
      ),

      // secondaryActions: [
      //   Container(
      //     padding: EdgeInsets.all(12),
      //     decoration: boxDecorationDefault(shape: BoxShape.circle),
      //     child: Image.asset('images/toDoList/tm_editicon.png', height: 20, width: 20),
      //   ).onTap(widget.onEditClicked),
      //   Container(
      //     padding: EdgeInsets.all(12),
      //     decoration: boxDecorationDefault(shape: BoxShape.circle),
      //     child: Image.asset('images/toDoList/tm_delete.png', height: 20, width: 20, color: Colors.red),
      //   ).onTap(
      //     () {
      //       showConfirmDialogCustom(
      //         context,
      //         dialogType: DialogType.DELETE,
      //         title: 'Are you sure you want to delete the notes?',
      //         onAccept: (contexts) async {
      //           widget.onDeleteClicked.call();
      //         },
      //       );
      //     },
      //   ),
      // ],
    );
  }
}
