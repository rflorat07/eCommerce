import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

import '../../../../common/widgets/custom_shapes/container/search_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                /// -- AppBar
                const THomeAppBar(),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// -- Searchbar
                TSearchContainer(
                    text: TTexts.homeSearchPlaceholder, onTap: () {}),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// -- Categories
                const Padding(
                  padding: EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      /// -- Heading
                      TSectionHeading(
                        title: TTexts.homePopularCategories,
                        showActionButton: false,
                        textColor: TColors.white,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems),

                      /// Categories
                      THomeCategories(),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// Body
          const Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: TPromoSlider(
              banners: [
                TImages.promoBanner1,
                TImages.promoBanner2,
                TImages.promoBanner3
              ],
            ),
          )
        ],
      ),
    ));
  }
}
