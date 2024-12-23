enum ErrorTypes {
  invalidInput(100),
  emailAlreadyExists(101),
  emailNotVerified(102);

  final int code;

  const ErrorTypes(this.code);
}
