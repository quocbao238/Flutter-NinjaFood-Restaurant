import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/globalController/boot_controllers.dart';
import 'package:ninjafood/app/models/user_model.dart';
import 'package:ninjafood/app/services/console_service/console_service.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';
import 'package:ninjafood/app/services/notification_service/notification_service.dart';
import 'package:ninjafood/app/services/services.dart';

const _logName = 'UserController';

class UserController extends GetxController implements BootableController {
  static UserController get instance => Get.find<UserController>();
  final _authService = AuthService.instance;
  final _databaseService = DatabaseService.instance;
  final _consoleService = ConsoleService.instance;
  final _notificationService = NotificationService.instance;

  // Firebase Auth User
  late Rx<User?> _firebaseAuthUser = Rx<User?>(null);

  User? get getFirebaseAuthUser => _firebaseAuthUser.value;

  void setFirebaseAuthUser(User? user) => _firebaseAuthUser.value = user;

  // Database User
  final _currentUser = Rx<UserModel?>(null);
  final _adminUser = Rx<UserModel?>(null);

  UserModel? get getCurrentUser => _currentUser.value;

  UserModel? get getAdminUser => _adminUser.value;

  void setAdminUser(UserModel? user) => _adminUser.value = user;

  void setCurrentUser(UserModel? user) => _currentUser.value = user;

  bool isUser() => _currentUser.value?.role == ROLE_USER;

  bool isAdmin() => _currentUser.value?.role == ROLE_ADMIN;
  late StreamSubscription<UserModel?>? _userStream;

  // RxList<ChatModel> chatList = RxList<ChatModel>([]);

  StreamSubscription? _cloudUserSubscription;

  // StreamSubscription? _messageSubscription;

  Future<void> call() async {
    Get.put(this, permanent: true);
    final _authUser = _authService.getFirebaseAuthUser;
    if (_authUser != null) {
      _firebaseAuthUser.value = _authUser;
    }
    _handleAuthChanged();
    super.onInit();
  }

  @override
  void onClose() {
    _userStream?.cancel();
    _cloudUserSubscription?.cancel();
    super.onClose();
  }

  void _handleAuthChanged() async {
    _authService.firebaseAuthUserStream.listen((User? firebaseUser) async {
      setFirebaseAuthUser(firebaseUser);
      if (firebaseUser == null) {
        _consoleService.show(_logName, 'User is currently signed out!');
        _cloudUserSubscription = null;
        return;
      }
      _handleCloudUserChanged();

      // Update FCM Token to Cloud
      _userStream = _currentUser.listen((value) async {
        if (value == null) return;
        final response = await _databaseService.getAdminUser();
        response.fold((l) => _consoleService.show(_logName, l.message), (r) {
          setAdminUser(r);
        });

        final fcmToken = await _notificationService.getFCMToken();
        if (fcmToken != null) {
          getCurrentUser!.fcmToken = fcmToken;
          await _databaseService.updateUser(userModel: getCurrentUser!);
          _consoleService.show(_logName, 'Update FCM Token to Cloud');
          _userStream?.cancel();
        }
      });
      if (_currentUser.value == null) return;

      _consoleService.show(_logName, 'User is signed in!');
    });
  }

  void _handleCloudUserChanged() async {
    if (_cloudUserSubscription != null || getFirebaseAuthUser == null) return;
    _consoleService.show(_logName, '_handleCloudUserChanged Run');
    _cloudUserSubscription = _databaseService.getUserDataStream(getFirebaseAuthUser!.uid).listen((event) {
      _currentUser.value = UserModel.fromJson(event.data()!);
      _consoleService.show(_logName, '_handleCloudUserChanged ${_currentUser.value!.toJson()}');
      FirebaseCrashlytics.instance.setUserIdentifier(_currentUser.value!.uid);
    });
  }

  int get priority => 0;

//
// void _handleMessage() async {
//   if (!isAdmin) {
//     _messageSubscription =
//         dbController.listenMessageUser(currentUser!.uid).listen((QuerySnapshot<Map<String, dynamic>> event) {
//       final messages = event.docs.map((e) => MessageChat.fromJson(e.data())).toList();
//       final chatModel = ChatModel(
//         senderUser: currentUser!,
//         receiverUser: adminUser!,
//         messageChats: messages,
//       );
//       chatList.assignAll([chatModel]);
//     });
//     return;
//   }
//   _messageSubscription = dbController.listenMessageByAdmin().listen((QuerySnapshot<Map<String, dynamic>> event) {
//     final dataJson = event.docs;
//     List<ChatModel> listChatModel = dataJson.map((e) {
//       final json = e.data();
//       final message = MessageChat.fromJson(json['messageChat']);
//       UserModel receiverUser = UserModel.fromJson(json['userGroupChat']);
//
//       final chatModel = ChatModel(
//         senderUser: currentUser!,
//         receiverUser: receiverUser,
//         messageChats: [message],
//       );
//       return chatModel;
//     }).toList();
//     chatList.assignAll(listChatModel);
//     print(event);
//   });
// }
//
// Future<Either<Failure, void>> registerWithEmailAndPassword({required String email, required String password}) async {
//   try {
//     await _authService.registerWithEmail(email: email, password: password);
//     final userModel = UserModel.createUserByAuthUser(authUser: _authUser, createType: CREATE_TYPE_LOGIN_TYPE_EMAIL);
//     final response = await dbController.insertUser(userModel);
//     response.fold((l) => left(l), (r) => r);
//     return right(null);
//   } on FirebaseAuthException catch (e, stackTrace) {
//     return left(Failure(e.message.toString(), stackTrace));
//   } catch (e, stackTrace) {
//     return left(Failure(e.toString(), stackTrace));
//   }
// }
//
// Future<Either<Failure, void>> loginWithEmailAndPassword({required String email, required String password}) async {
//   try {
//     await _auth.signInWithEmailAndPassword(email: email, password: password);
//     return right(null);
//   } on FirebaseAuthException catch (e, stackTrace) {
//     return left(Failure(e.toString(), stackTrace));
//   } catch (e, stackTrace) {
//     return left(Failure(e.toString(), stackTrace));
//   }
// }
//
// Future<Either<Failure, void>> signOut() async {
//   try {
//     await _auth.signOut();
//     final AccessToken? accessToken = await FacebookAuth.instance.accessToken;
//     if (accessToken != null) await FacebookAuth.instance.logOut();
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//     if (await googleSignIn.isSignedIn()) await googleSignIn.signOut();
//     return right(null);
//   } on FirebaseAuthException catch (e, stackTrace) {
//     return left(Failure(e.toString(), stackTrace));
//   } catch (e, stackTrace) {
//     return left(Failure(e.toString(), stackTrace));
//   }
// }
//
// Future<Either<Failure, void>> resetPassword({required String email}) async {
//   try {
//     await _auth.sendPasswordResetEmail(email: email);
//     return right(null);
//   } on FirebaseAuthException catch (e, stackTrace) {
//     return left(Failure(e.toString(), stackTrace));
//   } catch (e, stackTrace) {
//     return left(Failure(e.toString(), stackTrace));
//   }
// }
//
// Future<Either<Failure, void>> sendEmailVerification() async {
//   if (authUser.value!.emailVerified) return right(null);
//
//   try {
//     await authUser.value!.sendEmailVerification();
//     return right(null);
//   } on FirebaseAuthException catch (e, stackTrace) {
//     return left(Failure(e.toString(), stackTrace));
//   } catch (e, stackTrace) {
//     return left(Failure(e.toString(), stackTrace));
//   }
// }
//
// Future<Either<Failure, void>> updatePassword({required String newPassword}) async {
//   try {
//     await authUser.value!.updatePassword(newPassword);
//     return right(null);
//   } on FirebaseAuthException catch (e, stackTrace) {
//     return left(Failure(e.toString(), stackTrace));
//   } catch (e, stackTrace) {
//     return left(Failure(e.toString(), stackTrace));
//   }
// }
//
// // Return Right true if NewUser
// // Return Right false if OldUser
// // Return Left Failure
// Future<Either<Failure, bool>> registerWithGoogle() async {
//   try {
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//     final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//
//     if (googleSignInAccount == null) return left(Failure('Login with Google Failure', StackTrace.current));
//
//     final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
//
//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleSignInAuthentication.accessToken,
//       idToken: googleSignInAuthentication.idToken,
//     );
//     final UserCredential userCredential = await _auth.signInWithCredential(credential);
//
//     // If Old User
//     if (!userCredential.additionalUserInfo!.isNewUser) return right(false);
//
//     final _authUser = userCredential.user;
//     if (_authUser == null) return left(Failure('Auth user is null', StackTrace.current));
//
//     final userModel = UserModel.createUserByAuthUser(authUser: _authUser, createType: CREATE_TYPE_LOGIN_TYPE_GOOGLE);
//     await dbController.insertUser(userModel);
//     return right(true);
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'account-exists-with-different-credential') {}
//     if (e.code == 'invalid-credential') {}
//     return left(Failure(e.message.toString(), StackTrace.current));
//   } catch (e, stackTrace) {
//     return left(Failure(e.toString(), stackTrace));
//   }
// }
//
// Future<Either<Failure, bool>> registerWithFacebook() async {
//   try {
//     final LoginResult loginResult = await FacebookAuth.instance.login();
//
//     if (loginResult.status != LoginStatus.success || loginResult.accessToken == null) {
//       return left(Failure('Login with Facebook Failure', StackTrace.current));
//     }
//
//     // Create a credential from the access token
//     final OAuthCredential credential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
//
//     // Once signed in, return the UserCredential
//     final UserCredential userCredential = await _auth.signInWithCredential(credential);
//
//     // If Old User
//     if (!userCredential.additionalUserInfo!.isNewUser) return right(false);
//
//     final _authUser = userCredential.user;
//     if (_authUser == null) return left(Failure('Auth user is null', StackTrace.current));
//
//     final userModel =
//         UserModel.createUserByAuthUser(authUser: _authUser, createType: CREATE_TYPE_LOGIN_TYPE_FACEBOOK);
//     await dbController.insertUser(userModel);
//     return right(true);
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'account-exists-with-different-credential') {}
//     if (e.code == 'invalid-credential') {}
//     return left(Failure(e.message.toString(), StackTrace.current));
//   } catch (e, stackTrace) {
//     return left(Failure(e.toString(), stackTrace));
//   }
// }
}
