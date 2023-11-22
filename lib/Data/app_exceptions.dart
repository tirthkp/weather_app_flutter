class AppExceptions implements Exception {
  final String? _prefix;
  final String? _message;

  AppExceptions([this._prefix, this._message]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message])
      : super(message, 'Internet error issues');
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message, 'Request Timeout');
}

class ServerError extends AppExceptions {
  ServerError([String? message]) : super(message, 'Server Error');
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message, 'Invalid Url');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, 'Failed to fetch data from server');
}
