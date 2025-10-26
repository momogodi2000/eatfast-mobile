/// Safe JSON Parsing Utilities
/// Prevents runtime crashes from null or unexpected JSON values
///
/// Usage:
/// ```dart
/// latitude: SafeJsonParsing.parseDouble(json['latitude']),
/// count: SafeJsonParsing.parseInt(json['count']),
/// name: SafeJsonParsing.parseString(json['name']),
/// ```
class SafeJsonParsing {
  SafeJsonParsing._(); // Private constructor - utility class

  /// Safely parse double from dynamic value
  /// Returns defaultValue if value is null or cannot be parsed
  static double parseDouble(dynamic value, {double defaultValue = 0.0}) {
    if (value == null) return defaultValue;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      final parsed = double.tryParse(value);
      return parsed ?? defaultValue;
    }
    return defaultValue;
  }

  /// Safely parse int from dynamic value
  /// Returns defaultValue if value is null or cannot be parsed
  static int parseInt(dynamic value, {int defaultValue = 0}) {
    if (value == null) return defaultValue;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) {
      final parsed = int.tryParse(value);
      return parsed ?? defaultValue;
    }
    return defaultValue;
  }

  /// Safely parse String from dynamic value
  /// Returns defaultValue if value is null
  static String parseString(dynamic value, {String defaultValue = ''}) {
    if (value == null) return defaultValue;
    if (value is String) return value;
    return value.toString();
  }

  /// Safely parse bool from dynamic value
  /// Returns defaultValue if value is null or cannot be parsed
  static bool parseBool(dynamic value, {bool defaultValue = false}) {
    if (value == null) return defaultValue;
    if (value is bool) return value;
    if (value is int) return value != 0;
    if (value is String) {
      final lower = value.toLowerCase();
      if (lower == 'true' || lower == '1') return true;
      if (lower == 'false' || lower == '0') return false;
    }
    return defaultValue;
  }

  /// Safely parse DateTime from dynamic value
  /// Returns defaultValue if value is null or cannot be parsed
  static DateTime? parseDateTime(dynamic value, {DateTime? defaultValue}) {
    if (value == null) return defaultValue;
    if (value is DateTime) return value;
    if (value is String) {
      try {
        return DateTime.parse(value);
      } catch (e) {
        return defaultValue;
      }
    }
    if (value is int) {
      try {
        // Assume Unix timestamp (milliseconds)
        return DateTime.fromMillisecondsSinceEpoch(value);
      } catch (e) {
        return defaultValue;
      }
    }
    return defaultValue;
  }

  /// Safely parse List from dynamic value
  /// Returns empty list if value is null or not a list
  static List<T> parseList<T>(
    dynamic value, {
    List<T> defaultValue = const [],
    T Function(dynamic)? itemParser,
  }) {
    if (value == null) return List<T>.from(defaultValue);
    if (value is! List) return List<T>.from(defaultValue);

    if (itemParser != null) {
      return value.map((item) {
        try {
          return itemParser(item);
        } catch (e) {
          return null;
        }
      }).whereType<T>().toList();
    }

    return List<T>.from(value.whereType<T>());
  }

  /// Safely parse Map from dynamic value
  /// Returns empty map if value is null or not a map
  static Map<String, dynamic> parseMap(
    dynamic value, {
    Map<String, dynamic> defaultValue = const {},
  }) {
    if (value == null) return Map<String, dynamic>.from(defaultValue);
    if (value is Map) return Map<String, dynamic>.from(value);
    return Map<String, dynamic>.from(defaultValue);
  }

  /// Safely parse nullable double
  /// Returns null if value is null or cannot be parsed
  static double? parseDoubleNullable(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  /// Safely parse nullable int
  /// Returns null if value is null or cannot be parsed
  static int? parseIntNullable(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }

  /// Safely parse nullable String
  /// Returns null if value is null
  static String? parseStringNullable(dynamic value) {
    if (value == null) return null;
    if (value is String) return value;
    return value.toString();
  }

  /// Safely parse enum from string value
  /// Returns defaultValue if value is null or not found in enum values
  static T parseEnum<T extends Enum>(
    dynamic value,
    List<T> enumValues, {
    required T defaultValue,
  }) {
    if (value == null) return defaultValue;

    final String stringValue = value.toString().toLowerCase();

    for (final enumValue in enumValues) {
      if (enumValue.name.toLowerCase() == stringValue) {
        return enumValue;
      }
    }

    return defaultValue;
  }

  /// Safely parse duration from seconds
  static Duration parseDuration(dynamic value, {Duration defaultValue = Duration.zero}) {
    final seconds = parseInt(value, defaultValue: defaultValue.inSeconds);
    return Duration(seconds: seconds);
  }

  /// Safely parse color from hex string
  /// Returns null if value is null or invalid format
  static int? parseColorHex(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is! String) return null;

    String hexColor = value.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor'; // Add alpha if not present
    }

    return int.tryParse(hexColor, radix: 16);
  }
}

/// Extension methods for convenient JSON parsing
extension SafeMapParsing on Map<String, dynamic> {
  /// Safely get double value
  double getDouble(String key, {double defaultValue = 0.0}) {
    return SafeJsonParsing.parseDouble(this[key], defaultValue: defaultValue);
  }

  /// Safely get int value
  int getInt(String key, {int defaultValue = 0}) {
    return SafeJsonParsing.parseInt(this[key], defaultValue: defaultValue);
  }

  /// Safely get String value
  String getString(String key, {String defaultValue = ''}) {
    return SafeJsonParsing.parseString(this[key], defaultValue: defaultValue);
  }

  /// Safely get bool value
  bool getBool(String key, {bool defaultValue = false}) {
    return SafeJsonParsing.parseBool(this[key], defaultValue: defaultValue);
  }

  /// Safely get DateTime value
  DateTime? getDateTime(String key, {DateTime? defaultValue}) {
    return SafeJsonParsing.parseDateTime(this[key], defaultValue: defaultValue);
  }

  /// Safely get List value
  List<T> getList<T>(String key, {List<T> defaultValue = const []}) {
    return SafeJsonParsing.parseList<T>(this[key], defaultValue: defaultValue);
  }

  /// Safely get Map value
  Map<String, dynamic> getMap(String key, {Map<String, dynamic> defaultValue = const {}}) {
    return SafeJsonParsing.parseMap(this[key], defaultValue: defaultValue);
  }

  /// Safely get nullable double value
  double? getDoubleNullable(String key) {
    return SafeJsonParsing.parseDoubleNullable(this[key]);
  }

  /// Safely get nullable int value
  int? getIntNullable(String key) {
    return SafeJsonParsing.parseIntNullable(this[key]);
  }

  /// Safely get nullable String value
  String? getStringNullable(String key) {
    return SafeJsonParsing.parseStringNullable(this[key]);
  }
}
