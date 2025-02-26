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

class DiceView extends BaseView {

  @override
  State<DiceView> createState() => _DiceViewState();
}

class _DiceViewState extends BaseViewState<DiceView> {
  var bloc = injection<AuthBloc>();

  TextEditingController _textEditingController = TextEditingController();

  late StreamSubscription<double> _subscription;


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();

    // Remove listener
    _subscription.cancel();
  }


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
                        setting: () {

                        }, notification: () {

                      },),
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
                                Text('Pick Your Battle Arena',style: TextStyle(
                                    color: AppColors.initColors().white,fontWeight: FontWeight.w600,
                                    fontSize: AppDimensions.kFontSize18)),
                                SizedBox(height: 16.h,),
                                Text('Play with Friends :',style: TextStyle(
                                    color: AppColors.initColors().white,fontWeight: FontWeight.w600,
                                    fontSize: AppDimensions.kFontSize16)),
                                Text('Challenge your buddies and have fun.',style: TextStyle(
                                    color: AppColors.initColors().white,fontWeight: FontWeight.w400,
                                    fontSize: AppDimensions.kFontSize16)),
                                SizedBox(height: 16.h,),
                                Text('Play Online :',style: TextStyle(
                                    color: AppColors.initColors().white,fontWeight: FontWeight.w600,
                                    fontSize: AppDimensions.kFontSize16)),
                                Text('Compete with players worldwide.',style: TextStyle(
                                    color: AppColors.initColors().white,fontWeight: FontWeight.w400,
                                    fontSize: AppDimensions.kFontSize16)),
                                SizedBox(height: 16.h,),
                                Text('Practice Ground :',style: TextStyle(
                                    color: AppColors.initColors().white,fontWeight: FontWeight.w600,
                                    fontSize: AppDimensions.kFontSize16)),
                                Text('Sharpen your skills and master the game.',style: TextStyle(
                                    color: AppColors.initColors().white,fontWeight: FontWeight.w400,
                                    fontSize: AppDimensions.kFontSize16)),
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
                                Image.asset(AppImages.appPlayFriend,width: 159,height: 179,),
                                Image.asset(AppImages.appPlayOnline,width: 159,height: 179,),
                                Image.asset(AppImages.appPracticeGround,width: 159,height: 179,),
                            
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
