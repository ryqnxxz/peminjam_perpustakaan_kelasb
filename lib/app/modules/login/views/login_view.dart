import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjaman_perpustakaan_kelasb/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LoginView',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 80,
                  color: Colors.blue,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Username',
                    icon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Username tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Password',
                    icon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Obx(
                      () => controller.loading.value
                      ? CircularProgressIndicator(
                    color: Colors.blue,
                  )
                      : ElevatedButton(
                    onPressed: () {
                      controller.login();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10), // Spacer between buttons
                ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.REGISTER);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
