class DialogRequest {
  DialogRequest({
    required this.description,
    this.title,
    this.typeDialog,
    this.isMustTapButton,
    this.titleButton,
  });

  final String? title;
  final String description;
  final String? typeDialog;
  final bool? isMustTapButton;
  final String? titleButton;
}
