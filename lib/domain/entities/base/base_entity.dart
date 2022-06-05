abstract class BaseEntity {
  BaseEntity({
    this.hasError = false,
    this.messageError = '',
    this.statusCode,
  });

  final bool hasError;
  final String messageError;
  int? statusCode;
}
