class DialogResponse {
  DialogResponse({
    required this.confirmed,
    this.fieldOnText1,
    this.fieldOnText2,
  });

  final bool confirmed;
  final String? fieldOnText1;
  final String? fieldOnText2;
}
