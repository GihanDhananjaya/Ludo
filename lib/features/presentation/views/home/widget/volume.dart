import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ludoapp/utils/app_colors.dart';
import 'package:ludoapp/utils/app_dimensions.dart';

class Volume extends StatefulWidget {
  const Volume({super.key});

  @override
  State<Volume> createState() => _VolumeState();
}


class _VolumeState extends State<Volume> {
  double currentvol =0.5;

  @override
  void initState() {
    // PerfectVolumeControl.hideUI = false;
    // Future.delayed(Duration.zero,() async{
    //   currentvol = await PerfectVolumeControl.getVolume();
    //   setState(() {
    //
    //   });
    // });

    // PerfectVolumeControl.stream.listen(volume){
    //   setState(() {
    //     currentvol= volume;
    //   });
    // };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 80,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Game sound",style: TextStyle(color: AppColors.initColors().white,fontWeight: FontWeight.w600,
                  fontSize: AppDimensions.kFontSize18),),
              Text("75",style: TextStyle(color: AppColors.initColors().white,fontWeight: FontWeight.w400,
                  fontSize: AppDimensions.kFontSize18)),
            ],
          ),
          Slider(
            autofocus: true,
            allowedInteraction: SliderInteraction.slideOnly,
            activeColor: AppColors.initColors().disableButtonColor,
            inactiveColor: AppColors.initColors().fontColorDark1,
            value: currentvol, onChanged: (volume) {
            currentvol = volume;
            //PerfectVolumeControl.setVolume(volume);
            setState(() {

            });
          },
            min: 0,
            max: 1,
            divisions: 100,
          )
        ],
      ),
    );
  }
}
