class CustomExceptions implements Exception {
  final _message;
  final _prefix;

  CustomExceptions([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomExceptions {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}