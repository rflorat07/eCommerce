import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/brand/brand_products.dart';
import 'package:t_store/features/shop/screens/store/widgets/t_brand_dard.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllBrandsSreen extends StatelessWidget {
  const AllBrandsSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Heading
              const TSectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// -- Brands
              TGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (_, index) => TBrandCard(
                    showBorder: true,
                    onTap: () => Get.to(() => const BrandProductsScreen())),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
