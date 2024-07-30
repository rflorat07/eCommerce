import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/loaders.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  // save user record with any registration provider

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        // convert the Name First and Last Name
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
        final userParts =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');

        // Map Data
        final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: userParts,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '');

        // save user Data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your Profile.');
    }
  }
}
