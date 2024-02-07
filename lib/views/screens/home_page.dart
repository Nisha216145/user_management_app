import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helper/auth_helper.dart';
import '../../model/user_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserModal? user = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              AuthHelper.authHelper.signOut();
              Get.offNamed('/');
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                foregroundImage:
                user?.image == null ? null : NetworkImage(user!.image!),
              ),
              accountName: Text(user?.userName ?? 'guest'),
              accountEmail: Text(user?.email ?? 'no@name.email'),
            ),
          ],
        ),
      ),
      body:  Column(
        children: const [],
      ),
    );
  }
}
