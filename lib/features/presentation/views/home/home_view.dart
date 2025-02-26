import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interactive_slider/interactive_slider.dart';
import 'package:ludoapp/features/presentation/views/home/widget/mic_toggle.dart';
import 'package:ludoapp/features/presentation/views/home/widget/task_gift_compo.dart';
import 'package:ludoapp/features/presentation/views/home/widget/top_rank_component.dart';
import '../../../../core/service/dependency_injection.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/navigation_routes.dart';
import '../../../data/models/responses/top_rank_response.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_event.dart';
import '../../bloc/auth/auth_state.dart';
import '../../bloc/base_bloc.dart';
import '../../bloc/base_event.dart';
import '../../bloc/base_state.dart';
import '../../common/top_component.dart';
import '../base_view.dart';

class HomeView extends BaseView {
  final VoidCallback onTapJoinButton;
  final VoidCallback onTapBack;


  HomeView({super.key, required this.onTapJoinButton,required this.onTapBack,});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseViewState<HomeView> {
  var bloc = injection<AuthBloc>();
  late StreamSubscription<double> _subscription;
  double  _value = 2.0;
  int coins = 0;
  int gems = 0;
  int rank = 0;
  String fullName = '';
  List<TopRankData> topRankDataList = [];


  @override
  void initState() {
    super.initState();
    bloc.add(AuthUserGetEvent(token: appSharedData.getAppToken()!, shouldShowProgress: true));
    bloc.add(TopRankGetEvent(shouldShowProgress: true));
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }


  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthBloc>(
        create: (_) => bloc,
        child: BlocListener<AuthBloc, BaseState<AuthState>>(
            listener: (_, state) {
              if(state is AuthUserGetSuccessState){
                setState(() {
                  coins = state.output.coins!;
                  gems = state.output.gems!;
                  rank = state.output.rank!;
                  fullName = state.output.fullName!;
                });
              }else if(state is TopRankGetSuccessState){
                setState(() {
                  topRankDataList = state.rankData;
                });
              }
            },
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
                          coins: coins,
                          gems: gems,
                          onCoinsTap: () {},
                          onGemsTap: () {},
                          setting: () {
                            showCustomDialog(
                              context,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Game sound",style: TextStyle(
                                          color: AppColors.initColors().white,fontWeight: FontWeight.w600,
                                          fontSize: AppDimensions.kFontSize14),),
                                      SizedBox(width: 50,),
                                      Text( _value.toInt().toString(),style: TextStyle(color: AppColors.initColors().white,fontWeight: FontWeight.w400,
                                          fontSize: AppDimensions.kFontSize18)),
                                    ],
                                  ),
                                  Container(
                                    width: 230,
                                    child: InteractiveSlider(
                                      foregroundColor: AppColors.initColors().disableButtonColor,
                                      min: 1.0,
                                      max: 15.0,
                                      onChanged: (value) => setState(() => _value = value),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text("Mic",style: TextStyle(color: AppColors.initColors().white,fontWeight: FontWeight.w600,
                                      fontSize: AppDimensions.kFontSize15)),
                                  SizedBox(height: 10.h,),
                                  MicToggle(title1: 'Open mic', title2: 'Close mic',),
                                  SizedBox(height: 20.h),
                                  Text("Opponent sound",style: TextStyle(color: AppColors.initColors().white,fontWeight: FontWeight.w600,
                                  fontSize: AppDimensions.kFontSize15)),
                                  SizedBox(height: 10,),
                                  MicToggle(title1: 'on', title2: 'off',),
                                  SizedBox(height: 50,),
                                  InkResponse(
                                    onTap: (){},
                                    child: Row(
                                      children: [
                                        Icon(Icons.logout,color: AppColors.initColors().errorRed,size: 16,),
                                        SizedBox(width: 6.w,),
                                        Text('Leave game',style: TextStyle(
                                            fontSize: AppDimensions.kFontSize14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.initColors().errorRed),)
                                      ],
                                    ),
                                  )
                                ],
                                ),
                              );
                            },
                          notification: () {
                            exitCustomDialog(
                                context,AppImages.appExit,
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 180,
                                        child: Text('If you exit now, you will lose the coins you’ve bet. '
                                            'Think carefully before leaving.',style: TextStyle(
                                            fontSize: AppDimensions.kFontSize12,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.initColors().white),)),
                                    SizedBox(height: 20.h,),
                                    Row(children: [
                                      Image.asset(AppImages.appCrown,height: 17,width: 17,),
                                      SizedBox(width: 10.w,),
                                      Text('+50',style: TextStyle(
                                          fontSize: AppDimensions.kFontSize12,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.initColors().white),)
                                    ],),
                                    SizedBox(height: 5.h,),
                                    Row(children: [
                                      Image.asset(AppImages.appCrown,height: 17,width: 17,),
                                      SizedBox(width: 10.w,),
                                      Text('+50',style: TextStyle(
                                          fontSize: AppDimensions.kFontSize12,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.initColors().white),)
                                    ],)
                                  ],
                                ),
                                'Exit Game?','Back to game'
                            );
                          },
                        ),
                         SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                TaskGiftCompo(imagePath: AppImages.appTask, label: 'Task', onTap: () {
                                  crownCustomDialog(context,AppImages.appCrownPopup,
                                      Column(
                                        children: [
                                          SizedBox(
                                              width: 180,
                                              child: Text('Your opponent has exited the match. You win by default',style: TextStyle(
                                                  fontSize: AppDimensions.kFontSize12,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.initColors().white),)),
                                          SizedBox(height: 20.h,),
                                          Row(children: [
                                            Image.asset(AppImages.appCrown,height: 17,width: 17,),
                                            SizedBox(width: 10.w,),
                                            Text('+50',style: TextStyle(
                                                fontSize: AppDimensions.kFontSize12,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.initColors().white),)
                                          ],),
                                          SizedBox(height: 5.h,),
                                          Row(children: [
                                            Image.asset(AppImages.appCrown,height: 17,width: 17,),
                                            SizedBox(width: 10.w,),
                                            Text('+50',style: TextStyle(
                                                fontSize: AppDimensions.kFontSize12,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.initColors().white),)
                                          ],)
                                        ],
                                      ),
                                      'Opponent Left the Game','Go to Home');
                                },),
                                SizedBox(height:12.h,),
                                TaskGiftCompo(imagePath: AppImages.appGift, label: 'Gift', onTap: () {},),
                              ],
                            ),
                            Image.asset(AppImages.appPirate,height: 266,width: 195,),
                            Image.asset(AppImages.appTextImg,height: 200.h,width: 54.w,),
                          ],
                        ),
                        Text('Games',style: TextStyle(
                          color: AppColors.initColors().white,
                          fontSize: AppDimensions.kFontSize24,
                          fontWeight: FontWeight.w400
                        ),),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkResponse(
                                onTap: (){
                                  Navigator.pushNamed(context, Routes.kDiceView);
                                },
                                child: Image.asset(AppImages.appGame1,width: 179,height: 179,)),
                            InkResponse(
                                onTap: (){
                                  Navigator.pushNamed(context, Routes.kSelectRoomView);
                                },
                                child: Image.asset(AppImages.appGame2,width: 159,height: 179,)),
                          ],
                        ),
                        SizedBox(height: 26.h,),
                        TopRanksWidget(players: [
                          ...topRankDataList.take(4).map((player) => RankPlayer(
                            rank: player.rank!,
                            imagePath: player.profileImage!,
                            name: player.fullName ?? 'Unknown',
                          )),
                          RankPlayer(rank: rank,
                              imagePath: 'https://img.freepik.com/free-vector/smiling-boy-hoodie_1308-178004.jpg?ga=GA1.1.1308396569.1740521377&semt=ais_hybrid', name: "You")
                        ],)
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
