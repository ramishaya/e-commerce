class EFireBaseException implements Exception {
  final String code;

  EFireBaseException(this.code);

  String get message {
    switch (code) {
      case 'cancelled':
        return 'The operation was cancelled (typically by the caller).';
      case 'unknown':
        return 'Unknown error or an error from a different error domain.';
      case 'invalid-argument':
        return 'Client specified an invalid argument. Note that this differs from "failed-precondition". "invalid-argument" indicates arguments that are problematic regardless of the state of the system (e.g., a malformed file name).';
      case 'deadline-exceeded':
        return 'Deadline expired before the operation could complete. For operations that change the state of the system, this error may be returned even if the operation has completed successfully (for example, a successful response from a server could have been delayed long enough for the deadline to expire).';
      case 'not-found':
        return 'Some requested document was not found.';
      case 'already-exists':
        return 'Some document that we attempted to create already exists.';
      case 'permission-denied':
        return 'The caller does not have permission to execute the specified operation.';
      case 'resource-exhausted':
        return 'Some resource has been exhausted, perhaps a per-user quota, or perhaps the entire file system is out of space.';
      case 'failed-precondition':
        return 'Operation was rejected because the system is not in a state required for the operation\'s execution.';
      case 'aborted':
        return 'The operation was aborted, typically due to a concurrency issue like transaction aborts, etc.';
      case 'out-of-range':
        return 'Operation was attempted past the valid range. E.g., seeking or reading past end of a file.';
      case 'unimplemented':
        return 'Operation is not implemented or not supported/enabled in this service.';
      case 'internal':
        return 'Internal errors. This means that some invariants expected by the underlying system have been broken. This error code is reserved for serious errors.';
      case 'unavailable':
        return 'The service is currently unavailable. This is most likely a transient condition and may be corrected by retrying with a backoff.';
      case 'data-loss':
        return 'Unrecoverable data loss or corruption.';
      case 'unauthenticated':
        return 'The request does not have valid authentication credentials for the operation.';
      default:
        return 'An undefined Error happened.';
    }
  }

  @override
  String toString() {
    return message;
  }
}
