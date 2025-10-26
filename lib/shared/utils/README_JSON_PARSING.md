# Safe JSON Parsing Utility Guide

## Overview

The `SafeJsonParsing` utility prevents runtime crashes caused by null or unexpected values in JSON responses. This is critical for production stability.

## Problem Statement

**UNSAFE** (current pattern in 150+ places):
```dart
class Restaurant {
  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      latitude: (json['latitude'] as num).toDouble(), // ❌ CRASHES if null!
      rating: (json['rating'] as num).toDouble(),     // ❌ CRASHES if null!
      orderCount: json['orderCount'] as int,          // ❌ CRASHES if null!
    );
  }
}
```

**What happens**: If backend returns `null` or wrong type → **App crashes!**

## Solution

**SAFE** (using SafeJsonParsing):
```dart
import 'package:eatfast_mobile/shared/utils/json_parsing_utils.dart';

class Restaurant {
  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      latitude: SafeJsonParsing.parseDouble(json['latitude']),     // ✅ Returns 0.0 if null
      rating: SafeJsonParsing.parseDouble(json['rating']),         // ✅ Returns 0.0 if null
      orderCount: SafeJsonParsing.parseInt(json['orderCount']),    // ✅ Returns 0 if null
    );
  }
}
```

**Result**: If backend returns `null` → **App continues with default value!**

---

## Usage Examples

### 1. Basic Types

```dart
import 'package:eatfast_mobile/shared/utils/json_parsing_utils.dart';

// Parse double
double price = SafeJsonParsing.parseDouble(json['price']);
double priceWithDefault = SafeJsonParsing.parseDouble(json['price'], defaultValue: 9.99);

// Parse int
int quantity = SafeJsonParsing.parseInt(json['quantity']);
int age = SafeJsonParsing.parseInt(json['age'], defaultValue: 18);

// Parse String
String name = SafeJsonParsing.parseString(json['name']);
String city = SafeJsonParsing.parseString(json['city'], defaultValue: 'Yaoundé');

// Parse bool
bool isActive = SafeJsonParsing.parseBool(json['isActive']);
bool verified = SafeJsonParsing.parseBool(json['verified'], defaultValue: false);
```

### 2. Nullable Values

```dart
// Returns null instead of crashing
double? optionalPrice = SafeJsonParsing.parseDoubleNullable(json['discount']);
int? optionalCount = SafeJsonParsing.parseIntNullable(json['likes']);
String? optionalNote = SafeJsonParsing.parseStringNullable(json['note']);
```

### 3. DateTime Parsing

```dart
// Parse from ISO string
DateTime? createdAt = SafeJsonParsing.parseDateTime(json['createdAt']);

// Parse from Unix timestamp
DateTime? timestamp = SafeJsonParsing.parseDateTime(json['timestamp']);

// With default value
DateTime orderDate = SafeJsonParsing.parseDateTime(
  json['orderDate'],
  defaultValue: DateTime.now(),
);
```

### 4. Lists and Maps

```dart
// Parse list of strings
List<String> tags = SafeJsonParsing.parseList<String>(json['tags']);

// Parse list with custom parser
List<Restaurant> restaurants = SafeJsonParsing.parseList<Restaurant>(
  json['restaurants'],
  itemParser: (item) => Restaurant.fromJson(item),
);

// Parse map
Map<String, dynamic> metadata = SafeJsonParsing.parseMap(json['metadata']);
```

### 5. Enums

```dart
enum OrderStatus { pending, confirmed, preparing, ready, delivered }

OrderStatus status = SafeJsonParsing.parseEnum(
  json['status'],
  OrderStatus.values,
  defaultValue: OrderStatus.pending,
);
```

### 6. Extension Methods (Convenient Syntax)

```dart
// Instead of:
double price = SafeJsonParsing.parseDouble(json['price']);

// Use extension:
double price = json.getDouble('price');

// More examples:
int count = json.getInt('count');
String name = json.getString('name');
bool active = json.getBool('isActive');
DateTime? date = json.getDateTime('createdAt');
List<String> tags = json.getList<String>('tags');
Map<String, dynamic> meta = json.getMap('metadata');

// Nullable
double? discount = json.getDoubleNullable('discount');
int? rating = json.getIntNullable('rating');
```

---

## Complete Model Example

### Before (UNSAFE)
```dart
class Order {
  final String id;
  final double totalPrice;
  final int itemCount;
  final DateTime createdAt;
  final OrderStatus status;

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as String,                              // ❌ Crashes if null
      totalPrice: (json['totalPrice'] as num).toDouble(),    // ❌ Crashes if null
      itemCount: json['itemCount'] as int,                   // ❌ Crashes if null
      createdAt: DateTime.parse(json['createdAt']),          // ❌ Crashes if invalid
      status: OrderStatus.values.firstWhere(
        (e) => e.name == json['status'],                     // ❌ Crashes if not found
      ),
    );
  }
}
```

### After (SAFE)
```dart
import 'package:eatfast_mobile/shared/utils/json_parsing_utils.dart';

class Order {
  final String id;
  final double totalPrice;
  final int itemCount;
  final DateTime createdAt;
  final OrderStatus status;

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json.getString('id'),                              // ✅ Safe
      totalPrice: json.getDouble('totalPrice'),              // ✅ Safe
      itemCount: json.getInt('itemCount'),                   // ✅ Safe
      createdAt: json.getDateTime('createdAt') ?? DateTime.now(), // ✅ Safe
      status: SafeJsonParsing.parseEnum(
        json['status'],
        OrderStatus.values,
        defaultValue: OrderStatus.pending,                   // ✅ Safe
      ),
    );
  }
}
```

---

## Migration Guide

### Step 1: Import the utility
```dart
import 'package:eatfast_mobile/shared/utils/json_parsing_utils.dart';
```

### Step 2: Replace unsafe patterns

| ❌ Unsafe Pattern | ✅ Safe Replacement |
|-------------------|---------------------|
| `json['field'] as double` | `json.getDouble('field')` |
| `json['field'] as int` | `json.getInt('field')` |
| `json['field'] as String` | `json.getString('field')` |
| `json['field'] as bool` | `json.getBool('field')` |
| `(json['field'] as num).toDouble()` | `json.getDouble('field')` |
| `DateTime.parse(json['field'])` | `json.getDateTime('field')` |
| `json['field'] as List` | `json.getList<T>('field')` |

### Step 3: Add default values where needed
```dart
// Before
double price = json.getDouble('price');

// After (with meaningful default)
double price = json.getDouble('price', defaultValue: 0.0);
```

---

## Files to Update (Priority Order)

Based on the audit, these have the most unsafe conversions:

### High Priority (Most Critical)
1. `lib/shared/models/restaurant.dart` (~30 conversions)
2. `lib/shared/models/order.dart` (~25 conversions)
3. `lib/shared/models/menu_item.dart` (~20 conversions)
4. `lib/shared/services/restaurants/domain/models/*.dart`
5. `lib/shared/services/orders/domain/models/*.dart`

### Medium Priority
6. All other model files in `lib/shared/models/`
7. Repository implementations in `lib/**/data/`
8. Service files with JSON parsing

### Low Priority
9. Widget-level JSON parsing (usually already has data validation)

---

## Testing Recommendations

### Unit Tests
```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:eatfast_mobile/shared/utils/json_parsing_utils.dart';

void main() {
  group('SafeJsonParsing', () {
    test('parseDouble handles null', () {
      expect(SafeJsonParsing.parseDouble(null), equals(0.0));
    });

    test('parseDouble handles string numbers', () {
      expect(SafeJsonParsing.parseDouble('123.45'), equals(123.45));
    });

    test('parseInt handles invalid strings', () {
      expect(SafeJsonParsing.parseInt('invalid'), equals(0));
    });

    test('parseEnum returns default for invalid value', () {
      enum TestEnum { value1, value2 }
      final result = SafeJsonParsing.parseEnum(
        'invalid',
        TestEnum.values,
        defaultValue: TestEnum.value1,
      );
      expect(result, equals(TestEnum.value1));
    });
  });
}
```

---

## Benefits

✅ **Crash Prevention**: No more null pointer exceptions from JSON parsing
✅ **Type Safety**: Handles type mismatches gracefully
✅ **Consistent Behavior**: Same parsing logic across entire app
✅ **Better UX**: App continues with defaults instead of crashing
✅ **Easier Debugging**: Clear default values make issues obvious
✅ **Backend Flexibility**: Tolerates API changes without crashing

---

## Performance Considerations

- ✅ **Zero overhead** for correct types (direct cast)
- ✅ **Minimal overhead** for conversions (simple type checks)
- ✅ **No reflection** used (fully type-safe)
- ✅ **Inline-optimized** by Dart compiler

---

## Best Practices

### DO ✅
```dart
// Use meaningful default values
double price = json.getDouble('price', defaultValue: 0.0);
int rating = json.getInt('rating', defaultValue: 1);
String status = json.getString('status', defaultValue: 'pending');

// Use nullable for truly optional fields
double? discount = json.getDoubleNullable('discount');
String? note = json.getStringNullable('note');
```

### DON'T ❌
```dart
// Don't use for required non-nullable fields without checking
String userId = json.getString('userId'); // If truly required, validate!
if (userId.isEmpty) throw Exception('User ID is required');

// Don't ignore important null values - handle them explicitly
double? importantValue = json.getDoubleNullable('importantValue');
if (importantValue == null) {
  // Log error, use fallback, or throw
}
```

---

## Questions?

See the source code at: `lib/shared/utils/json_parsing_utils.dart`

For issues or suggestions, update the implementation and re-run tests.

---

**Created**: October 19, 2025
**Status**: ✅ Ready for use
**Next**: Migrate existing unsafe patterns (150+ instances)
