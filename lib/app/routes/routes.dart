library routes;

import 'package:get/get.dart';
import 'package:ninjafood/app/controllers/controllers.dart';
import 'package:ninjafood/app/features/role_admin/category/controller/admin_edit_product_controller.dart';
import 'package:ninjafood/app/features/role_admin/category/presentation/admin_category_screen.dart';
import 'package:ninjafood/app/features/role_admin/category/presentation/admin_edit_product_screen.dart';
import 'package:ninjafood/app/features/role_admin/tabs/controllers/admin_tabs_controller.dart';
import 'package:ninjafood/app/features/role_user/category/controllers/category_screen_controller.dart';
import 'package:ninjafood/app/features/role_user/category/presentation/category_screen.dart';
import 'package:ninjafood/app/features/role_user/chat_message/controllers/room_chat_screen_controller.dart';
import 'package:ninjafood/app/features/role_user/chat_message/presentation/image_preview_screen.dart';
import 'package:ninjafood/app/features/role_user/chat_message/presentation/room_chat_screen.dart';
import 'package:ninjafood/app/features/role_user/chat_message/controllers/group_chat_screen_controller.dart';
import 'package:ninjafood/app/features/role_user/category/controllers/product_detail_screen_controller.dart';
import 'package:ninjafood/app/features/role_user/category/presentation/product_detail_screen.dart';
import 'package:ninjafood/app/features/role_user/auth/controllers/forgot_password_controller.dart';
import 'package:ninjafood/app/features/role_user/auth/presentation/reset_password_screen.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';
import 'package:ninjafood/app/features/role_user/auth/controllers/onboard_controller.dart';
import 'package:ninjafood/app/features/role_user/auth/presentation/onboard_screen.dart';
import 'package:ninjafood/app/features/role_user/auth/presentation/sign_up_payment_screen.dart';
import 'package:ninjafood/app/features/role_user/auth/presentation/sign_up_location_screen.dart';
import 'package:ninjafood/app/features/role_user/auth/controllers/sign_in_controller.dart';
import 'package:ninjafood/app/features/role_user/auth/presentation/sign_in_screen.dart';
import 'package:ninjafood/app/features/role_user/auth/controllers/sign_up_controller.dart';
import 'package:ninjafood/app/features/role_user/auth/presentation/sign_up_screen.dart';
import 'package:ninjafood/app/features/role_user/auth/controllers/sign_up_process_controller.dart';
import 'package:ninjafood/app/features/role_user/auth/presentation/sign_up_process.dart';
import 'package:ninjafood/app/features/role_user/auth/presentation/sign_up_success_screen.dart';
import 'package:ninjafood/app/features/role_user/home/presentation/promotion_detail_screen.dart';
import 'package:ninjafood/app/features/role_user/location_picker/presentation/location_picker_screen.dart';
import 'package:ninjafood/app/features/role_user/notification/presentation/notification_screen.dart';
import 'package:ninjafood/app/features/role_user/profile/controller/edit_profile_controller.dart';
import 'package:ninjafood/app/features/role_user/profile/presentation/edit_profile_screen.dart';
import 'package:ninjafood/app/features/role_user/profile/presentation/order_detail_screen.dart';
import 'package:ninjafood/app/features/role_user/rating/controller/rating_screen_controller.dart';
import 'package:ninjafood/app/features/role_user/rating/presentation/rating_screen.dart';
import 'package:ninjafood/app/features/role_user/splash/controllers/splash_controller.dart';
import 'package:ninjafood/app/features/role_user/splash/presentation/splash_screen.dart';
import 'package:ninjafood/app/features/role_user/auth/presentation/reset_password_success_screen.dart';
import 'package:ninjafood/app/features/role_user/tabs/controllers/tabs_controller.dart';
import 'package:ninjafood/app/features/role_user/tabs/presentation/tab_screen.dart';
import 'package:ninjafood/app/features/role_user/auth/presentation/sign_up_upload_photo_screen.dart';
import 'package:ninjafood/app/features/role_user/auth/presentation/sign_up_photo_review_screen.dart';

part 'app_provider.dart';

part 'app_router.dart';

part 'bindings.dart';
