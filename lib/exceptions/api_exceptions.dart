mixin ApiExceptions implements Exception {
  int exceptionId;
  dynamic message;

  String toString();
}

class ParsingException implements ApiExceptions {
  @override
  dynamic message;

  ParsingException(this.message);

  @override
  int exceptionId = 0;

  @override
  String toString() {
    return 'Parsing Failed : $exceptionId';
  }
}

class NoInternetException implements ApiExceptions {
  @override
  dynamic message;
  @override
  int exceptionId = 2;

  NoInternetException({this.message = "Internet Not Connected!"});

  @override
  String toString() {
    return 'No Internet Connected : $exceptionId';
  }
}
