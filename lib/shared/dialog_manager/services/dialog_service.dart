import 'dart:async';

import 'package:interview_getx/shared/dialog_manager/data_models/dialog_request.dart';
import 'package:interview_getx/shared/dialog_manager/data_models/dialog_response.dart';

class DialogService {
  late Function(DialogRequest) showDialogListener;
  late Completer<DialogResponse> _dialogCompleter;

  Future<DialogResponse> showDialog({
    required String description,
    String? title,
    String? typeDialog,
    String? titleButton,
    bool isMustTapButton = false,
  }) {
    _dialogCompleter = Completer<DialogResponse>();
    showDialogListener(DialogRequest(
      title: title,
      description: description,
      typeDialog: typeDialog,
      titleButton: titleButton,
      isMustTapButton: isMustTapButton,
    ));
    return _dialogCompleter.future;
  }

  void dialogComplete(DialogResponse response) {
    _dialogCompleter.complete(response);
  }
}
