analyse teh whole app and fixe all this error and ensure that the pahse 1, 2, 3, and 4 of the todo.md file in the odc-mobile folder are finish and when all error and bug are fixe lauche the mobile version of the app for testing on the emulator.

(PS E:\Eat Fast App\eatfast-mobile> cd "e:\Eat Fast App\eatfast-mobile"; flutter analyze
Analyzing eatfast-mobile...                                             

   info - Don't invoke 'print' in production code - lib\core\network\api_client.dart:150:5 - avoid_print
   info - Don't invoke 'print' in production code - lib\core\network\api_client.dart:152:7 - avoid_print
   info - Don't invoke 'print' in production code - lib\core\network\api_client.dart:153:7 - avoid_print
   info - Use 'const' with the constructor to improve performance - lib\core\security\secure_storage_service.dart:184:28 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\core\security\secure_storage_service.dart:199:30 - prefer_const_constructors
   info - 'value' is deprecated and shouldn't be used. Use component accessors like .r or .g, or toARGB32 for an explicit conversion - lib\core\theme\app_colors.dart:77:32 -
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:6:5 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:33:5 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:58:5 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:83:5 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:109:5 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:181:5 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:195:9 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:201:13 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:206:13 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:211:13 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:218:9 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:224:13 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:229:13 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:234:13 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:243:5 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:255:9 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:261:13 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:266:13 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:271:13 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:280:5 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:294:5 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:307:9 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:313:13 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:318:13 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:323:13 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:330:9 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:336:13 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:341:13 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:346:13 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:355:5 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:368:9 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:374:13 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:379:13 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:384:13 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:391:9 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:397:13 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:402:13 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\data\mock\mock_restaurant_data.dart:407:13 - prefer_const_constructors
   info - Don't use 'BuildContext's across async gaps - lib\features\auth\presentation\screens\forgot_password_screen.dart:38:30 - use_build_context_synchronously
   info - Don't use 'BuildContext's across async gaps - lib\features\auth\presentation\screens\forgot_password_screen.dart:45:9 - use_build_context_synchronously
  error - Undefined name 'RouteNames' - lib\features\auth\presentation\screens\forgot_password_screen.dart:147:49 - undefined_identifier
  error - Undefined name 'RouteNames' - lib\features\auth\presentation\screens\login_screen.dart:103:16 - undefined_identifier
  error - Undefined name 'RouteNames' - lib\features\auth\presentation\screens\login_screen.dart:107:16 - undefined_identifier
  error - Undefined name 'RouteNames' - lib\features\auth\presentation\screens\login_screen.dart:114:20 - undefined_identifier
  error - Undefined name 'RouteNames' - lib\features\auth\presentation\screens\login_screen.dart:129:23 - undefined_identifier
  error - Undefined name 'RouteNames' - lib\features\auth\presentation\screens\login_screen.dart:143:39 - undefined_identifier
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\auth\presentation\screens\login_screen.dart:220:48 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\auth\presentation\screens\login_screen.dart:373:43 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\auth\presentation\screens\login_screen.dart:376:45 -
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\auth\presentation\screens\login_screen.dart:381:15 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\auth\presentation\screens\login_screen.dart:428:18 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\auth\presentation\screens\login_screen.dart:430:20 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\auth\presentation\screens\login_screen.dart:531:18 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\auth\presentation\screens\login_screen.dart:533:20 - prefer_const_constructors
   info - The variable 'controller' should be final - lib\features\auth\presentation\screens\otp_verification_screen.dart:43:14 - prefer_final_in_for_each
   info - The variable 'focusNode' should be final - lib\features\auth\presentation\screens\otp_verification_screen.dart:46:14 - prefer_final_in_for_each
   info - Local variables should be final - lib\features\auth\presentation\screens\otp_verification_screen.dart:82:5 - prefer_final_locals
   info - Local variables should be final - lib\features\auth\presentation\screens\otp_verification_screen.dart:89:5 - prefer_final_locals
   info - Don't use 'BuildContext's across async gaps - lib\features\auth\presentation\screens\otp_verification_screen.dart:112:7 - use_build_context_synchronously
  error - Undefined name 'RouteNames' - lib\features\auth\presentation\screens\otp_verification_screen.dart:112:18 - undefined_identifier
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\auth\presentation\screens\otp_verification_screen.dart:155:52 -   
          deprecated_member_use
   info - Use a 'SizedBox' to add whitespace to a layout - lib\features\auth\presentation\screens\otp_verification_screen.dart:203:26 - sized_box_for_whitespace
  error - Undefined name 'RouteNames' - lib\features\auth\presentation\screens\register_screen.dart:87:20 - undefined_identifier
  error - Undefined name 'RouteNames' - lib\features\auth\presentation\screens\register_screen.dart:89:23 - undefined_identifier
  error - Undefined name 'RouteNames' - lib\features\auth\presentation\screens\register_screen.dart:297:49 - undefined_identifier
  error - Undefined name 'RouteNames' - lib\features\auth\presentation\screens\register_screen.dart:310:49 - undefined_identifier
  error - Undefined name 'RouteNames' - lib\features\auth\presentation\screens\register_screen.dart:363:39 - undefined_identifier
  error - The named parameter 'name' is required, but there's no corresponding argument - lib\features\auth\providers\auth_provider.dart:59:22 - missing_required_argument
  error - The named parameter 'fullName' isn't defined - lib\features\auth\providers\auth_provider.dart:61:11 - undefined_named_parameter
  error - The named parameter 'phoneNumber' isn't defined - lib\features\auth\providers\auth_provider.dart:63:11 - undefined_named_parameter
  error - The named parameter 'name' is required, but there's no corresponding argument - lib\features\auth\providers\auth_provider.dart:102:20 - missing_required_argument
  error - The named parameter 'fullName' isn't defined - lib\features\auth\providers\auth_provider.dart:104:9 - undefined_named_parameter
  error - The named parameter 'phoneNumber' isn't defined - lib\features\auth\providers\auth_provider.dart:106:9 - undefined_named_parameter
  error - The named parameter 'name' is required, but there's no corresponding argument - lib\features\auth\providers\auth_provider.dart:148:22 - missing_required_argument
  error - The named parameter 'fullName' isn't defined - lib\features\auth\providers\auth_provider.dart:150:11 - undefined_named_parameter
  error - The named parameter 'phoneNumber' isn't defined - lib\features\auth\providers\auth_provider.dart:152:11 - undefined_named_parameter
  error - The named parameter 'name' is required, but there's no corresponding argument - lib\features\auth\providers\auth_provider.dart:210:20 - missing_required_argument
  error - The named parameter 'fullName' isn't defined - lib\features\auth\providers\auth_provider.dart:213:9 - undefined_named_parameter
  error - The named parameter 'phoneNumber' isn't defined - lib\features\auth\providers\auth_provider.dart:214:9 - undefined_named_parameter
  error - The named parameter 'avatarUrl' isn't defined - lib\features\auth\providers\auth_provider.dart:215:9 - undefined_named_parameter
  error - The named parameter 'fullName' isn't defined - lib\features\auth\providers\auth_provider.dart:353:9 - undefined_named_parameter
  error - The named parameter 'phoneNumber' isn't defined - lib\features\auth\providers\auth_provider.dart:354:9 - undefined_named_parameter
  error - The named parameter 'avatarUrl' isn't defined - lib\features\auth\providers\auth_provider.dart:355:9 - undefined_named_parameter
   info - Use 'const' with the constructor to improve performance - lib\features\cart\data\cart_repository_impl.dart:11:30 - prefer_const_constructors
  error - The constructor being called isn't a const constructor - lib\features\cart\data\cart_repository_impl.dart:119:16 - const_with_non_const
  error - The constructor being called isn't a const constructor - lib\features\cart\data\cart_repository_impl.dart:148:16 - const_with_non_const
   info - Local variables should be final - lib\features\cart\data\cart_repository_impl.dart:203:5 - prefer_final_locals
   info - Local variables should be final - lib\features\cart\data\cart_repository_impl.dart:206:5 - prefer_final_locals
   info - Local variables should be final - lib\features\cart\data\cart_repository_impl.dart:211:5 - prefer_final_locals
   info - Local variables should be final - lib\features\cart\data\cart_repository_impl.dart:214:5 - prefer_final_locals
   info - Local variables should be final - lib\features\cart\data\cart_repository_impl.dart:231:5 - prefer_final_locals
  error - Target of URI doesn't exist: '../../../core/result.dart' - lib\features\cart\domain\repositories\cart_repository.dart:1:8 - uri_does_not_exist
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\cart\domain\repositories\cart_repository.dart:6:10 - non_type_as_type_argument
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\cart\domain\repositories\cart_repository.dart:9:10 - non_type_as_type_argument
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\cart\domain\repositories\cart_repository.dart:12:10 - non_type_as_type_argument
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\cart\domain\repositories\cart_repository.dart:15:10 - non_type_as_type_argument
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\cart\domain\repositories\cart_repository.dart:18:10 - non_type_as_type_argument
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\cart\domain\repositories\cart_repository.dart:21:10 - non_type_as_type_argument
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\cart\domain\repositories\cart_repository.dart:24:10 - non_type_as_type_argument
  error - The type 'CartState' is not exhaustively matched by the switch cases since it doesn't match 'CartState()' - lib\features\cart\presentation\screens\cart_screen.dart:71:12 -   
         non_exhaustive_switch_expression
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\cart\presentation\screens\cart_screen.dart:81:46 -
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\cart\presentation\screens\cart_screen.dart:118:11 - prefer_const_constructors
  error - Undefined name 'RouteNames' - lib\features\cart\presentation\screens\cart_screen.dart:140:41 - undefined_identifier
  error - 4 positional arguments expected by '_updateQuantity', but 3 found - lib\features\cart\presentation\screens\cart_screen.dart:166:94 - not_enough_positional_arguments
  error - 3 positional arguments expected by '_removeItem', but 2 found - lib\features\cart\presentation\screens\cart_screen.dart:167:63 - not_enough_positional_arguments
  error - 4 positional arguments expected by '_updateInstructions', but 3 found - lib\features\cart\presentation\screens\cart_screen.dart:168:109 - not_enough_positional_arguments
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\cart\presentation\screens\cart_screen.dart:189:45 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\cart\presentation\screens\cart_screen.dart:198:48 -
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\cart\presentation\screens\cart_screen.dart:201:20 - prefer_const_constructors
  error - Undefined name 'context' - lib\features\cart\presentation\screens\cart_screen.dart:214:35 - undefined_identifier
  error - Undefined name 'context' - lib\features\cart\presentation\screens\cart_screen.dart:220:35 - undefined_identifier
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\cart\presentation\screens\cart_screen.dart:268:50 -
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\cart\presentation\screens\cart_screen.dart:273:19 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\cart\presentation\screens\cart_screen.dart:351:48 -
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\cart\presentation\screens\cart_screen.dart:356:24 - prefer_const_constructors
  error - The method 'updateItemInstructions' isn't defined for the type 'CartNotifier' - lib\features\cart\presentation\screens\cart_screen.dart:399:37 - undefined_method
  error - Undefined name 'RouteNames' - lib\features\cart\presentation\screens\cart_screen.dart:435:16 - undefined_identifier
  error - Undefined class 'UserAddress' - lib\features\cart\presentation\screens\checkout_screen.dart:17:3 - undefined_class
  error - The method 'when' isn't defined for the type 'CartState' - lib\features\cart\presentation\screens\checkout_screen.dart:32:23 - undefined_method
   info - Use 'const' with the constructor to improve performance - lib\features\cart\presentation\screens\checkout_screen.dart:124:15 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\cart\presentation\screens\checkout_screen.dart:146:15 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\cart\presentation\widgets\cart_conflict_dialog.dart:29:48 -       
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\cart\presentation\widgets\cart_conflict_dialog.dart:32:20 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\cart\presentation\widgets\cart_conflict_dialog.dart:73:48 -       
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\cart\presentation\widgets\cart_conflict_dialog.dart:76:50 -       
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\cart\presentation\widgets\cart_conflict_dialog.dart:84:21 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\cart\presentation\widgets\cart_conflict_dialog.dart:117:46 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\cart\presentation\widgets\cart_conflict_dialog.dart:120:48 -      
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\cart\presentation\widgets\cart_conflict_dialog.dart:128:21 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\cart\presentation\widgets\cart_conflict_dialog.dart:158:18 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\cart\presentation\widgets\cart_conflict_dialog.dart:160:20 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\cart\presentation\widgets\cart_item_card.dart:86:41 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\cart\presentation\widgets\cart_item_card.dart:94:41 -
          deprecated_member_use
   info - Unnecessary use of 'toList' in a spread - lib\features\cart\presentation\widgets\cart_item_card.dart:188:14 - unnecessary_to_list_in_spreads
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\cart\presentation\widgets\cart_item_card.dart:202:40 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\cart\presentation\widgets\cart_item_card.dart:203:40 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\cart\presentation\widgets\cart_item_card.dart:207:42 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\cart\presentation\widgets\cart_item_card.dart:208:42 -
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\cart\presentation\widgets\cart_item_card.dart:236:13 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\cart\presentation\widgets\cart_item_card.dart:270:50 -
          deprecated_member_use
warning - Unused import: '../../../core/result.dart' - lib\features\cart\providers\cart_provider.dart:2:8 - unused_import
warning - The value of the local variable 'currentState' isn't used - lib\features\cart\providers\cart_provider.dart:127:13 - unused_local_variable
   info - Local variables should be final - lib\features\cart\providers\cart_provider.dart:138:5 - prefer_final_locals
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\company\presentation\screens\about_us_screen.dart:107:57 -        
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\company\presentation\screens\about_us_screen.dart:209:26 -        
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\company\presentation\screens\about_us_screen.dart:223:32 -        
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\company\presentation\screens\about_us_screen.dart:264:39 -        
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\company\presentation\screens\about_us_screen.dart:265:41 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\company\presentation\screens\about_us_screen.dart:480:46 -        
          deprecated_member_use
warning - Unused import: '../../../../core/constants/app_constants.dart' - lib\features\company\presentation\screens\careers_screen.dart:3:8 - unused_import
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\company\presentation\screens\careers_screen.dart:75:52 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\company\presentation\screens\careers_screen.dart:116:54 -
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\company\presentation\screens\careers_screen.dart:181:17 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\company\presentation\screens\careers_screen.dart:196:17 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\company\presentation\screens\contact_us_screen.dart:95:49 -       
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\company\presentation\screens\contact_us_screen.dart:154:52 -      
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\company\presentation\screens\contact_us_screen.dart:212:46 -      
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\company\presentation\screens\contact_us_screen.dart:248:28 -      
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\company\presentation\screens\contact_us_screen.dart:251:30 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\company\presentation\screens\our_team_screen.dart:72:52 -
          deprecated_member_use
  error - Undefined name 'RouteNames' - lib\features\company\presentation\screens\our_team_screen.dart:99:51 - undefined_identifier
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\company\presentation\screens\our_team_screen.dart:120:47 -        
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\company\presentation\screens\our_team_screen.dart:129:62 -        
          deprecated_member_use
warning - Unused import: 'package:cached_network_image/cached_network_image.dart' - lib\features\home\presentation\screens\home_screen.dart:4:8 - unused_import
warning - Unused import: '../../../restaurants/providers/restaurant_provider.dart' - lib\features\home\presentation\screens\home_screen.dart:8:8 - unused_import
warning - Unused import: '../../../restaurants/domain/models/restaurant.dart' - lib\features\home\presentation\screens\home_screen.dart:9:8 - unused_import
warning - Unused import: '../../../orders/providers/order_provider.dart' - lib\features\home\presentation\screens\home_screen.dart:10:8 - unused_import
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\screens\home_screen.dart:41:43 -
          deprecated_member_use
   info - Use 'const' literals as arguments to constructors of '@immutable' classes - lib\features\home\presentation\screens\home_screen.dart:85:19 -
          prefer_const_literals_to_create_immutables
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\screens\home_screen.dart:147:45 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\screens\home_screen.dart:168:47 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\screens\home_screen.dart:180:45 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\screens\home_screen.dart:183:47 -
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\home\presentation\screens\home_screen.dart:187:27 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\screens\home_screen.dart:264:62 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\screens\home_screen.dart:341:35 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\screens\home_screen.dart:352:50 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\screens\home_screen.dart:396:48 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\screens\home_screen.dart:403:62 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\widgets\active_order_card.dart:29:43 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\widgets\active_order_card.dart:37:50 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\widgets\active_order_card.dart:69:45 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\widgets\active_order_card.dart:89:41 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\widgets\active_order_card.dart:101:45 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\widgets\active_order_card.dart:113:45 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\widgets\active_order_card.dart:126:45 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\widgets\active_order_card.dart:133:47 -
          deprecated_member_use
warning - Unused import: '../../../restaurants/domain/models/menu_item.dart' - lib\features\home\presentation\widgets\featured_dishes_section.dart:8:8 - unused_import
  error - The type 'RestaurantListState' is not exhaustively matched by the switch cases since it doesn't match 'RestaurantListState()' -
         lib\features\home\presentation\widgets\featured_dishes_section.dart:40:9 - non_exhaustive_switch_expression
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\widgets\featured_dishes_section.dart:102:35 -   
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\widgets\featured_dishes_section.dart:126:53 -   
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\widgets\featured_dishes_section.dart:137:53 -   
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\widgets\featured_dishes_section.dart:181:53 -   
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\home\presentation\widgets\featured_dishes_section.dart:184:32 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\home\presentation\widgets\featured_dishes_section.dart:242:31 - prefer_const_constructors
  error - The type 'RestaurantListState' is not exhaustively matched by the switch cases since it doesn't match 'RestaurantListState()' -
         lib\features\home\presentation\widgets\popular_restaurants_section.dart:42:18 - non_exhaustive_switch_expression
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\widgets\popular_restaurants_section.dart:79:35 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\widgets\popular_restaurants_section.dart:103:53 
          - deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\home\presentation\widgets\popular_restaurants_section.dart:114:53 
          - deprecated_member_use
  error - The getter 'hasActivePromotions' isn't defined for the type 'Restaurant' - lib\features\home\presentation\widgets\popular_restaurants_section.dart:126:34 - undefined_getter  
  error - The getter 'cuisine' isn't defined for the type 'Restaurant' - lib\features\home\presentation\widgets\popular_restaurants_section.dart:171:34 - undefined_getter
   info - Use 'const' with the constructor to improve performance - lib\features\home\presentation\widgets\popular_restaurants_section.dart:183:25 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\home\presentation\widgets\popular_restaurants_section.dart:209:25 - prefer_const_constructors
  error - The getter 'deliveryTime' isn't defined for the type 'Restaurant' - lib\features\home\presentation\widgets\popular_restaurants_section.dart:216:41 - undefined_getter
  error - The getter 'deliveryTime' isn't defined for the type 'Restaurant' - lib\features\home\presentation\widgets\popular_restaurants_section.dart:216:72 - undefined_getter
  error - Undefined name 'RouteNames' - lib\features\legal\presentation\screens\terms_conditions_screen.dart:123:18 - undefined_identifier
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\legal\presentation\screens\terms_conditions_screen.dart:160:56 -  
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\legal\presentation\screens\terms_conditions_screen.dart:163:60 -  
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\legal\presentation\screens\terms_conditions_screen.dart:240:29 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\legal\presentation\screens\terms_conditions_screen.dart:241:28 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\legal\presentation\screens\terms_conditions_screen.dart:248:51 -  
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\legal\presentation\screens\terms_conditions_screen.dart:265:62 -  
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\legal\presentation\screens\terms_conditions_screen.dart:268:64 -  
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\legal\presentation\screens\terms_conditions_screen.dart:274:31 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\legal\presentation\screens\terms_conditions_screen.dart:302:65 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\legal\presentation\screens\terms_conditions_screen.dart:303:62 -  
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\legal\presentation\screens\terms_conditions_screen.dart:307:67 -  
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\legal\presentation\screens\terms_conditions_screen.dart:308:65 -  
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\legal\presentation\screens\terms_conditions_screen.dart:353:34 - prefer_const_constructors
   info - Use 'const' literals as arguments to constructors of '@immutable' classes - lib\features\legal\presentation\screens\terms_conditions_screen.dart:355:39 -
          prefer_const_literals_to_create_immutables
   info - Use 'const' with the constructor to improve performance - lib\features\legal\presentation\screens\terms_conditions_screen.dart:356:31 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\legal\presentation\widgets\terms_content.dart:99:45 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\legal\widgets\terms_content.dart:196:46 - deprecated_member_use   
   info - Use 'const' with the constructor to improve performance - lib\features\legal\widgets\terms_content.dart:201:15 - prefer_const_constructors
  error - Undefined name 'RouteNames' - lib\features\onboarding\presentation\screens\onboarding_screen.dart:147:16 - undefined_identifier
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\onboarding\presentation\screens\onboarding_screen.dart:197:55 -   
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\onboarding\presentation\screens\onboarding_screen.dart:216:56 -   
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\onboarding\presentation\screens\onboarding_screen.dart:239:34 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\onboarding\presentation\screens\onboarding_screen.dart:241:65 -   
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\onboarding\presentation\screens\onboarding_screen.dart:293:38 -   
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\onboarding\presentation\screens\onboarding_screen.dart:314:53 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\onboarding\presentation\screens\onboarding_screen.dart:368:55 -   
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\onboarding\presentation\screens\onboarding_screen.dart:380:55 -   
          deprecated_member_use
  error - Undefined name 'RouteNames' - lib\features\onboarding\presentation\screens\welcome_screen.dart:95:16 - undefined_identifier
  error - Undefined name 'RouteNames' - lib\features\onboarding\presentation\screens\welcome_screen.dart:99:16 - undefined_identifier
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\onboarding\presentation\screens\welcome_screen.dart:133:47 -      
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\onboarding\presentation\screens\welcome_screen.dart:135:49 -      
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\onboarding\presentation\screens\welcome_screen.dart:162:72 -      
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\onboarding\presentation\screens\welcome_screen.dart:282:40 - prefer_const_constructors
   info - Use 'const' literals as arguments to constructors of '@immutable' classes - lib\features\onboarding\presentation\screens\welcome_screen.dart:284:45 -
          prefer_const_literals_to_create_immutables
   info - Use 'const' with the constructor to improve performance - lib\features\onboarding\presentation\screens\welcome_screen.dart:285:37 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\onboarding\presentation\screens\welcome_screen.dart:306:40 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\onboarding\presentation\screens\welcome_screen.dart:342:24 -      
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\onboarding\presentation\screens\welcome_screen.dart:347:26 -      
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\onboarding\presentation\screens\welcome_screen.dart:358:28 -      
          deprecated_member_use
   info - Parameter 'currentPage' could be a super parameter - lib\features\onboarding\providers\onboarding_provider.dart:39:9 - use_super_parameters
  error - Undefined class 'UserAddress' - lib\features\orders\data\order_repository_impl.dart:24:14 - undefined_class
  error - The constructor being called isn't a const constructor - lib\features\orders\data\order_repository_impl.dart:32:16 - const_with_non_const
  error - The constructor being called isn't a const constructor - lib\features\orders\data\order_repository_impl.dart:99:16 - const_with_non_const
  error - The constructor being called isn't a const constructor - lib\features\orders\data\order_repository_impl.dart:120:16 - const_with_non_const
  error - The constructor being called isn't a const constructor - lib\features\orders\data\order_repository_impl.dart:136:16 - const_with_non_const
  error - The constructor being called isn't a const constructor - lib\features\orders\data\order_repository_impl.dart:141:16 - const_with_non_const
  error - The constructor being called isn't a const constructor - lib\features\orders\data\order_repository_impl.dart:161:14 - const_with_non_const
  error - The constructor being called isn't a const constructor - lib\features\orders\data\order_repository_impl.dart:174:16 - const_with_non_const
  error - The constructor being called isn't a const constructor - lib\features\orders\data\order_repository_impl.dart:221:16 - const_with_non_const
  error - The constructor being called isn't a const constructor - lib\features\orders\data\order_repository_impl.dart:258:16 - const_with_non_const
  error - The constructor being called isn't a const constructor - lib\features\orders\data\order_repository_impl.dart:263:16 - const_with_non_const
  error - The constructor being called isn't a const constructor - lib\features\orders\data\order_repository_impl.dart:269:14 - const_with_non_const
  error - Target of URI doesn't exist: '../../cart/domain/models/cart.dart' - lib\features\orders\domain\models\order.dart:2:8 - uri_does_not_exist
  error - Target of URI doesn't exist: '../../profile/domain/models.dart' - lib\features\orders\domain\models\order.dart:3:8 - uri_does_not_exist
  error - Target of URI hasn't been generated: 'package:eatfast_mobile/features/orders/domain/models/order.g.dart' - lib\features\orders\domain\models\order.dart:6:6 -
         uri_has_not_been_generated
  error - The name 'CartItem' isn't a type, so it can't be used as a type argument - lib\features\orders\domain\models\order.dart:15:19 - non_type_as_type_argument
  error - Undefined class 'UserAddress' - lib\features\orders\domain\models\order.dart:22:14 - undefined_class
  error - Undefined class 'PaymentMethod' - lib\features\orders\domain\models\order.dart:23:14 - undefined_class
  error - The returned type 'double' isn't returnable from a 'int' function, as required by the closure's context - lib\features\orders\domain\models\order.dart:39:53 -
         return_of_invalid_type_from_closure
  error - The property 'quantity' can't be unconditionally accessed because the receiver can be 'null' - lib\features\orders\domain\models\order.dart:39:64 -
         unchecked_use_of_nullable_value
  error - Target of URI doesn't exist: '../../../core/result.dart' - lib\features\orders\domain\repositories\order_repository.dart:1:8 - uri_does_not_exist
  error - Target of URI doesn't exist: '../../cart/domain/models/cart.dart' - lib\features\orders\domain\repositories\order_repository.dart:3:8 - uri_does_not_exist
  error - Target of URI doesn't exist: '../../profile/domain/models.dart' - lib\features\orders\domain\repositories\order_repository.dart:4:8 - uri_does_not_exist
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\orders\domain\repositories\order_repository.dart:8:10 - non_type_as_type_argument       
  error - Undefined class 'Cart' - lib\features\orders\domain\repositories\order_repository.dart:9:14 - undefined_class
  error - Undefined class 'UserAddress' - lib\features\orders\domain\repositories\order_repository.dart:10:14 - undefined_class
  error - Undefined class 'PaymentMethod' - lib\features\orders\domain\repositories\order_repository.dart:11:14 - undefined_class
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\orders\domain\repositories\order_repository.dart:16:10 - non_type_as_type_argument      
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\orders\domain\repositories\order_repository.dart:23:10 - non_type_as_type_argument
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\orders\domain\repositories\order_repository.dart:26:10 - non_type_as_type_argument      
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\orders\domain\repositories\order_repository.dart:29:10 - non_type_as_type_argument      
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\orders\domain\repositories\order_repository.dart:32:10 - non_type_as_type_argument      
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\orders\domain\repositories\order_repository.dart:35:10 - non_type_as_type_argument      
  error - The type 'OrdersState' is not exhaustively matched by the switch cases since it doesn't match 'OrdersState()' -
         lib\features\orders\presentation\screens\order_history_screen.dart:85:12 - non_exhaustive_switch_expression
  error - The type 'ActiveOrderState' is not exhaustively matched by the switch cases since it doesn't match 'ActiveOrderState()' -
         lib\features\orders\presentation\screens\order_tracking_screen.dart:82:12 - non_exhaustive_switch_expression
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\orders\presentation\screens\order_tracking_screen.dart:92:46 -    
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\orders\presentation\screens\order_tracking_screen.dart:190:33 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\orders\presentation\screens\order_tracking_screen.dart:214:56 -   
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\orders\presentation\screens\order_tracking_screen.dart:243:15 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\orders\presentation\screens\order_tracking_screen.dart:262:15 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\orders\presentation\screens\order_tracking_screen.dart:291:44 -   
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\orders\presentation\screens\order_tracking_screen.dart:302:52 -
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\orders\presentation\screens\order_tracking_screen.dart:305:24 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\orders\presentation\screens\order_tracking_screen.dart:334:25 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\orders\presentation\screens\order_tracking_screen.dart:352:53 -   
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\orders\presentation\screens\order_tracking_screen.dart:381:23 - prefer_const_constructors
  error - Undefined class 'UserAddress' - lib\features\orders\presentation\widgets\delivery_address_card.dart:6:9 - undefined_class
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\orders\presentation\widgets\delivery_address_card.dart:23:33 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\orders\presentation\widgets\delivery_address_card.dart:37:52 -    
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\orders\presentation\widgets\delivery_address_card.dart:40:24 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\orders\presentation\widgets\delivery_address_card.dart:68:50 -    
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\orders\presentation\widgets\delivery_address_card.dart:73:24 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\orders\presentation\widgets\delivery_address_card.dart:113:47 -   
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\orders\presentation\widgets\delivery_address_card.dart:116:49 -   
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\orders\presentation\widgets\delivery_address_card.dart:124:23 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\orders\presentation\widgets\delivery_address_card.dart:156:17 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\orders\presentation\widgets\order_card.dart:225:33 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\orders\presentation\widgets\order_items_summary.dart:30:33 -      
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\orders\presentation\widgets\order_items_summary.dart:141:47 -     
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\orders\presentation\widgets\order_items_summary.dart:151:47 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\orders\presentation\widgets\order_items_summary.dart:216:53 -     
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\orders\presentation\widgets\order_items_summary.dart:221:25 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\orders\presentation\widgets\order_status_timeline.dart:41:33 -    
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\orders\presentation\widgets\order_status_timeline.dart:86:47 -    
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\orders\presentation\widgets\order_status_timeline.dart:91:19 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\orders\presentation\widgets\order_status_timeline.dart:227:42 -   
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\orders\presentation\widgets\order_status_timeline.dart:232:11 - prefer_const_constructors
  error - Undefined class 'UserAddress' - lib\features\orders\providers\order_provider.dart:114:14 - undefined_class
   info - Dangling library doc comment - lib\features\profile\domain\models.dart:1:1 - dangling_library_doc_comments
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\profile\presentation\address_management_screen.dart:139:47 -      
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\profile\presentation\address_management_screen.dart:140:44 -      
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\profile\presentation\address_management_screen.dart:280:11 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\profile\presentation\address_management_screen.dart:469:39 -      
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\profile\presentation\address_management_screen.dart:528:33 -      
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\profile\presentation\address_management_screen.dart:550:37 - prefer_const_constructors
warning - Unused import: 'package:lottie/lottie.dart' - lib\features\profile\presentation\payment_methods_screen.dart:3:8 - unused_import
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\profile\presentation\payment_methods_screen.dart:131:62 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\profile\presentation\payment_methods_screen.dart:247:35 -
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\profile\presentation\payment_methods_screen.dart:276:11 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\profile\presentation\payment_methods_screen.dart:437:16 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\profile\presentation\payment_methods_screen.dart:443:16 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\profile\presentation\payment_methods_screen.dart:449:16 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\profile\presentation\payment_methods_screen.dart:455:16 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\profile\presentation\payment_methods_screen.dart:519:39 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\profile\presentation\payment_methods_screen.dart:666:64 -
          deprecated_member_use
warning - Unused import: '../../../../core/constants/app_constants.dart' - lib\features\profile\presentation\screens\profile_screen.dart:6:8 - unused_import
warning - Unused import: '../../../../shared/widgets/loading/app_loading_indicator.dart' - lib\features\profile\presentation\screens\profile_screen.dart:9:8 - unused_import
   info - Don't use 'BuildContext's across async gaps, guarded by an unrelated 'mounted' check - lib\features\profile\presentation\screens\profile_screen.dart:132:44 -
          use_build_context_synchronously
warning - The value of the local variable 'profileState' isn't used - lib\features\profile\presentation\screens\profile_screen.dart:165:11 - unused_local_variable
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\profile\presentation\screens\profile_screen.dart:240:43 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\profile\presentation\screens\profile_screen.dart:266:57 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\profile\presentation\screens\profile_screen.dart:336:47 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\profile\presentation\screens\profile_screen.dart:457:39 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\profile\presentation\screens\profile_screen.dart:527:50 -
          deprecated_member_use
warning - Unused import: '../../auth/providers/auth_provider.dart' - lib\features\profile\providers\profile_provider.dart:5:8 - unused_import
warning - Unused import: '../../../core/result.dart' - lib\features\profile\providers\profile_provider.dart:10:8 - unused_import
warning - Unused import: '../../../core/failure.dart' - lib\features\profile\providers\profile_provider.dart:11:8 - unused_import
  error - The constructor being called isn't a const constructor - lib\features\restaurants\data\restaurant_repository_impl.dart:43:16 - const_with_non_const
  error - The constructor being called isn't a const constructor - lib\features\restaurants\data\restaurant_repository_impl.dart:64:16 - const_with_non_const
   info - Local variables should be final - lib\features\restaurants\data\restaurant_repository_impl.dart:132:7 - prefer_final_locals
  error - The constructor being called isn't a const constructor - lib\features\restaurants\data\restaurant_repository_impl.dart:157:14 - const_with_non_const
  error - Target of URI doesn't exist: '../../../core/result.dart' - lib\features\restaurants\domain\repositories\restaurant_repository.dart:1:8 - uri_does_not_exist
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\restaurants\domain\repositories\restaurant_repository.dart:7:10 -
         non_type_as_type_argument
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\restaurants\domain\repositories\restaurant_repository.dart:14:10 -
         non_type_as_type_argument
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\restaurants\domain\repositories\restaurant_repository.dart:17:10 -
         non_type_as_type_argument
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\restaurants\domain\repositories\restaurant_repository.dart:20:10 -
         non_type_as_type_argument
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\restaurants\domain\repositories\restaurant_repository.dart:23:10 -
         non_type_as_type_argument
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\restaurants\domain\repositories\restaurant_repository.dart:26:10 -
         non_type_as_type_argument
  error - The name 'Result' isn't a type, so it can't be used as a type argument - lib\features\restaurants\domain\repositories\restaurant_repository.dart:29:10 -
         non_type_as_type_argument
warning - Unused import: '../../../../core/constants/app_constants.dart' - lib\features\restaurants\presentation\screens\restaurant_detail_screen.dart:4:8 - unused_import
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss -
          lib\features\restaurants\presentation\screens\restaurant_detail_screen.dart:71:44 - deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss -
          lib\features\restaurants\presentation\screens\restaurant_detail_screen.dart:157:47 - deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss -
          lib\features\restaurants\presentation\screens\restaurant_detail_screen.dart:163:47 - deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss -
          lib\features\restaurants\presentation\screens\restaurant_detail_screen.dart:178:34 - deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\restaurants\presentation\screens\restaurant_detail_screen.dart:200:23 - prefer_const_constructors      
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss -
          lib\features\restaurants\presentation\screens\restaurant_detail_screen.dart:217:53 - deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss -
          lib\features\restaurants\presentation\screens\restaurant_detail_screen.dart:309:52 - deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\restaurants\presentation\screens\restaurant_detail_screen.dart:314:26 - prefer_const_constructors      
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss -
          lib\features\restaurants\presentation\screens\restaurant_detail_screen.dart:335:22 - deprecated_member_use
   info - Unnecessary use of string interpolation - lib\features\restaurants\presentation\screens\restaurant_detail_screen.dart:486:13 - unnecessary_string_interpolations
   info - Use 'const' with the constructor to improve performance - lib\features\restaurants\presentation\screens\restaurant_detail_screen.dart:531:29 - prefer_const_constructors      
   info - Unnecessary use of 'toList' in a spread - lib\features\restaurants\presentation\screens\restaurant_detail_screen.dart:545:12 - unnecessary_to_list_in_spreads
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss -
          lib\features\restaurants\presentation\screens\restaurant_detail_screen.dart:661:55 - deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss -
          lib\features\restaurants\presentation\screens\restaurant_detail_screen.dart:668:55 - deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss -
          lib\features\restaurants\presentation\screens\restaurant_detail_screen.dart:726:62 - deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\restaurants\presentation\screens\restaurant_detail_screen.dart:731:36 - prefer_const_constructors      
   info - Use 'const' with the constructor to improve performance - lib\features\restaurants\presentation\screens\restaurant_detail_screen.dart:748:25 - prefer_const_constructors      
   info - Use 'const' with the constructor to improve performance - lib\features\restaurants\presentation\screens\restaurant_detail_screen.dart:764:25 - prefer_const_constructors      
  error - The type 'RestaurantListState' is not exhaustively matched by the switch cases since it doesn't match 'RestaurantListState()' -
         lib\features\restaurants\presentation\screens\restaurant_list_screen.dart:195:12 - non_exhaustive_switch_expression
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss -
          lib\features\restaurants\presentation\screens\restaurant_list_screen.dart:205:46 - deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\restaurants\presentation\screens\restaurant_list_screen.dart:264:11 - prefer_const_constructors
  error - Undefined name 'RouteNames' - lib\features\restaurants\presentation\screens\restaurant_list_screen.dart:299:19 - undefined_identifier
   info - Use 'const' with the constructor to improve performance - lib\features\restaurants\presentation\screens\restaurant_search_screen.dart:173:31 - prefer_const_constructors      
   info - Unnecessary use of 'toList' in a spread - lib\features\restaurants\presentation\screens\restaurant_search_screen.dart:200:12 - unnecessary_to_list_in_spreads
  error - The type 'RestaurantSearchState' is not exhaustively matched by the switch cases since it doesn't match 'RestaurantSearchState()' -
         lib\features\restaurants\presentation\screens\restaurant_search_screen.dart:206:12 - non_exhaustive_switch_expression
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss -
          lib\features\restaurants\presentation\screens\restaurant_search_screen.dart:216:46 - deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\restaurants\presentation\screens\restaurant_search_screen.dart:276:13 - prefer_const_constructors      
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\restaurants\presentation\widgets\menu_item_card.dart:61:41 -      
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\restaurants\presentation\widgets\menu_item_card.dart:69:41 -      
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\restaurants\presentation\widgets\menu_item_card.dart:106:52 -     
          deprecated_member_use
  error - The getter 'fontSizeXXS' isn't defined for the type 'DesignTokens' - lib\features\restaurants\presentation\widgets\menu_item_card.dart:113:44 - undefined_getter
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\restaurants\presentation\widgets\menu_item_card.dart:126:52 -     
          deprecated_member_use
  error - The getter 'fontSizeXXS' isn't defined for the type 'DesignTokens' - lib\features\restaurants\presentation\widgets\menu_item_card.dart:133:44 - undefined_getter
   info - Use 'const' with the constructor to improve performance - lib\features\restaurants\presentation\widgets\menu_item_card.dart:172:15 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\restaurants\presentation\widgets\menu_item_card.dart:202:44 -     
          deprecated_member_use
  error - The getter 'fontSizeXXS' isn't defined for the type 'DesignTokens' - lib\features\restaurants\presentation\widgets\menu_item_card.dart:209:44 - undefined_getter
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\restaurants\presentation\widgets\menu_item_card.dart:232:46 -     
          deprecated_member_use
  error - The getter 'fontSizeXXS' isn't defined for the type 'DesignTokens' - lib\features\restaurants\presentation\widgets\menu_item_card.dart:239:40 - undefined_getter
   info - Use 'const' with the constructor to improve performance - lib\features\restaurants\presentation\widgets\menu_item_card.dart:246:25 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\restaurants\presentation\widgets\restaurant_card.dart:48:19 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\restaurants\presentation\widgets\restaurant_card.dart:68:47 -     
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\restaurants\presentation\widgets\restaurant_card.dart:74:47 -     
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\restaurants\presentation\widgets\restaurant_card.dart:109:32 -    
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\restaurants\presentation\widgets\restaurant_card.dart:173:49 -    
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\restaurants\presentation\widgets\restaurant_card.dart:219:51 -    
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\restaurants\presentation\widgets\restaurant_card.dart:252:51 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\restaurants\presentation\widgets\restaurant_card.dart:308:58 -    
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\features\restaurants\presentation\widgets\restaurant_card.dart:313:32 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\restaurants\presentation\widgets\restaurant_card.dart:349:15 - prefer_const_constructors
warning - The value of the local variable 'isSelected' isn't used - lib\features\restaurants\presentation\widgets\restaurant_filter_bottom_sheet.dart:340:17 - unused_local_variable    
  error - The argument type 'RestaurantSortBy?' can't be assigned to the parameter type 'RestaurantSortBy'.  -
         lib\features\restaurants\presentation\widgets\restaurant_filter_bottom_sheet.dart:348:52 - argument_type_not_assignable
   info - Unnecessary use of 'toList' in a spread - lib\features\restaurants\presentation\widgets\restaurant_filter_bottom_sheet.dart:353:12 - unnecessary_to_list_in_spreads
warning - Unused import: '../../../core/result.dart' - lib\features\restaurants\providers\restaurant_provider.dart:2:8 - unused_import
   info - Use 'const' with the constructor to improve performance - lib\features\settings\presentation\screens\language_settings_screen.dart:87:21 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\settings\presentation\screens\language_settings_screen.dart:197:17 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\features\settings\presentation\screens\language_settings_screen.dart:203:17 - prefer_const_constructors
   info - Don't use 'BuildContext's across async gaps - lib\features\splash\presentation\screens\splash_screen.dart:119:13 - use_build_context_synchronously
  error - Undefined name 'RouteNames' - lib\features\splash\presentation\screens\splash_screen.dart:119:24 - undefined_identifier
   info - Don't use 'BuildContext's across async gaps - lib\features\splash\presentation\screens\splash_screen.dart:121:13 - use_build_context_synchronously
  error - Undefined name 'RouteNames' - lib\features\splash\presentation\screens\splash_screen.dart:121:24 - undefined_identifier
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\splash\presentation\screens\splash_screen.dart:156:45 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\splash\presentation\screens\splash_screen.dart:157:47 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\splash\presentation\screens\splash_screen.dart:158:44 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\splash\presentation\screens\splash_screen.dart:179:55 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\splash\presentation\screens\splash_screen.dart:229:61 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\splash\presentation\screens\splash_screen.dart:245:53 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\splash\presentation\screens\splash_screen.dart:250:57 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\features\splash\presentation\screens\splash_screen.dart:272:44 -
          deprecated_member_use
warning - The value of the local variable 'queryParams' isn't used - lib\main.dart:149:15 - unused_local_variable
  error - The named parameter 'highlightMenuItemId' isn't defined - lib\main.dart:161:11 - undefined_named_parameter
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\shared\widgets\buttons\app_button.dart:182:42 - deprecated_member_use      
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\shared\widgets\buttons\app_button.dart:184:44 - deprecated_member_use      
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\shared\widgets\buttons\app_button.dart:186:40 - deprecated_member_use      
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\shared\widgets\buttons\app_button.dart:188:42 - deprecated_member_use      
   info - Use 'const' with the constructor to improve performance - lib\shared\widgets\buttons\app_button.dart:198:16 - prefer_const_constructors
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\shared\widgets\loading\app_loading_indicator.dart:90:54 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\shared\widgets\loading\app_loading_indicator.dart:91:60 -
          deprecated_member_use
   info - 'withOpacity' is deprecated and shouldn't be used. Use .withValues() to avoid precision loss - lib\shared\widgets\loading\app_loading_indicator.dart:260:58 -
          deprecated_member_use
   info - Use 'const' with the constructor to improve performance - lib\shared\widgets\loading\shimmer_loading.dart:192:18 - prefer_const_constructors
   info - Use 'const' literals as arguments to constructors of '@immutable' classes - lib\shared\widgets\loading\shimmer_loading.dart:194:23 -
          prefer_const_literals_to_create_immutables
   info - Use 'const' with the constructor to improve performance - lib\shared\widgets\loading\shimmer_loading.dart:202:15 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\shared\widgets\loading\shimmer_loading.dart:204:24 - prefer_const_constructors
   info - Use 'const' with the constructor to improve performance - lib\shared\widgets\loading\shimmer_loading.dart:206:26 - prefer_const_constructors
   info - Use 'const' literals as arguments to constructors of '@immutable' classes - lib\shared\widgets\loading\shimmer_loading.dart:208:31 -
          prefer_const_literals_to_create_immutables
   info - Use 'const' with the constructor to improve performance - lib\shared\widgets\loading\shimmer_loading.dart:213:23 - prefer_const_constructors
   info - Use 'const' literals as arguments to constructors of '@immutable' classes - lib\shared\widgets\loading\shimmer_loading.dart:215:35 -
          prefer_const_literals_to_create_immutables
   info - Can't use a relative path to import a library in 'lib' - test\features\profile\profile_models_test.dart:3:8 - avoid_relative_lib_imports
  error - Target of URI doesn't exist: '../../lib/features/profile/domain/models.dart' - test\features\profile\profile_models_test.dart:3:8 - uri_does_not_exist
  error - Undefined name 'Address' - test\features\profile\profile_models_test.dart:24:23 - undefined_identifier
  error - The function 'Address' isn't defined - test\features\profile\profile_models_test.dart:41:23 - undefined_function
  error - The function 'Address' isn't defined - test\features\profile\profile_models_test.dart:75:23 - undefined_function
  error - The function 'Address' isn't defined - test\features\profile\profile_models_test.dart:102:23 - undefined_function
  error - The function 'Address' isn't defined - test\features\profile\profile_models_test.dart:123:24 - undefined_function
  error - The function 'Address' isn't defined - test\features\profile\profile_models_test.dart:134:24 - undefined_function
  error - The function 'Address' isn't defined - test\features\profile\profile_models_test.dart:145:24 - undefined_function
  error - Undefined name 'PaymentMethod' - test\features\profile\profile_models_test.dart:178:22 - undefined_identifier
  error - The function 'PaymentMethod' isn't defined - test\features\profile\profile_models_test.dart:192:22 - undefined_function
  error - The function 'PaymentMethod' isn't defined - test\features\profile\profile_models_test.dart:218:9 - undefined_function
  error - The function 'PaymentMethod' isn't defined - test\features\profile\profile_models_test.dart:229:9 - undefined_function
  error - The function 'PaymentMethod' isn't defined - test\features\profile\profile_models_test.dart:240:9 - undefined_function
  error - The function 'PaymentMethod' isn't defined - test\features\profile\profile_models_test.dart:251:9 - undefined_function
  error - The function 'PaymentMethod' isn't defined - test\features\profile\profile_models_test.dart:262:9 - undefined_function
  error - The function 'PaymentMethod' isn't defined - test\features\profile\profile_models_test.dart:276:22 - undefined_function
  error - The function 'PaymentMethod' isn't defined - test\features\profile\profile_models_test.dart:302:23 - undefined_function
  error - The function 'PaymentMethod' isn't defined - test\features\profile\profile_models_test.dart:310:23 - undefined_function
  error - The function 'PaymentMethod' isn't defined - test\features\profile\profile_models_test.dart:318:23 - undefined_function
  error - Const variables must be initialized with a constant value - test\features\profile\profile_models_test.dart:336:27 - const_initialized_with_non_constant_value
  error - The function 'NotificationPreferences' isn't defined - test\features\profile\profile_models_test.dart:336:27 - undefined_function
  error - Undefined name 'NotificationPreferences' - test\features\profile\profile_models_test.dart:363:27 - undefined_identifier
  error - Const variables must be initialized with a constant value - test\features\profile\profile_models_test.dart:378:27 - const_initialized_with_non_constant_value
  error - The function 'NotificationPreferences' isn't defined - test\features\profile\profile_models_test.dart:378:27 - undefined_function
  error - Const variables must be initialized with a constant value - test\features\profile\profile_models_test.dart:405:27 - const_initialized_with_non_constant_value
  error - The function 'NotificationPreferences' isn't defined - test\features\profile\profile_models_test.dart:405:27 - undefined_function
   info - Can't use a relative path to import a library in 'lib' - test\features\profile\profile_screen_test.dart:6:8 - avoid_relative_lib_imports
  error - Target of URI doesn't exist: '../../lib/features/profile/presentation/profile_screen.dart' - test\features\profile\profile_screen_test.dart:6:8 - uri_does_not_exist
   info - Can't use a relative path to import a library in 'lib' - test\features\profile\profile_screen_test.dart:7:8 - avoid_relative_lib_imports
  error - Target of URI doesn't exist: '../../lib/features/profile/providers/profile_provider.dart' - test\features\profile\profile_screen_test.dart:7:8 - uri_does_not_exist
   info - Can't use a relative path to import a library in 'lib' - test\features\profile\profile_screen_test.dart:8:8 - avoid_relative_lib_imports
  error - Target of URI doesn't exist: '../../lib/features/auth/domain/user.dart' - test\features\profile\profile_screen_test.dart:8:8 - uri_does_not_exist
   info - Can't use a relative path to import a library in 'lib' - test\features\profile\profile_screen_test.dart:9:8 - avoid_relative_lib_imports
  error - Target of URI doesn't exist: '../../lib/features/profile/domain/models.dart' - test\features\profile\profile_screen_test.dart:9:8 - uri_does_not_exist
  error - The name 'ProfileState' isn't a type, so it can't be used as a type argument - test\features\profile\profile_screen_test.dart:12:60 - non_type_as_type_argument
  error - Undefined class 'ProfileState' - test\features\profile\profile_screen_test.dart:15:16 - undefined_class
   info - Unnecessary 'this.' qualifier - test\features\profile\profile_screen_test.dart:20:5 - unnecessary_this
   info - Unnecessary 'this.' qualifier - test\features\profile\profile_screen_test.dart:24:5 - unnecessary_this
  error - Undefined class 'ProfileState' - test\features\profile\profile_screen_test.dart:36:29 - undefined_class
  error - Undefined name 'profileProvider' - test\features\profile\profile_screen_test.dart:41:11 - undefined_identifier
  error - The name 'ProfileScreen' isn't a class - test\features\profile\profile_screen_test.dart:44:23 - creation_with_non_type
  error - Undefined name 'profileProvider' - test\features\profile\profile_screen_test.dart:56:11 - undefined_identifier
  error - Invalid constant value - test\features\profile\profile_screen_test.dart:58:40 - invalid_constant
  error - The function 'ProfileScreen' isn't defined - test\features\profile\profile_screen_test.dart:58:40 - undefined_function
  error - The function 'User' isn't defined - test\features\profile\profile_screen_test.dart:67:20 - undefined_function
  error - The function 'ProfileState' isn't defined - test\features\profile\profile_screen_test.dart:79:21 - undefined_function
  error - The function 'User' isn't defined - test\features\profile\profile_screen_test.dart:93:20 - undefined_function
  error - The function 'ProfileState' isn't defined - test\features\profile\profile_screen_test.dart:105:21 - undefined_function
  error - The function 'User' isn't defined - test\features\profile\profile_screen_test.dart:117:20 - undefined_function
  error - The function 'ProfileState' isn't defined - test\features\profile\profile_screen_test.dart:129:21 - undefined_function
  error - The function 'findsAtLeastNWidget' isn't defined - test\features\profile\profile_screen_test.dart:136:41 - undefined_function
  error - The function 'User' isn't defined - test\features\profile\profile_screen_test.dart:141:20 - undefined_function
  error - The function 'ProfileState' isn't defined - test\features\profile\profile_screen_test.dart:153:21 - undefined_function
  error - The function 'User' isn't defined - test\features\profile\profile_screen_test.dart:170:20 - undefined_function
  error - The function 'ProfileState' isn't defined - test\features\profile\profile_screen_test.dart:182:21 - undefined_function
  error - The function 'findsAtLeastNWidget' isn't defined - test\features\profile\profile_screen_test.dart:189:43 - undefined_function
  error - The function 'User' isn't defined - test\features\profile\profile_screen_test.dart:194:20 - undefined_function
  error - The function 'ProfileState' isn't defined - test\features\profile\profile_screen_test.dart:206:21 - undefined_function
  error - The function 'User' isn't defined - test\features\profile\profile_screen_test.dart:218:20 - undefined_function
  error - The function 'ProfileState' isn't defined - test\features\profile\profile_screen_test.dart:230:21 - undefined_function
  error - Undefined name 'profileProvider' - test\features\profile\profile_screen_test.dart:251:11 - undefined_identifier
  error - Invalid constant value - test\features\profile\profile_screen_test.dart:253:40 - invalid_constant
  error - The function 'ProfileScreen' isn't defined - test\features\profile\profile_screen_test.dart:253:40 - undefined_function
  error - The function 'User' isn't defined - test\features\profile\profile_screen_test.dart:264:20 - undefined_function
  error - The function 'ProfileState' isn't defined - test\features\profile\profile_screen_test.dart:276:21 - undefined_function
  error - The function 'User' isn't defined - test\features\profile\profile_screen_test.dart:288:20 - undefined_function
  error - The function 'ProfileState' isn't defined - test\features\profile\profile_screen_test.dart:300:21 - undefined_function
  error - The function 'User' isn't defined - test\features\profile\profile_screen_test.dart:318:20 - undefined_function
  error - The function 'ProfileState' isn't defined - test\features\profile\profile_screen_test.dart:330:21 - undefined_function
  error - Undefined name 'profileProvider' - test\features\profile\profile_screen_test.dart:338:11 - undefined_identifier
  error - Invalid constant value - test\features\profile\profile_screen_test.dart:340:40 - invalid_constant
  error - The function 'ProfileScreen' isn't defined - test\features\profile\profile_screen_test.dart:340:40 - undefined_function
  error - The function 'findsAtLeastNWidget' isn't defined - test\features\profile\profile_screen_test.dart:344:46 - undefined_function
  error - The function 'User' isn't defined - test\features\profile\profile_screen_test.dart:357:20 - undefined_function
  error - The function 'ProfileState' isn't defined - test\features\profile\profile_screen_test.dart:369:21 - undefined_function
  error - Undefined name 'profileProvider' - test\features\profile\profile_screen_test.dart:377:11 - undefined_identifier
  error - Invalid constant value - test\features\profile\profile_screen_test.dart:379:40 - invalid_constant
  error - The function 'ProfileScreen' isn't defined - test\features\profile\profile_screen_test.dart:379:40 - undefined_function
  error - The function 'User' isn't defined - test\features\profile\profile_screen_test.dart:391:20 - undefined_function
  error - The function 'ProfileState' isn't defined - test\features\profile\profile_screen_test.dart:403:21 - undefined_function
  error - Undefined name 'profileProvider' - test\features\profile\profile_screen_test.dart:411:11 - undefined_identifier
  error - Invalid constant value - test\features\profile\profile_screen_test.dart:413:40 - invalid_constant
  error - The function 'ProfileScreen' isn't defined - test\features\profile\profile_screen_test.dart:413:40 - undefined_function
  error - The function 'findsAtLeastNWidget' isn't defined - test\features\profile\profile_screen_test.dart:419:25 - undefined_function
  error - Undefined name 'LogicalKeyboardKey' - test\features\profile\profile_screen_test.dart:422:33 - undefined_identifier
  error - The name 'MyApp' isn't a class - test\widget_test.dart:16:35 - creation_with_non_type

535 issues found. (ran in 8.0s)
PS E:\Eat Fast App\eatfast-mobile> )



and when finish update teh readme file with update and detail on teh app. and also update teh file IMPLEMENTATION_STATUS in teh folder doc-mobiel with update and and different testing upto passe. also remembre that is code is mostly for the mobile  version of eatfast my app of food deliver 100% cameroun. and i wish to know if you can add or implmenter internationalization in teh app for both french and english. and generate a whole module that shall handle this language change. also analsye all project to see if  the phase 1, phase 2 and phase 3 and phase 4 are  all implemneter and thier  functionality have be imeplmenter and if there are not finish completer them  and see if there are update or pages that should be added or is needed that i did not put in my documentation implemntation.