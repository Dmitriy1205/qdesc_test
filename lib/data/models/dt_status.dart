class DtStatus {
  final bool isInitial;
  final bool isLoading;
  final bool isError;
  final bool isLoaded;
  final String? errorMessage;
  final String? attribute;

  DtStatus._({
    this.isInitial = false,
    this.isLoading = false,
    this.isError = false,
    this.isLoaded = false,
    this.errorMessage,
    this.attribute,
  });

  factory DtStatus.initial() => DtStatus._(isInitial: true);

  factory DtStatus.loading() => DtStatus._(isLoading: true);

  factory DtStatus.loaded() => DtStatus._(isLoaded: true);

  factory DtStatus.error([String? message, String? attribute]) {
    return DtStatus._(
      isError: true,
      isLoading: false,
      errorMessage: message,
      attribute: attribute,
    );
  }
}
