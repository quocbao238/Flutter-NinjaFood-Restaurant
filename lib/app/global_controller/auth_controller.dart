part of global_controller;

class AuthController extends BaseController {
  final ConsoleController console;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late Rx<User?> firebaseUser = Rx<User?>(null);
  late Rx<UserModel?> cloundUser = Rx<UserModel?>(null);

  AuthController({required this.console});

  @override
  void onInit() {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      firebaseUser.value = currentUser;
      _getCloudUser();
    }
    _handleAuthChanged();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _handleAuthChanged() async {
    _auth.authStateChanges().listen((User? user) async {
      firebaseUser.value = user;

      if (user == null) {
        console.show(_logName, 'User is currently signed out!');
        await _getCloudUser();
        return;
      }

      console.show(_logName, firebaseUser.value.toString());
      console.show(_logName, 'User is signed in!');
      await _getCloudUser();
    });
  }

  Future<bool> registerWithEmailAndPassword(
      {required String email, required String password, required String fullName}) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _insertFirestoreUser(firebaseUser: _auth.currentUser!, fullName: fullName);
      await _getCloudUser();
      return true;
    } on FirebaseAuthException catch (e) {
      handleFailure(_logName, Failure.custom(e.message!), showDialog: false);
    } catch (e) {
      handleFailure(_logName, Failure.custom(e.toString()), showDialog: false);
    }
    return false;
  }

  Future<bool> loginWithEmailAndPassword({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      handleFailure(_logName, Failure.custom(e.message!), showDialog: false);
    } catch (e) {
      handleFailure(_logName, Failure.custom(e.toString()), showDialog: false);
    }
    return false;
  }

  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      handleFailure(_logName, Failure.custom(e.message!), showDialog: false);
    } catch (e) {
      handleFailure(_logName, Failure.custom(e.toString()), showDialog: false);
    }
    return false;
  }

  Future<bool> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      handleFailure(_logName, Failure.custom(e.message!), showDialog: false);
    } catch (e) {
      handleFailure(_logName, Failure.custom(e.toString()), showDialog: false);
    }
    return false;
  }

  Future<bool> updatePassword({required String newPassword}) async {
    try {
      await firebaseUser.value!.updatePassword(newPassword);
      return true;
    } on FirebaseAuthException catch (e) {
      handleFailure(_logName, Failure.custom(e.message!), showDialog: false);
    } catch (e) {
      handleFailure(_logName, Failure.custom(e.toString()), showDialog: false);
    }
    return false;
  }

  // Cloud Firestore

  Future<void> _getCloudUser() async {
    if (firebaseUser.value == null) return;

    try {
      final cloudUser = await _db.doc('/users/${firebaseUser.value!.uid}').get().then((documentSnapshot) {
        final data = documentSnapshot.data();
        if (data == null) return null;
        return UserModel.fromJson(data);
      });
      if (cloudUser == null) return;
      cloundUser.value = cloudUser;
      console.show(_logName, "FireStore UserModel is: ${cloudUser!.toJson().toString()}");
    } catch (e) {
      handleFailure(_logName, Failure.custom(e.toString()), showDialog: false);
    }
  }

  UserModel _createCloudUserModel({required User firebaseUser, required String fullName}) {
    return UserModel(uid: firebaseUser.uid, email: firebaseUser.email, fullName: fullName);
  }

  Future<void> _insertFirestoreUser({required User firebaseUser, required String fullName}) async {
    try {
      final user = _createCloudUserModel(firebaseUser: firebaseUser, fullName: fullName);
      await _db.doc('/users/${user.uid}').set(user.toJson());
    } catch (e) {
      handleFailure(_logName, Failure.custom(e.toString()), showDialog: false);
    }
  }

  //updates the firestore user in users collection
  Future<bool> updateUserFirestore({String? firstName, String? lastName, String? phoneNumber}) async {
    final user = cloundUser.value;
    if (user == null) return false;
    final newUserData = user.copyWith(
      firstName: firstName ?? user.firstName,
      lastName: lastName ?? user.lastName,
      phoneNumber: phoneNumber ?? user.phoneNumber,
    );
    try {
      await _db.doc('/users/${user!.uid}').update(newUserData.toJson());
      await _getCloudUser();
      return true;
    } catch (e) {
      handleFailure(_logName, Failure.custom(e.toString()), showDialog: false);
    }
    return false;
  }
}
