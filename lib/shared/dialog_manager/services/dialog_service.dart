import 'dart:async';

import 'package:interview_getx/shared/dialog_manager/data_models/request/language_dialog_resquest.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/response/language_dialog_response.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/request/common_dialog_request.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/response/common_dialog_response.dart';

class DialogService {
  late Function(CommonDialogRequest) showCommonDialogListener;
  late Completer<CommonDialogResponse> _commonDialogCompleter;

  late Function(LanguageDialogRequest) showLanguageDialogListener;
  late Completer<LanguageDialogResponse> _languageDialogCompleter;

  Future<CommonDialogResponse> showDialog({
    required String description,
    String? title,
    String? typeDialog,
    String? titleButton,
    bool isMustTapButton = false,
  }) {
    _commonDialogCompleter = Completer<CommonDialogResponse>();
    showCommonDialogListener(CommonDialogRequest(
      title: title,
      description: description,
      typeDialog: typeDialog,
      titleButton: titleButton,
      isMustTapButton: isMustTapButton,
    ));
    return _commonDialogCompleter.future;
  }

  Future<LanguageDialogResponse> showLanguageDialog({
    required List<String> languages,
    bool isMustTapButton = false,
  }) {
    _languageDialogCompleter = Completer<LanguageDialogResponse>();
    showLanguageDialogListener(LanguageDialogRequest(
      languages: languages,
      isMustTapButton: isMustTapButton,
    ));
    return _languageDialogCompleter.future;
  }

  void commonDialogComplete(CommonDialogResponse response) {
    _commonDialogCompleter.complete(response);
  }

  void languageDialogComplete(LanguageDialogResponse response) {
    _languageDialogCompleter.complete(response);
  }
}
