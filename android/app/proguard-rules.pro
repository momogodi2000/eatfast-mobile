## Stripe Android SDK
-keep class com.stripe.android.** { *; }
-dontwarn com.stripe.android.**
-keep class com.stripe.android.pushProvisioning.** { *; }
-keep class com.stripe.android.pushProvisioning.PushProvisioningActivity$** { *; }
-keep class com.stripe.android.pushProvisioning.PushProvisioningActivityStarter$** { *; }

## Additional Stripe specific rules
-keepclassmembers class com.stripe.android.** {
    *;
}
-keep,allowobfuscation @interface com.stripe.android.**

## Kotlin reflection
-keep class kotlin.** { *; }
-keep class kotlin.reflect.** { *; }

## Flutter
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

## Google Play Core (for deferred components)
-keep class com.google.android.play.core.** { *; }
-dontwarn com.google.android.play.core.**

## Other dependencies
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**
