part of global_controller;

class AuthController extends BaseController {
  final console = Get.find<ConsoleController>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onInit() {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      firebaseUser.value = currentUser;
    }
    _handleAuthChanged();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _handleAuthChanged() async {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        console.show(_logName, 'User is currently signed out!');
      } else {
        console.show(_logName, firebaseUser.value.toString());
        console.show(_logName, 'User is signed in!');
      }
    });
  }

  Future<bool> registerWithEmailAndPassword({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
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
}
