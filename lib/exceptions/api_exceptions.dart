abstract class ApiExceptions implements Exception {
  int exceptionId;
  String toString();
}

class ParsingException extends ApiExceptions {
  ParsingException(int exceptionId);

  @override
  String toString() {
    return 'Parsing Failed : $exceptionId';
  }
}
