class EFormatException implements Exception {
  final String message;

  EFormatException(this.message);

  factory EFormatException.fromMessage(String message) {
    return EFormatException(message);
  }

  String get formattedException => message;

  factory EFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-date':
        return EFormatException('The date format is invalid. Please use the correct date format.');
      case 'invalid-number':
        return EFormatException('The number format is incorrect. Ensure the number is formatted correctly and retry.');
      case 'json-parsing':
        return EFormatException('JSON parsing error. Check if the JSON structure is correct.');
      case 'uri-parsing':
        return EFormatException('URI parsing error. Ensure the URI is correctly encoded.');
      case 'hex-color':
        return EFormatException('Invalid hex color format. Please provide a valid hex color code.');
      default:
        return EFormatException('Unknown format exception occurred.');
    }
  }
}
