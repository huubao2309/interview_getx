import 'package:flutter/material.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/dialog_request.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/dialog_response.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/type_dialog.dart';
import 'package:get/get.dart';
import 'package:interview_getx/shared/dialog_manager/services/dialog_service.dart';
import 'package:interview_getx/shared/dialog_manager/view/dialog_one_button.dart';
import 'package:interview_getx/shared/dialog_manager/view/dialog_two_button.dart';

class DialogManager extends StatefulWidget {
  const DialogManager({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  final DialogService _dialogService = Get.find<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.showDialogListener = _showDialog;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  Future<void> _showDialog(DialogRequest request) async {
    await showDialog(
      context: context,
      barrierDismissible: request.isMustTapButton ?? false, // user must tap button!
      builder: (context) {
        return _chooseTypeDialog(request);
      },
    );
  }

  Widget _chooseTypeDialog(DialogRequest request) {
    switch (request.typeDialog) {
      case DIALOG_ONE_BUTTON:
        return _dialogOneButton(request);

      case DIALOG_TWO_BUTTON:
        return _dialogTwoButton(request);

      default:
        return _dialogOneButton(request);
    }
  }

  Widget _dialogOneButton(DialogRequest request) {
    return DialogOneButton(
      title: request.title ?? 'info'.tr,
      content: request.description,
      textButton: request.titleButton ?? 'ok'.tr,
      onPressed: () async {
        _dialogService.dialogComplete(DialogResponse(confirmed: true));
        // Hide popup
        Navigator.of(context).pop('dialog');
      },
    );
  }

  Widget _dialogTwoButton(DialogRequest request) {
    return DialogTwoButton(
      title: request.title ?? 'info'.tr,
      content: request.description,
      onPressedAgree: () {
        _dialogService.dialogComplete(DialogResponse(confirmed: true));
        Navigator.of(context).pop('dialog');
      },
      onPressedCancel: () {
        _dialogService.dialogComplete(DialogResponse(confirmed: false));
        Navigator.of(context).pop('dialog');
      },
    );
  }
}
