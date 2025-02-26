import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ludoapp/utils/app_colors.dart';
import 'package:ludoapp/utils/app_images.dart';

import '../../../../../utils/app_dimensions.dart';

class CustomChipList extends StatefulWidget {
  @override
  _CustomChipListState createState() => _CustomChipListState();
}

class _CustomChipListState extends State<CustomChipList> {
  List<Map<String, String>> categories = [
    {"name": "Buy skins", "image": AppImages.appBuySkin,},
    {"name": "Buy coins", "image": AppImages.appWallet,"image2": AppImages.appWallet2},
    {"name": "Sell coins", "image": AppImages.appSellCoin,"image2": AppImages.appSellCoin2},
  ];

  int selectedIndex = -1; // No chip selected initially

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 20,
        children: List.generate(categories.length, (index) {
          return ChoiceChip(
            padding: EdgeInsets.all(0),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            labelPadding: EdgeInsets.all(0),
            showCheckmark: false,
            selected: selectedIndex == index,
            onSelected: (bool selected) {
              setState(() {
                selectedIndex = selected ? index : -1;
              });
            },
            label: Container(
              width: 100, // Adjust width
              decoration: BoxDecoration(
                color: selectedIndex == index ? AppColors.initColors().disableButtonColor :
                AppColors.initColors().mainGradient1,
                border: Border.all(color: AppColors.initColors().white),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        categories[index]["image"]!,
                        width: 40, // Adjust icon size
                        height: 40,
                      ),
                      categories[index]["image2"] != null && categories[index]["image2"]!.isNotEmpty
                          ? Image.asset(
                        categories[index]["image2"]!,
                        width: 40,
                        height: 40,
                      )
                          : SizedBox.shrink(),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12)),
                      color: AppColors.initColors().white,
                    ),
                    child: Center(
                      child: Text(
                        categories[index]["name"]!,
                        style: TextStyle(
                          fontSize: AppDimensions.kFontSize16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.initColors().dark1ButtonColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
              side: BorderSide(color: selectedIndex == index ? Colors.blue : Colors.grey),
            ),
            backgroundColor: Colors.white,
            selectedColor: Colors.blue.shade100,
          );
        }),
      ),
    );
  }
}
