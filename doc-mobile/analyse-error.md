PS E:\Eat Fast App\eatfast-mobile> flutter run -d emulator-5554
Launching lib\main.dart on sdk gphone64 x86 64 in debug mode...
warning: [options] source value 8 is obsolete and will be removed in a future release
warning: [options] target value 8 is obsolete and will be removed in a future release
warning: [options] To suppress warnings about obsolete options, use -Xlint:-options.
C:\Users\momo\AppData\Local\Pub\Cache\hosted\pub.dev\image_cropper-5.0.1\android\src\main\java\vn\hunghd\flutter\plugins\imagecropper\ImageCropperPlugin.java:35: error: cannot find symbol
    public static void registerWith(PluginRegistry.Registrar registrar) {
                                                  ^
  symbol:   class Registrar
  location: interface PluginRegistry
Note: Some input files use or override a deprecated API.
Note: Recompile with -Xlint:deprecation for details.
1 error
3 warnings

FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':image_cropper:compileDebugJavaWithJavac'.
> Compilation failed; see the compiler output below.
  warning: [options] To suppress warnings about obsolete options, use -Xlint:-options.Note: Recompile with -Xlint:deprecation for details.C:\Users\momo\AppData\Local\Pub\Cache\hosted\pub.dev\image_cropper-5.0.1\android\src\main\java\vn\hunghd\flutter\plugins\imagecropper\ImageCropperPlugin.java:35: error: cannot find symbol
      public static void registerWith(PluginRegistry.Registrar registrar) {
                                                    ^
    symbol:   class Registrar
    location: interface PluginRegistrywarning: [options] source value 8 is obsolete and will be removed in a future releaseNote: Some input files use or override a deprecated API.warning: [options] target value 8 is obsolete and will be removed in a future release
  1 error
  3 warnings

* Try:
> Check your code and dependencies to fix the compilation error(s)
> Run with --scan to get full insights.

BUILD FAILED in 10s
Running Gradle task 'assembleDebug'...                             10.5s
Error: Gradle task assembleDebug failed with exit code 1
PS E:\Eat Fast App\eatfast-mobile> 