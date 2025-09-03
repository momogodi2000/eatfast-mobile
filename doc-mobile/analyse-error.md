analyse teh whole app and fixe all this error and ensure that the pahse 1, 2, 3, and 4 of the todo.md file in the odc-mobile folder are finish and when all error and bug are fixe lauche the mobile version of the app for testing on the emulator.

( E:\Eat Fast App\eatfast-mobile> flutter pub run build_runner build
Deprecated. Use `dart run` instead.
[INFO] Generating build script completed, took 1.2s
[WARNING] Throwing away cached asset graph because the build phases have changed. This most commonly would happen as a result of adding a new dependency or updating your dependencies. 
[WARNING] Throwing away cached asset graph because the language version of some package(s) changed. This would most commonly happen when updating dependencies or changing your min sdk constraint.
[INFO] Cleaning up outputs from previous builds. completed, took 686ms
[INFO] Generating build script completed, took 530ms
[WARNING] Invalidated precompiled build script due to missing asset graph.
[INFO] Precompiling build script... completed, took 51.1s
[INFO] Building new asset graph completed, took 10.4s
[INFO] Found 7 declared outputs which already exist on disk. This is likely because the`.dart_tool/build` folder was deleted, or you are submitting generated files to your source repository.
Delete these files?
1 - Delete
2 - Cancel build
3 - List conflicts
1
[INFO] Checking for unexpected pre-existing outputs. completed, took 1m 56s
[WARNING] riverpod_generator on test/features/profile/profile_screen_test.dart:
Your current `analyzer` version may not fully support your current SDK version.

Analyzer language version: 3.7.0
SDK language version: 3.8.0

Please update to the latest `analyzer` version (8.1.1) by running
`flutter packages upgrade`.

If you are not getting the latest version by running the above command, you
can try adding a constraint like the following to your pubspec to start
diagnosing why you can't get the latest version:

dev_dependencies:
  analyzer: ^8.1.1

[WARNING] No actions completed for 21.8s, waiting on:
  - riverpod_generator on lib/features/cart/domain/models/cart.dart
  - riverpod_generator on lib/features/orders/domain/models/order.dart
  - riverpod_generator on lib/features/restaurants/domain/models/menu_item.dart
  - riverpod_generator on lib/features/restaurants/domain/models/restaurant.dart

[WARNING] json_serializable on lib/features/cart/domain/models/cart.dart:
You are missing a required dependency on json_annotation in the "dependencies" section of your pubspec with a lower bound of at least "4.9.0".
[SEVERE] json_serializable on lib/features/orders/domain/models/order.dart:

Could not generate `fromJson` code for `deliveryAddress`.
To support the type `InvalidType` you can:
* Use `JsonConverter`
  https://pub.dev/documentation/json_annotation/latest/json_annotation/JsonConverter-class.html
* Use `JsonKey` fields `fromJson` and `toJson`
  https://pub.dev/documentation/json_annotation/latest/json_annotation/JsonKey/fromJson.html
  https://pub.dev/documentation/json_annotation/latest/json_annotation/JsonKey/toJson.html
package:eatfast_mobile/features/orders/domain/models/order.freezed.dart:440:21
    ╷
440 │   final UserAddress deliveryAddress;
    │                     ^^^^^^^^^^^^^^^
    ╵
[INFO] Running build completed, took 2m 26s
[INFO] Caching finalized dependency graph completed, took 480ms
[SEVERE] Failed after 2m 27s
Failed to update packages.
PS E:\Eat Fast App\eatfast-mobile> )

()