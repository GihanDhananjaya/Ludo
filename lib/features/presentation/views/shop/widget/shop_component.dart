import 'package:flutter/material.dart';
import 'package:ludoapp/utils/app_colors.dart';
import 'package:ludoapp/utils/app_dimensions.dart';

class ShopComponent extends StatefulWidget {
  final String title;
  final String imagePath;
  final String? imagePath2;
  final VoidCallback onTap;

   ShopComponent({
    Key? key,
    required this.title,
    required this.imagePath,
    this.imagePath2,
    required this.onTap,
  }) : super(key: key);

  @override
  _ShopComponentState createState() => _ShopComponentState();
}

class _ShopComponentState extends State<ShopComponent> {
  late Color currentBackgroundColor;

  @override
  void initState() {
    super.initState();
    currentBackgroundColor = AppColors.initColors().mainGradient1;
  }

  void _changeColor() {
    setState(() {
      currentBackgroundColor = (currentBackgroundColor == AppColors.initColors().disableButtonColor)
          ? AppColors.initColors().mainGradient1
          : AppColors.initColors().disableButtonColor;
    });
    widget.onTap(); // Call the provided onTap function
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: Container(
        width: 100, // Adjust width
        decoration: BoxDecoration(
          color: currentBackgroundColor,
          border: Border.all(color: AppColors.initColors().white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.imagePath,
                  width: 40, // Adjust icon size
                  height: 40,
                ),
                widget.imagePath2 != null && widget.imagePath2!.isNotEmpty
                    ? Image.asset(
                  widget.imagePath2!,
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
                  widget.title,
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
    );
  }
}
