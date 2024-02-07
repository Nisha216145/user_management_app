import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../helper/auth_helper.dart';
import '../../model/user_model.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  bool isSignIn =
                      await AuthHelper.authHelper.signInAnonymously();

                  if (isSignIn) {
                    Get.offNamed('/home_page');
                  }
                },
                child: const Text("Anonymously SignIn"),
              ),
              ElevatedButton(
                onPressed: () async {
                  await AuthHelper.authHelper.registerUser(
                    email: 'abc14@mail.yahoo',
                    password: 'Abc0314@Demo',
                  );
                },
                child: const Text("Register"),
              ),
              ElevatedButton(
                onPressed: () async {
                  bool isSignIn =
                      await AuthHelper.authHelper.signInWithUserEmailPassword(
                    email: 'abc14@mail.yahoo',
                    password: 'Abc0314@Demo',
                  );

                  UserModal userModal = UserModal();

                  userModal.userName = 'Demo';
                  userModal.email = 'abc14@mail.yahoo';

                  if (isSignIn) {
                    Get.offNamed('/home_page');
                  }
                },
                child: const Text("SignIn with Email Password"),
              ),
              ElevatedButton(
                onPressed: () async {
                  GoogleSignInAccount? googleAccount =
                      await AuthHelper.authHelper.googleSignIn();

                  if (googleAccount != null) {
                    UserModal userModal = UserModal();

                    userModal.userName = googleAccount.displayName;
                    userModal.email = googleAccount.email;
                    userModal.image = googleAccount.photoUrl;

                    Get.offNamed(
                      '/home_page',
                      arguments: userModal,
                    );
                  }
                },
                child: const Text("SignIn with Google"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
