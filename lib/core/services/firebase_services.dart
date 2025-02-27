import 'package:e_commerce/core/errors/exeptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  Future<User> CreateUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ClientExeption(message: "الرقم السري ضعيف جداً.");
      } else if (e.code == 'email-already-in-use') {
        throw ClientExeption(
            message: "لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.");
      } else if (e.code == 'network-request-failed') {
        throw ClientExeption(message: 'تاكد من اتصالك بالانترنت.');
      } else {
        throw ClientExeption(
            message: "لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.");
      }
    } catch (e) {
      throw ClientExeption(
          message: "لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى. ");
    }
  }

  Future<User> LoginUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ClientExeption(
            message: "لم يتم العثور على حساب مستخدم بهذا البريد الإلكتروني.");
      } else if (e.code == 'wrong-password') {
        throw ClientExeption(message: "كلمة المرور غير صحيحة.");
      } else if (e.code == 'invalid-credential') {
        throw ClientExeption(
            message: 'الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'network-request-failed') {
        throw ClientExeption(message: 'تاكد من اتصالك بالانترنت.');
      } else {
        throw ClientExeption(
            message: "لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.");
      }
    } catch (e) {
      throw ClientExeption(
          message: "لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.");
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
/*************  ✨ Codeium Command ⭐  *************/
/******  226c704a-6e6f-4c0d-b907-d5c619f43cab  *******/
  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }
}
