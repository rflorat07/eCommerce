import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:t_store/common/widgets/list_tile/settings_menu_title.dart';
import 'package:t_store/common/widgets/list_tile/user_profile_tile.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/screens/address/address.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/features/shop/screens/order/order.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// -- User Profile Card
                TUserProfileTile(
                  onPressed: () => Get.to(() => const ProfileScreen()),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            )),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings
                  const TSectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Menu Title
                  TSettingsMenuTitle(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subTitle: 'Set shopping delivery address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  TSettingsMenuTitle(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add, remove products and move to checkout',
                    onTap: () {},
                  ),
                  TSettingsMenuTitle(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subTitle: 'In-progresss and move to checkout',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  TSettingsMenuTitle(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank account',
                    onTap: () {},
                  ),
                  TSettingsMenuTitle(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle: 'List of all the discounted coupons',
                    onTap: () {},
                  ),
                  TSettingsMenuTitle(
                    icon: Iconsax.notification,
                    title: 'Notification',
                    subTitle: 'Set any king of notification messages',
                    onTap: () {},
                  ),
                  TSettingsMenuTitle(
                    icon: Iconsax.security_card,
                    title: 'Account Privacy',
                    subTitle: 'Manage date usage and connected accounts',
                    onTap: () {},
                  ),

                  /// -- App Setttings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(
                      title: 'App Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Menu Title
                  TSettingsMenuTitle(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle: 'Upload Data to your Cloud Firebase',
                    onTap: () {},
                  ),
                  TSettingsMenuTitle(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  TSettingsMenuTitle(
                    icon: Iconsax.document_upload,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  TSettingsMenuTitle(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),

                  /// -- Logout Button
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text('Logout')),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
