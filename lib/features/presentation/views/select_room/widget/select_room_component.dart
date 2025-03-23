import 'package:flutter/cupertino.dart';
import 'package:ludoapp/utils/app_colors.dart';

import '../../../../../utils/app_images.dart';

class SelectRoomComponent extends StatelessWidget {
  const SelectRoomComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRect(
          child: Image.asset(
            AppImages.appTitan,
            width: 179,
            height: 179,
            fit: BoxFit.cover,
          ),
        ),

        Column(
          children: [
            Text("Copper Cove",style: TextStyle(color: AppColors.initColors().white),),
            SizedBox(height: 50,),
            Text("Entrance :5,000",
                style: TextStyle(color: AppColors.initColors().white)),
          ],
        ),

      ],
    );
  }
}
