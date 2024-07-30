import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/common/widgets/loaders/loaders.dart';
import 'package:t_store/data/repositories/authentication/authentication.repository.dart';
import 'package:t_store/features/authentication/controllers/network/network_manager.dart';
import 'package:t_store/features/personalization/controllers/user_controllers.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  /// -- Email and password Sign in
  Future<void> emailAndPasswordSignIn() async {
    try {
      // start Loading
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.loading);

      // check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // remember me Check
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // login user using Email and password authentication
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// -- Google Signin
  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.loading);

      // check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Google authentication
      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredential);

      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
