import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ludoapp/features/presentation/common/app_button.dart';
import 'package:ludoapp/features/presentation/views/home/widget/coins_gem_count_component.dart';
import 'package:ludoapp/features/presentation/views/home/widget/mic_toggle.dart';
import 'package:ludoapp/features/presentation/views/home/widget/notification_component.dart';
import 'package:ludoapp/features/presentation/views/home/widget/profile_badge_component.dart';
import 'package:ludoapp/features/presentation/views/home/widget/task_gift_compo.dart';
import 'package:ludoapp/features/presentation/views/home/widget/top_rank_component.dart';
import 'package:ludoapp/features/presentation/views/home/widget/volume.dart';
import 'package:volume_controller/volume_controller.dart';
import '../../../../core/service/dependency_injection.dart';
import '../../../../error/messages.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/navigation_routes.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_state.dart';
import '../../bloc/base_bloc.dart';
import '../../bloc/base_event.dart';
import '../../bloc/base_state.dart';
import '../../common/top_component.dart';
import '../base_view.dart';

class WinCrownsEntity{
  String name;
  String count;

  WinCrownsEntity({required this.name, required this.count});
}

class SelectRoomView extends BaseView {

  @override
  State<SelectRoomView> createState() => _SelectRoomViewState();
}

class _SelectRoomViewState extends BaseViewState<SelectRoomView> {
  var bloc = injection<AuthBloc>();

  final List<String> image = [
    AppImages.appRoom1,
    AppImages.appRoom2,AppImages.appRoom3,AppImages.appRoom4,
    AppImages.appRoom5,AppImages.appRoom6];

  final List<WinCrownsEntity> winCrownsList = [
    WinCrownsEntity(name: 'Copper Cove', count: '5'),
    WinCrownsEntity(name: 'Iron Haven', count: '60'),
    WinCrownsEntity(name: 'Steel Forge', count: '56'),
    WinCrownsEntity(name: 'Crystal Vault', count: '75'),
    WinCrownsEntity(name: 'Titan’s Arena', count: '95'),
    WinCrownsEntity(name: 'Legends’ Hall', count: '34'),
  ];

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthBloc>(
        create: (_) => bloc,
        child: BlocListener<AuthBloc, BaseState<AuthState>>(
          listener: (_, state) {},
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                AppImages.appBackGround,
                fit: BoxFit.cover,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 35.h),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h,),
                      TopComponent(
                        coins: 12232,
                        gems: 1223,
                        onCoinsTap: () {},
                        onGemsTap: () {},
                        setting: () {},
                        notification: () {},),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(AppImages.appPirate,height: 202,width: 148,),
                                Text('Win Crowns for Every Victory',style: TextStyle(
                                    color: AppColors.initColors().white,fontWeight: FontWeight.w600,
                                    fontSize: AppDimensions.kFontSize18)),
                                SizedBox(height: 16.h,),
                               ListView.builder(
                                 shrinkWrap: true,
                                 itemCount: winCrownsList.length,
                                 itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      Expanded(
                                        flex:2,
                                        child: Text(winCrownsList[index].name,style: TextStyle(
                                            color: AppColors.initColors().white,fontWeight: FontWeight.w600,
                                            fontSize: AppDimensions.kFontSize16)),
                                      ),
                                      SizedBox(width: 6.w,),
                                      Image.asset(AppImages.appCrown,height: 17.h,),
                                      SizedBox(width: 4.w,),
                                      Expanded(
                                        child: Text(winCrownsList[index].count,style: TextStyle(
                                            color: AppColors.initColors().white,fontWeight: FontWeight.w400,
                                            fontSize: AppDimensions.kFontSize18)),
                                      ),
                                    ],
                                  );
                               },),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.arrow_back_ios,color: AppColors.initColors().white,size: 15,),
                                    Text('Select Mode',style: TextStyle(
                                        color: AppColors.initColors().white,fontWeight: FontWeight.w600,
                                        fontSize: AppDimensions.kFontSize18)),
                                  ],
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: image.length,
                                    itemBuilder: (context, index) {
                                      return Image.asset(image[index]);
                                    },)

                              ],
                            ),
                          )
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  @override
  Base<BaseEvent, BaseState> getBloc() {
    return bloc;
  }

}
