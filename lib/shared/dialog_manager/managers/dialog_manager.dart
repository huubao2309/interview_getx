import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/request/common_dialog_request.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/request/language_dialog_resquest.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/response/common_dialog_response.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/response/language_dialog_response.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/type_dialog.dart';
import 'package:interview_getx/shared/dialog_manager/services/dialog_service.dart';
import 'package:interview_getx/shared/dialog_manager/view/chosen_language_dialog.dart';
import 'package:interview_getx/shared/dialog_manager/view/dialog_one_button.dart';
import 'package:interview_getx/shared/dialog_manager/view/dialog_two_button.dart';

class DialogManager extends StatefulWidget {
  const DialogManager({required this.child});

  final Widget child;

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  final DialogService _dialogService = Get.find<DialogService>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _dialogService
      ..showCommonDialogListener = _showDialog
      ..showLanguageDialogListener = _showLanguageDialog;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  Future<void> _showDialog(CommonDialogRequest request) async {
    await Get.dialog(
      _chooseTypeDialog(request),
      barrierDismissible: request.isMustTapButton ?? false, // user must tap button!
    );
  }

  Future<void> _showLanguageDialog(LanguageDialogRequest request) async {
    await Get.dialog(
      _dialogLanguage(request),
      barrierDismissible: request.isMustTapButton ?? false, // user must tap button!
    );
  }

  Widget _chooseTypeDialog(CommonDialogRequest request) {
    switch (request.typeDialog) {
      case DIALOG_ONE_BUTTON:
        return _dialogOneButton(request);

      case DIALOG_TWO_BUTTON:
        return _dialogTwoButton(request);

      default:
        return _dialogOneButton(request);
    }
  }

  Widget _dialogOneButton(CommonDialogRequest request) {
    return DialogOneButton(
      title: request.title ?? 'info'.tr,
      content: request.description,
      textButton: request.titleButton ?? 'ok'.tr,
      onPressed: () async {
        _dialogService.commonDialogComplete(CommonDialogResponse(confirmed: true));
        // Hide popup
        Get.back();
      },
    );
  }

  Widget _dialogTwoButton(CommonDialogRequest request) {
    return DialogTwoButton(
      title: request.title ?? 'info'.tr,
      content: request.description,
      onPressedAgree: () {
        _dialogService.commonDialogComplete(CommonDialogResponse(confirmed: true));
        Get.back();
      },
      onPressedCancel: () {
        _dialogService.commonDialogComplete(CommonDialogResponse(confirmed: false));
        Get.back();
      },
    );
  }

  Widget _dialogLanguage(LanguageDialogRequest request) {
    return ChosenLanguageDialog(
      languages: request.languages,
      onChooseLanguage: (language) {
        _dialogService.languageDialogComplete(LanguageDialogResponse(language: language));
        Get.back();
      },
    );
  }
}
