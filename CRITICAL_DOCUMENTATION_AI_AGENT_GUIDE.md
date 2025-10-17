# 🚨 CRITICAL DOCUMENTATION & AI AGENT FIX GUIDE

**Generated:** October 17, 2025  
**Flutter App:** EatFast Mobile (Cameroon Food Delivery)  
**Total Critical Issues:** 1,042 errors preventing compilation  
**Modules:** 5 (Admin, Client, Driver, Guest, Restaurant Manager)  
**Files:** 490+ Dart files analyzed  

---

## 📋 EXECUTIVE SUMMARY

The EatFast Flutter application has **1,042 critical errors** preventing compilation and deployment. This document provides a systematic, step-by-step guide for AI agents to fix all issues in the correct order.

### 🔴 SEVERITY BREAKDOWN
- **🔥 CRITICAL (Blocking Compilation):** 850+ errors
- **⚠️ HIGH (Major Functionality Broken):** 120+ errors
- **⚠️ MEDIUM (Code Quality Issues):** 60+ warnings
- **ℹ️ LOW (Optimization Needed):** 12+ info items

### 📊 ERROR CATEGORIES
1. **Missing Code Generation:** 350+ errors (freezed, json_serializable)
2. **Undefined Types/Classes:** 280+ errors (OrderStatus, CartItem, etc.)
3. **Import Path Errors:** 200+ errors (broken imports)
4. **Null Safety Violations:** 180+ errors
5. **Type Mismatches:** 100+ errors
6. **Missing Implementations:** 80+ errors

---

## 🎯 AI AGENT INSTRUCTIONS

### CRITICAL RULES FOR AI AGENTS:
1. ✅ **Execute tasks in EXACT order** - Do NOT skip steps
2. ✅ **Complete each TODO before moving to next** - Mark as ✅ when done
3. ✅ **Run verification commands** after each major step
4. ✅ **Do NOT modify working code** unless specified
5. ✅ **Use centralized exports.dart** for all model imports
6. ✅ **Delete duplicates, keep canonical versions** as specified
7. ✅ **Test after each phase** - Ensure no regression

### VERIFICATION COMMANDS:
```bash
# After each phase, run these commands to verify:
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter analyze
dart format .
```

---

## 📝 DETAILED TODO LIST FOR AI AGENTS

---

## 🔥 PHASE 1: ENVIRONMENT SETUP & CODE GENERATION (Priority: CRITICAL)

### ✅ STEP 1.1: Run Code Generation
**Objective:** Generate all missing .g.dart and .freezed.dart files

**Commands to execute:**
```bash
cd "E:\project\Eat Fast App\eatfatsApp"
flutter clean
flutter pub get
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

**Expected Files Generated:**
- `lib/shared/models/models/api_responses.g.dart`
- All `.freezed.dart` files for @freezed classes
- All `.g.dart` files for @JsonSerializable classes

**Verification:**
- [ ] Check that `api_responses.g.dart` now contains `_$PaginationInfoFromJson`
- [ ] Check that `api_responses.g.dart` contains `_$PaginationInfoToJson`
- [ ] Run `flutter analyze` - errors should drop from 1042 to ~700

**Status:** ⬜ NOT STARTED

---

### ✅ STEP 1.2: Verify Exports.dart Configuration
**Objective:** Ensure centralized model exports are complete

**File to modify:** `lib/shared/models/exports.dart`

**Current exports (VERIFY these exist):**
```dart
// Order models
export 'package:eatfast_mobile/shared/services/orders/domain/models/order.dart';
export 'package:eatfast_mobile/shared/services/orders/domain/models/order_status.dart';

// Cart models
export 'package:eatfast_mobile/shared/services/cart/domain/models/cart.dart';
export 'package:eatfast_mobile/shared/services/cart/domain/models/cart_item.dart';
```

**Additional exports to ADD:**
```dart
// Add these missing exports:
export 'package:eatfast_mobile/shared/services/orders/domain/models/scheduled_order.dart';
export 'package:eatfast_mobile/shared/services/payment/domain/models/payment_status.dart';
export 'package:eatfast_mobile/shared/services/payment/domain/models/payment_exception.dart';
export 'package:eatfast_mobile/shared/services/restaurants/domain/models/restaurant_filter.dart';
export 'package:eatfast_mobile/shared/models/models/api_responses.dart';
```

**Verification:**
- [ ] All core models are exported from exports.dart
- [ ] No export conflicts (check for `hide` clauses if needed)

**Status:** ⬜ NOT STARTED

---

## 🔥 PHASE 2: FIX IMPORT PATHS (Priority: CRITICAL)

### ✅ STEP 2.1: Update All Files to Use Centralized Exports
**Objective:** Replace direct imports with centralized exports.dart

**Pattern to find and replace:**

**Find Pattern 1:**
```dart
import 'package:eatfast_mobile/shared/services/orders/domain/models/order_status.dart';
```
**Replace with:**
```dart
import 'package:eatfast_mobile/shared/models/exports.dart';
```

**Find Pattern 2:**
```dart
import 'package:eatfast_mobile/shared/services/cart/domain/models/cart_item.dart';
```
**Replace with:**
```dart
import 'package:eatfast_mobile/shared/models/exports.dart';
```

**Find Pattern 3:**
```dart
import '../../../providers/domain/models/order.dart';
```
**Replace with:**
```dart
import 'package:eatfast_mobile/shared/models/exports.dart';
```

**Files to update (60+ files):**
- `lib/modules/restaurant_manager_module/providers/restaurant_owner_provider.dart`
- `lib/modules/restaurant_manager_module/widgets/widgets/live_orders_preview.dart`
- `lib/modules/restaurant_manager_module/widgets/widgets/order_detail_card.dart`
- `lib/modules/client_module/screens/orders/*.dart` (5 files)
- `lib/modules/client_module/widgets/widgets/orders/*.dart` (6 files)
- `lib/modules/client_module/providers/domain/models/scheduled_order.dart`
- `lib/shared/services/orders/data/order_repository_impl.dart`
- `lib/shared/services/cart/data/cart_repository_impl.dart`
- `lib/shared/services/cart/presentation/screens/checkout_screen.dart`
- `lib/shared/services/cart/providers/cart_provider.dart`
- (And 40+ more files)

**Automated approach:**
```bash
# Use find-and-replace in VS Code or run:
# Find: import.*orders/domain/models/order_status\.dart
# Replace: import 'package:eatfast_mobile/shared/models/exports.dart';
```

**Verification:**
- [ ] Run `flutter analyze` - errors should drop from ~700 to ~400
- [ ] No "Undefined class 'OrderStatus'" errors
- [ ] No "Undefined class 'CartItem'" errors

**Status:** ⬜ NOT STARTED

---

### ✅ STEP 2.2: Fix Broken Import Paths
**Objective:** Fix 120+ "Target of URI doesn't exist" errors

**Common Broken Paths to Fix:**

**1. Payment Service Import (12 files):**
```dart
// BROKEN:
import 'package:eatfast_mobile/shared/services/payment/data/unified_payment_service.dart';

// FIX:
import 'package:eatfast_mobile/shared/services/payment/data/unified_payment_service.dart';
// (Verify file exists, if not use alternative)
```

**2. Language Provider Import (1 file):**
```dart
// File: lib/shared/screens/settings/presentation/screens/language_settings_screen.dart

// BROKEN:
import 'package:eatfast_mobile/shared/services/l10n/language_provider.dart';

// FIX:
import 'package:eatfast_mobile/shared/l10n/language_provider.dart';
```

**3. Profile Provider Import (4 files):**
```dart
// Files: lib/modules/client_module/screens/profile/*.dart

// BROKEN:
import '../../../providers/profile_provider.dart';

// FIX:
import 'package:eatfast_mobile/modules/client_module/providers/profile_provider.dart';
```

**4. Cart Widget Import (2 files):**
```dart
// File: lib/shared/services/cart/presentation/widgets/cart_item_card.dart

// BROKEN:
import '../../../domain/models/cart.dart';

// FIX:
import 'package:eatfast_mobile/shared/models/exports.dart';
```

**5. Restaurant Stats Import:**
```dart
// File: lib/modules/restaurant_manager_module/services/data/restaurant_owner_repository_impl.dart

// BROKEN:
import '../providers/domain/models/restaurant_stats.dart';

// FIX:
import 'package:eatfast_mobile/shared/models/restaurant_stats.dart';
```

**Verification:**
- [ ] Run `flutter analyze` - errors should drop from ~400 to ~250
- [ ] No "Target of URI doesn't exist" errors remain

**Status:** ⬜ NOT STARTED

---

## 🔥 PHASE 3: REMOVE CODE DUPLICATION (Priority: CRITICAL)

### ✅ STEP 3.1: Delete Duplicate Widget Files
**Objective:** Remove 20+ duplicate widget implementations

**DELETION LIST (Execute in order):**

#### 1. Cart Item Card
```bash
# DELETE:
rm "lib/modules/client_module/widgets/widgets/cart/cart_item_card.dart"

# KEEP:
lib/shared/services/cart/presentation/widgets/cart_item_card.dart
```

**Update imports in 10+ files:**
```dart
// OLD:
import '../../../widgets/widgets/cart/cart_item_card.dart';

// NEW:
import 'package:eatfast_mobile/shared/services/cart/presentation/widgets/cart_item_card.dart';
```

#### 2. Restaurant Card (2 duplicates)
```bash
# DELETE:
rm "lib/modules/client_module/widgets/widgets/restaurants/restaurant_card.dart"
rm "lib/shared/widgets/cards/restaurant_card.dart"

# KEEP:
lib/shared/services/restaurants/presentation/widgets/restaurant_card.dart
```

**Update imports in 15+ files**

#### 3. Restaurant Filter Sheet
```bash
# DELETE:
rm "lib/modules/client_module/widgets/widgets/restaurants/restaurant_filter_sheet.dart"

# KEEP:
lib/shared/services/restaurants/widgets/restaurant_filter_sheet.dart
```

#### 4. Loyalty Screen
```bash
# DELETE:
rm "lib/shared/services/loyalty/presentation/screens/loyalty_screen.dart"

# KEEP:
lib/modules/client_module/screens/loyalty/loyalty_screen.dart
```

#### 5. Wallet Screen
```bash
# DELETE:
rm "lib/shared/services/wallet/presentation/screens/wallet_screen.dart"

# KEEP:
lib/modules/client_module/screens/wallet/wallet_screen.dart
```

#### 6. Order History Screen (2 duplicates)
```bash
# DELETE:
rm "lib/shared/screens/order_history_screen.dart"
rm "lib/shared/services/orders/presentation/screens/order_history_screen.dart"

# KEEP:
lib/modules/client_module/screens/orders/order_history_screen.dart
```

**Verification:**
- [ ] All duplicate files deleted
- [ ] All imports updated to point to canonical versions
- [ ] Run `flutter analyze` - no "File not found" errors
- [ ] Errors should drop from ~250 to ~180

**Status:** ⬜ NOT STARTED

---

### ✅ STEP 3.2: Delete Duplicate Service Files
**Objective:** Remove duplicate payment service implementations

**DELETION LIST:**

#### Payment Services at Root Level
```bash
# DELETE (root level duplicates):
rm "lib/shared/services/payment/campay_service.dart"
rm "lib/shared/services/payment/stripe_service.dart"
rm "lib/shared/services/payment/noupai_service.dart"
rm "lib/shared/services/payment/payment_manager.dart"

# KEEP (data/ and domain/ versions):
lib/shared/services/payment/data/campay_service.dart
lib/shared/services/payment/data/stripe_service.dart
lib/shared/services/payment/data/noupay_service.dart
lib/shared/services/payment/domain/payment_manager.dart
```

**Update imports in 30+ files:**
```dart
// OLD:
import 'package:eatfast_mobile/shared/services/payment/campay_service.dart';

// NEW:
import 'package:eatfast_mobile/shared/services/payment/data/campay_service.dart';
```

**Verification:**
- [ ] All duplicate service files deleted
- [ ] All imports updated
- [ ] Run `flutter analyze` - errors should drop from ~180 to ~150

**Status:** ⬜ NOT STARTED

---

## 🔥 PHASE 4: FIX NULL SAFETY VIOLATIONS (Priority: HIGH)

### ✅ STEP 4.1: Fix Unsafe Property Access (90+ instances)
**Objective:** Add null checks for all nullable property accesses

**Pattern to fix:**

**Type 1: Driver Location Access**
```dart
// File: lib/modules/client_module/screens/orders/realtime_order_tracking_screen.dart

// BROKEN (lines 99-102):
final currentLocation = LatLng(
  order.driver.currentLocation.latitude,
  order.driver.currentLocation.longitude,
);

// FIX:
final currentLocation = order.driver?.currentLocation != null
    ? LatLng(
        order.driver!.currentLocation!.latitude,
        order.driver!.currentLocation!.longitude,
      )
    : null;
```

**Type 2: Order Status History**
```dart
// Multiple files

// BROKEN:
_buildStatusTimeline(order.statusHistory)

// FIX:
_buildStatusTimeline(order.statusHistory ?? [])
```

**Type 3: Property Chain Access**
```dart
// BROKEN:
user.profile.photoUrl

// FIX:
user.profile?.photoUrl
```

**Files to fix (partial list):**
- `lib/modules/client_module/screens/orders/realtime_order_tracking_screen.dart`
- `lib/modules/client_module/screens/orders/order_tracking_screen.dart`
- `lib/modules/client_module/screens/orders/enhanced_order_tracking_screen.dart`
- `lib/modules/client_module/screens/profile/edit_profile_screen.dart`
- `lib/modules/restaurant_manager_module/screens/*.dart` (multiple files)
- `lib/shared/services/wallet/presentation/screens/*.dart` (3 files)
- (And 80+ more files)

**Verification:**
- [ ] Run `flutter analyze` - errors should drop from ~150 to ~80
- [ ] No "unchecked_use_of_nullable_value" errors remain

**Status:** ⬜ NOT STARTED

---

### ✅ STEP 4.2: Fix Nullable Parameter Mismatches (40+ instances)
**Objective:** Fix argument type mismatches with nullable types

**Pattern to fix:**

**Type 1: Non-nullable expected, nullable provided**
```dart
// BROKEN:
someFunction(nullableParameter)

// FIX:
someFunction(nullableParameter ?? defaultValue)
```

**Type 2: List<T>? to List<T>**
```dart
// BROKEN:
state = state.copyWith(transactions: transactions);  // transactions is List<T>?

// FIX:
state = state.copyWith(transactions: transactions ?? []);
```

**Type 3: AppLocalizations? to AppLocalizations**
```dart
// File: lib/shared/services/cart/presentation/screens/checkout_screen.dart

// BROKEN:
_buildSection(l10n)  // l10n is AppLocalizations?

// FIX:
_buildSection(l10n!)  // or add null check before calling
if (l10n != null) {
  _buildSection(l10n)
}
```

**Files to fix:**
- `lib/shared/services/loyalty/providers/loyalty_provider.dart`
- `lib/shared/services/cart/presentation/screens/checkout_screen.dart`
- `lib/shared/services/subscription/presentation/screens/*.dart` (multiple)
- (And 35+ more files)

**Verification:**
- [ ] Run `flutter analyze` - errors should drop from ~80 to ~50
- [ ] No "argument_type_not_assignable" errors for nullable types

**Status:** ⬜ NOT STARTED

---

## 🔥 PHASE 5: FIX MISSING IMPLEMENTATIONS (Priority: HIGH)

### ✅ STEP 5.1: Add Missing Provider Methods
**Objective:** Implement 40+ missing methods across providers

**Provider 1: ProfileProvider**
```dart
// File: lib/modules/client_module/providers/profile_provider.dart

// ADD these missing methods:

Future<void> updateProfilePicture(String imagePath) async {
  try {
    state = state.copyWith(isLoading: true);
    
    // Upload image
    final imageUrl = await _uploadImage(imagePath);
    
    // Update profile
    final updatedUser = await _profileRepository.updateProfile(
      photoUrl: imageUrl,
    );
    
    state = state.copyWith(
      user: updatedUser,
      isLoading: false,
    );
  } catch (e) {
    state = state.copyWith(
      error: e.toString(),
      isLoading: false,
    );
  }
}

Future<String> _uploadImage(String imagePath) async {
  // Implement image upload logic
  final file = File(imagePath);
  final response = await _imageUploadService.upload(file);
  return response.url;
}
```

**Provider 2: RestaurantOwnerProvider**
```dart
// File: lib/modules/restaurant_manager_module/providers/restaurant_owner_provider.dart

// ADD these missing methods:

Future<RestaurantStats> getRestaurantStats() async {
  try {
    final stats = await _repository.getStats();
    return stats;
  } catch (e) {
    throw Exception('Failed to fetch restaurant stats: $e');
  }
}

Future<void> updateOrderStatus(String orderId, OrderStatus newStatus) async {
  try {
    await _repository.updateOrderStatus(orderId, newStatus);
    // Refresh orders
    await fetchOrders();
  } catch (e) {
    throw Exception('Failed to update order status: $e');
  }
}
```

**Provider 3: WalletProvider**
```dart
// File: lib/shared/services/wallet/providers/wallet_provider.dart

// FIX constructor:
// BROKEN:
final _service = WalletService();

// FIX:
final _service = WalletService(ApiClient());

// ADD missing methods:
Future<void> getBalance() async {
  try {
    state = const AsyncValue.loading();
    final wallet = await _service.getWallet();
    state = AsyncValue.data(wallet);
  } catch (e, stack) {
    state = AsyncValue.error(e, stack);
  }
}
```

**Verification:**
- [ ] All missing methods implemented
- [ ] Run `flutter analyze` - errors should drop from ~50 to ~30
- [ ] No "undefined_method" errors remain

**Status:** ⬜ NOT STARTED

---

### ✅ STEP 5.2: Create Missing Model Classes
**Objective:** Create 25+ missing model classes

**Model 1: OrderFilter**
```dart
// CREATE FILE: lib/shared/models/order_filter.dart

enum OrderFilterStatus {
  all,
  pending,
  preparing,
  ready,
  inTransit,
  delivered,
  cancelled,
}

class OrderFilter {
  final OrderFilterStatus status;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? restaurantId;
  final String? searchQuery;

  const OrderFilter({
    this.status = OrderFilterStatus.all,
    this.startDate,
    this.endDate,
    this.restaurantId,
    this.searchQuery,
  });

  OrderFilter copyWith({
    OrderFilterStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    String? restaurantId,
    String? searchQuery,
  }) {
    return OrderFilter(
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      restaurantId: restaurantId ?? this.restaurantId,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
```

**Model 2: RewardsFilterState**
```dart
// CREATE FILE: lib/shared/services/loyalty/domain/models/rewards_filter_state.dart

class RewardsFilterState {
  final String? category;
  final int? minPoints;
  final int? maxPoints;
  final bool availableOnly;
  final String? sortBy;

  const RewardsFilterState({
    this.category,
    this.minPoints,
    this.maxPoints,
    this.availableOnly = false,
    this.sortBy,
  });

  RewardsFilterState copyWith({
    String? category,
    int? minPoints,
    int? maxPoints,
    bool? availableOnly,
    String? sortBy,
  }) {
    return RewardsFilterState(
      category: category ?? this.category,
      minPoints: minPoints ?? this.minPoints,
      maxPoints: maxPoints ?? this.maxPoints,
      availableOnly: availableOnly ?? this.availableOnly,
      sortBy: sortBy ?? this.sortBy,
    );
  }
}
```

**Model 3: PaymentException**
```dart
// CREATE FILE: lib/shared/services/payment/domain/models/payment_exception.dart

class PaymentException implements Exception {
  final String message;
  final String? code;
  final dynamic details;

  const PaymentException(
    this.message, {
    this.code,
    this.details,
  });

  @override
  String toString() => 'PaymentException: $message${code != null ? ' ($code)' : ''}';
}
```

**Model 4: SelectedCustomization**
```dart
// CREATE FILE: lib/shared/models/selected_customization.dart

class SelectedCustomization {
  final String id;
  final String name;
  final double price;
  final String? category;

  const SelectedCustomization({
    required this.id,
    required this.name,
    required this.price,
    this.category,
  });

  factory SelectedCustomization.fromJson(Map<String, dynamic> json) {
    return SelectedCustomization(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      if (category != null) 'category': category,
    };
  }
}
```

**Export all new models in exports.dart:**
```dart
// Add to lib/shared/models/exports.dart:
export 'package:eatfast_mobile/shared/models/order_filter.dart';
export 'package:eatfast_mobile/shared/models/selected_customization.dart';
export 'package:eatfast_mobile/shared/services/payment/domain/models/payment_exception.dart';
export 'package:eatfast_mobile/shared/services/loyalty/domain/models/rewards_filter_state.dart';
```

**Verification:**
- [ ] All missing model classes created
- [ ] Models exported in exports.dart
- [ ] Run `flutter analyze` - errors should drop from ~30 to ~15
- [ ] No "undefined_class" errors for these models

**Status:** ⬜ NOT STARTED

---

## 🔥 PHASE 6: FIX TYPE MISMATCHES (Priority: MEDIUM)

### ✅ STEP 6.1: Fix Result Type Declarations (15+ instances)
**Objective:** Fix Result<T> to Result<T, E> (2 type parameters required)

**Files to fix:**

**File 1: Admin Repository**
```dart
// File: lib/shared/services/admin/domain/repositories/admin_repository.dart

// BROKEN:
Future<Result<AdminStats>> getStats();
Future<Result<List<User>>> getUsers();

// FIX:
Future<Result<AdminStats, String>> getStats();
Future<Result<List<User>, String>> getUsers();
```

**File 2: Admin Repository Implementation**
```dart
// File: lib/shared/services/admin/data/repositories/admin_repository_impl.dart

// BROKEN:
@override
Future<Result<AdminStats>> getStats() async {
  // ...
}

// FIX:
@override
Future<Result<AdminStats, String>> getStats() async {
  try {
    final stats = await _apiService.getStats();
    return Result.success(stats);
  } catch (e) {
    return Result.failure('Failed to fetch stats: $e');
  }
}
```

**Apply same fix to all Result usages**

**Verification:**
- [ ] All Result types have 2 type parameters
- [ ] Run `flutter analyze` - errors should drop from ~15 to ~10
- [ ] No "wrong_number_of_type_arguments" errors

**Status:** ⬜ NOT STARTED

---

### ✅ STEP 6.2: Fix AnalyticsData Type Issues
**Objective:** Fix AnalyticsData usage as type argument

**Issue:** AnalyticsData is used as a type but isn't a valid type

**File to fix:**
```dart
// File: lib/shared/services/analytics/data/repositories/analytics_repository.dart

// BROKEN:
Future<Result<AnalyticsData, String>> getAnalytics() async {
  // ...
  return Result.success(AnalyticsData(...));
}

// FIX: Check if AnalyticsData is a class or just data
// If it's a Map, use:
Future<Result<Map<String, dynamic>, String>> getAnalytics() async {
  // ...
}

// OR if AnalyticsData should be a class, create it:
class AnalyticsData {
  final int totalOrders;
  final double totalRevenue;
  final Map<String, dynamic> metrics;
  
  const AnalyticsData({
    required this.totalOrders,
    required this.totalRevenue,
    required this.metrics,
  });
}
```

**Verification:**
- [ ] AnalyticsData properly defined or replaced
- [ ] Run `flutter analyze` - errors should drop from ~10 to ~5
- [ ] No "non_type_as_type_argument" errors for AnalyticsData

**Status:** ⬜ NOT STARTED

---

### ✅ STEP 6.3: Fix SubscriptionStatus Enum
**Objective:** Add missing 'paused' constant to SubscriptionStatus enum

**File to fix:**
```dart
// File: lib/shared/services/subscription/domain/models/subscription_status.dart

// ADD missing enum value:
enum SubscriptionStatus {
  active,
  inactive,
  paused,      // ← ADD THIS
  cancelled,
  expired,
  trialing,
}
```

**Verification:**
- [ ] 'paused' added to SubscriptionStatus
- [ ] Run `flutter analyze` - errors should drop from ~5 to ~2
- [ ] No "undefined_enum_constant" error for 'paused'

**Status:** ⬜ NOT STARTED

---

## 🔥 PHASE 7: FIX SPECIFIC MODULE ISSUES (Priority: MEDIUM)

### ✅ STEP 7.1: Fix Language Settings Screen
**Objective:** Fix languageProvider import and usage

**File to fix:**
```dart
// File: lib/shared/screens/settings/presentation/screens/language_settings_screen.dart

// BROKEN:
import 'package:eatfast_mobile/shared/services/l10n/language_provider.dart';
final languageNotifier = ref.watch(languageProvider);

// FIX:
import 'package:eatfast_mobile/shared/l10n/language_provider.dart';
final languageNotifier = ref.watch(languageProvider);

// ADD null checks:
final currentLanguage = languageNotifier?.language ?? 'en';

// Instead of:
languageNotifier.changeLanguage(newLanguage);

// Use:
if (languageNotifier != null) {
  languageNotifier.changeLanguage(newLanguage);
}
```

**Verification:**
- [ ] Import path fixed
- [ ] Null checks added
- [ ] Run `flutter analyze` - no errors for language_settings_screen.dart

**Status:** ⬜ NOT STARTED

---

### ✅ STEP 7.2: Fix Checkout Screen Issues
**Objective:** Fix missing AppLocalizations getters and other issues

**File to fix:**
```dart
// File: lib/shared/services/cart/presentation/screens/checkout_screen.dart

// Issue 1: Remove unused import
// DELETE this line:
import 'package:eatfast_mobile/shared/services/auth/models/app_user.dart';

// Issue 2: Fix AppLocalizations access
// BROKEN:
l10n.selectAddress

// FIX: Check if 'selectAddress' exists in app_localizations.dart
// If not, use existing getter or add to .arb files:
l10n.selectDeliveryAddress  // or appropriate getter
```

**Verification:**
- [ ] Unused import removed
- [ ] All localization keys exist
- [ ] Run `flutter analyze` - no errors for checkout_screen.dart

**Status:** ⬜ NOT STARTED

---

### ✅ STEP 7.3: Fix Cart Screen Issues
**Objective:** Fix CartItem model usage in cart screens

**Files to fix:**
- `lib/shared/services/cart/presentation/widgets/cart_item_card.dart`
- `lib/shared/services/cart/providers/cart_provider.dart`

**Issue: CartItem constructor and properties mismatch**

**Fix in cart_item_card.dart:**
```dart
// BROKEN:
CartItem item

// Issue: Missing properties or wrong types

// FIX: Ensure CartItem usage matches model definition
// Check if 'totalPrice' getter exists or use 'total':
final itemTotal = item.total;  // NOT item.totalPrice

// Check if 'menuItem' property exists:
// If not, use item.name, item.price directly
```

**Fix in cart_provider.dart:**
```dart
// BROKEN:
CartItem(...)  // Wrong constructor call

// FIX: Use proper constructor:
CartItem(
  id: uuid.v4(),
  menuItemId: menuItemId,
  name: name,
  quantity: quantity,
  price: price,
  total: price * quantity,
  // ... other required fields
)
```

**Verification:**
- [ ] CartItem usage matches model definition
- [ ] No undefined property errors
- [ ] Run `flutter analyze` - no errors for cart files

**Status:** ⬜ NOT STARTED

---

### ✅ STEP 7.4: Fix Wallet Screen Issues
**Objective:** Fix wallet state access in screens

**Files to fix:**
- `lib/shared/services/wallet/presentation/screens/wallet_screen.dart`
- `lib/shared/services/wallet/presentation/screens/top_up_screen.dart`
- `lib/shared/services/wallet/presentation/screens/transaction_history_screen.dart`

**Issue: Accessing properties directly on AsyncValue<Wallet?>**

**Pattern to fix:**
```dart
// BROKEN:
final balance = wallet.balance;
final transactions = wallet.transactions;

// FIX:
final balance = wallet.value?.balance ?? 0.0;
final transactions = wallet.value?.transactions ?? [];

// OR use proper AsyncValue handling:
wallet.when(
  data: (wallet) {
    if (wallet != null) {
      final balance = wallet.balance;
      final transactions = wallet.transactions;
      // ... use data
    }
  },
  loading: () => CircularProgressIndicator(),
  error: (error, stack) => Text('Error: $error'),
)
```

**Verification:**
- [ ] Wallet state properly accessed
- [ ] Run `flutter analyze` - no undefined_getter errors for wallet

**Status:** ⬜ NOT STARTED

---

### ✅ STEP 7.5: Fix Loyalty Screens Issues
**Objective:** Fix rewards filtering and provider issues

**Files to fix:**
- `lib/shared/services/loyalty/presentation/screens/rewards_catalog_screen.dart`
- `lib/shared/services/loyalty/presentation/widgets/rewards_showcase.dart`

**Issue 1: Undefined rewardsFilterProvider**

**Create the missing provider:**
```dart
// CREATE FILE: lib/shared/services/loyalty/providers/rewards_filter_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eatfast_mobile/shared/services/loyalty/domain/models/rewards_filter_state.dart';

final rewardsFilterProvider = StateProvider<RewardsFilterState>((ref) {
  return const RewardsFilterState();
});

final filteredRewardsProvider = Provider<List<Reward>>((ref) {
  final rewards = ref.watch(loyaltyProvider).availableRewards;
  final filter = ref.watch(rewardsFilterProvider);
  
  return rewards.where((reward) {
    if (filter.category != null && reward.category != filter.category) {
      return false;
    }
    if (filter.minPoints != null && reward.pointsRequired < filter.minPoints!) {
      return false;
    }
    if (filter.maxPoints != null && reward.pointsRequired > filter.maxPoints!) {
      return false;
    }
    if (filter.availableOnly && !reward.isAvailable) {
      return false;
    }
    return true;
  }).toList();
});
```

**Issue 2: Reward widget parameter mismatch**
```dart
// File: lib/shared/services/loyalty/presentation/widgets/rewards_showcase.dart

// BROKEN:
RewardCard(name: reward.name, rewardData: reward)

// FIX:
RewardCard(title: reward.name, reward: reward)
```

**Verification:**
- [ ] rewardsFilterProvider created
- [ ] filteredRewardsProvider created
- [ ] Widget parameters fixed
- [ ] Run `flutter analyze` - no errors for loyalty screens

**Status:** ⬜ NOT STARTED

---

### ✅ STEP 7.6: Fix Company Widget Issues
**Objective:** Add missing ApiConstants properties

**File to fix:**
```dart
// File: lib/shared/constants/api_constants.dart

// ADD missing constants:
class ApiConstants {
  // ... existing constants
  
  // ADD these:
  static const String publicContact = '/api/public/contact';
  static const String publicNewsletter = '/api/public/newsletter';
}
```

**Verification:**
- [ ] Missing constants added
- [ ] Run `flutter analyze` - no undefined_getter errors for ApiConstants

**Status:** ⬜ NOT STARTED

---

### ✅ STEP 7.7: Fix Subscription Widget Issues
**Objective:** Fix subscription benefits and plan card widgets

**File to fix:**
```dart
// File: lib/shared/services/subscription/presentation/widgets/subscription_benefits_list.dart

// BROKEN:
...subscription.plan.benefits.entries.map((entry) {
  return ListTile(...);  // Wrong return type for map
}).toList()

// FIX:
...subscription.plan.benefits.entries.map((entry) {
  return MapEntry(
    entry.key,
    ListTile(
      title: Text(entry.key),
      subtitle: Text(entry.value.toString()),
    ),
  );
}).toList()

// OR better approach:
children: [
  ...subscription.plan.benefits.entries.map((entry) {
    return ListTile(
      title: Text(entry.key),
      subtitle: Text(entry.value.toString()),
    );
  }).toList(),
]
```

**Same fix in subscription_plan_card.dart**

**Verification:**
- [ ] Map usage fixed
- [ ] Run `flutter analyze` - no spread/type errors in subscription widgets

**Status:** ⬜ NOT STARTED

---

### ✅ STEP 7.8: Fix Test Files
**Objective:** Fix broken test imports and implementations

**Test 1: Fix admin_repository_test.dart**
```dart
// File: test/features/admin/admin_repository_test.dart

// Issue: Wrong type expectations
// FIX all test assertions to match Result<T, E> pattern

// Example:
expect(result, isA<Result<AdminStats, String>>());
expect(result.isSuccess, isTrue);
```

**Test 2: Fix restaurant_owner_repository_test.dart**
```dart
// File: test/features/restaurant_owner/restaurant_owner_repository_test.dart

// BROKEN import:
import 'package:eatfatsApp/...';

// FIX:
import 'package:eatfast_mobile/...';
```

**Test 3: Fix payment_manager_test.dart**
```dart
// File: test/unit/services/payment_manager_test.dart

// Update mock implementations to match new service signatures
class MockCamPayService extends Mock implements CamPayService {}
class MockStripeService extends Mock implements StripeService {}
// etc.
```

**Verification:**
- [ ] Test imports fixed
- [ ] Test assertions updated
- [ ] Run `flutter test` - tests should compile (may fail, but should run)

**Status:** ⬜ NOT STARTED

---

## 🔥 PHASE 8: FINAL CLEANUP & VERIFICATION (Priority: LOW)

### ✅ STEP 8.1: Remove Unused Imports
**Objective:** Clean up 60+ unused import warnings

**Run automated cleanup:**
```bash
# Use VS Code or run:
dart fix --apply

# OR manually find and remove:
# Look for warnings: "Unused import: ..."
```

**Verification:**
- [ ] All unused imports removed
- [ ] Run `flutter analyze` - no unused_import warnings

**Status:** ⬜ NOT STARTED

---

### ✅ STEP 8.2: Format All Code
**Objective:** Apply consistent code formatting

**Commands:**
```bash
dart format lib/ test/
flutter pub run import_sorter:main
```

**Verification:**
- [ ] All code formatted
- [ ] Imports sorted
- [ ] Run `flutter analyze` - no formatting warnings

**Status:** ⬜ NOT STARTED

---

### ✅ STEP 8.3: Review Disabled/Obsolete Files
**Objective:** Clean up or integrate disabled files

**Files to review:**
```bash
# File 1:
lib/modules/admin_module/providers/admin_provider.dart.disabled

# Decision: Enable and integrate OR delete
# If enabling, rename to .dart and integrate with admin module

# File 2:
lib/modules/driver_module/screens/driver_dashboard_screen.dart.new

# Decision: If this is the new version, replace old one
# Otherwise, delete this file
```

**Verification:**
- [ ] Disabled files handled (enabled or deleted)
- [ ] No .disabled or .new files remain

**Status:** ⬜ NOT STARTED

---

### ✅ STEP 8.4: Final Build Test
**Objective:** Ensure successful compilation

**Commands to run:**
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs

# Analyze
flutter analyze

# Build for Android
flutter build apk --debug

# Build for iOS (if on Mac)
flutter build ios --debug
```

**Expected Results:**
- [ ] `flutter analyze` returns: "No issues found!"
- [ ] Debug APK builds successfully
- [ ] App runs without crashes

**Verification:**
- [ ] Zero analyzer errors
- [ ] Zero analyzer warnings (or < 5 acceptable warnings)
- [ ] Successful build
- [ ] App launches and basic flows work

**Status:** ⬜ NOT STARTED

---

## 📊 PROGRESS TRACKING

### Overall Progress
- **Phase 1 (Code Generation):** ⬜ 0% (0/2 steps)
- **Phase 2 (Import Paths):** ⬜ 0% (0/2 steps)
- **Phase 3 (Duplication):** ⬜ 0% (0/2 steps)
- **Phase 4 (Null Safety):** ⬜ 0% (0/2 steps)
- **Phase 5 (Missing Impl):** ⬜ 0% (0/2 steps)
- **Phase 6 (Type Fixes):** ⬜ 0% (0/3 steps)
- **Phase 7 (Module Fixes):** ⬜ 0% (0/8 steps)
- **Phase 8 (Cleanup):** ⬜ 0% (0/4 steps)

**Total Steps:** 25  
**Completed:** 0  
**In Progress:** 0  
**Not Started:** 25  

### Error Count by Phase
| Phase | Starting Errors | Expected After | Actual After |
|-------|----------------|----------------|--------------|
| Start | 1,042 | - | 1,042 |
| Phase 1 | 1,042 | ~700 | - |
| Phase 2 | ~700 | ~250 | - |
| Phase 3 | ~250 | ~150 | - |
| Phase 4 | ~150 | ~50 | - |
| Phase 5 | ~50 | ~15 | - |
| Phase 6 | ~15 | ~5 | - |
| Phase 7 | ~5 | ~0 | - |
| Phase 8 | ~0 | 0 | - |

---

## 🔍 VERIFICATION CHECKLIST

After completing ALL phases, verify:

### Code Quality
- [ ] `flutter analyze` shows: "No issues found!"
- [ ] `dart format .` makes no changes (already formatted)
- [ ] No unused imports or variables
- [ ] No TODO or FIXME comments (or documented separately)

### Compilation
- [ ] `flutter build apk --debug` succeeds
- [ ] `flutter build ios --debug` succeeds (if applicable)
- [ ] Build size is reasonable (<35MB)

### Runtime
- [ ] App launches without errors
- [ ] Authentication flow works
- [ ] Cart operations work
- [ ] Order creation works
- [ ] No runtime exceptions in logs

### Testing
- [ ] Unit tests compile and run
- [ ] Widget tests compile and run
- [ ] Integration tests compile and run
- [ ] Code coverage >40%

---

## 🆘 TROUBLESHOOTING GUIDE

### If build_runner fails:
```bash
# Clear cache and retry:
flutter clean
rm -rf .dart_tool/
flutter pub get
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### If import errors persist:
```bash
# Check for circular dependencies:
# Use VS Code "Find All References" on problematic imports
# Refactor to break circular dependencies
```

### If type errors persist:
```bash
# Verify model definitions match usage:
# Search for class definition
# Check all constructor calls match definition
```

### If runtime errors occur:
```bash
# Enable verbose logging:
flutter run --verbose

# Check for null pointer exceptions
# Add null checks where needed
```

---

## 📚 REFERENCE INFORMATION

### Key Files to Know

**Exports:**
- `lib/shared/models/exports.dart` - Centralized model exports
- `lib/shared/exports/shared_exports.dart` - Shared utilities exports

**Models:**
- `lib/shared/services/orders/domain/models/order_status.dart` - Order status enum
- `lib/shared/services/cart/domain/models/cart_item.dart` - Cart item model
- `lib/shared/models/models/api_responses.dart` - API response models

**Configuration:**
- `lib/shared/config/router/app_router.dart` - App navigation
- `lib/shared/constants/api_constants.dart` - API endpoints
- `pubspec.yaml` - Dependencies

### Important Commands

```bash
# Get dependencies
flutter pub get

# Run code generation
flutter pub run build_runner build --delete-conflicting-outputs

# Analyze code
flutter analyze

# Format code
dart format .

# Run tests
flutter test

# Build APK
flutter build apk --debug

# Run app
flutter run
```

### Helpful Resources
- [Flutter Documentation](https://docs.flutter.dev/)
- [Riverpod Documentation](https://riverpod.dev/)
- [Freezed Package](https://pub.dev/packages/freezed)
- [Build Runner](https://pub.dev/packages/build_runner)

---

## ✅ COMPLETION CRITERIA

The project is considered **FIXED** when:

1. ✅ `flutter analyze` returns: **"No issues found!"**
2. ✅ `flutter build apk --debug` completes successfully
3. ✅ App launches and navigates without crashes
4. ✅ All 25 TODO steps marked as complete
5. ✅ Code coverage is >40%
6. ✅ No critical warnings remain

---

## 📝 NOTES FOR AI AGENTS

### CRITICAL REMINDERS:
1. ⚠️ **DO NOT SKIP STEPS** - Each step builds on previous ones
2. ⚠️ **VERIFY AFTER EACH PHASE** - Run flutter analyze after each phase
3. ⚠️ **USE CENTRALIZED EXPORTS** - Always import from exports.dart
4. ⚠️ **DELETE DUPLICATES CAREFULLY** - Update imports before deleting
5. ⚠️ **TEST INCREMENTALLY** - Don't wait until the end to test

### BEST PRACTICES:
- ✅ Read error messages carefully
- ✅ Fix root causes, not symptoms
- ✅ Keep backups before major refactoring
- ✅ Commit after each successful phase
- ✅ Document any deviations from this plan

### IF YOU GET STUCK:
1. Read the specific error message
2. Check if the issue is covered in this document
3. Verify you completed previous steps correctly
4. Check the troubleshooting guide
5. Try a clean rebuild: `flutter clean && flutter pub get`

---

## 📄 DOCUMENT METADATA

**Version:** 1.0  
**Created:** October 17, 2025  
**Last Updated:** October 17, 2025  
**Status:** Active  
**Next Review:** After Phase 1 completion  

**Document Purpose:** Systematic guide for AI agents to fix all critical issues in EatFast Flutter app

**Success Metrics:**
- Errors reduced from 1,042 to 0
- Successful compilation achieved
- All modules functional
- Production-ready code

---

**🎯 BEGIN EXECUTION WITH PHASE 1, STEP 1.1**

**Remember: Mark each step as ✅ when completed, and update progress tracking!**

---

*End of Critical Documentation for AI Agents*

