import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ludoapp/features/presentation/views/shop/widget/custom_chip_component.dart';
import 'package:ludoapp/features/presentation/views/shop/widget/shop_component.dart';
import 'package:ludoapp/features/presentation/views/shop/widget/trades_component.dart';
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
import '../../common/app_search_component.dart';
import '../../common/top_component.dart';
import '../base_view.dart';

class ShopView extends BaseView {
  final VoidCallback onTapJoinButton;
  final VoidCallback onTapBack;


  ShopView({super.key, required this.onTapJoinButton,required this.onTapBack,});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends BaseViewState<ShopView> {
  var bloc = injection<AuthBloc>();

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AuthBloc>(
        create: (_) => bloc,
        child: BlocListener<AuthBloc, BaseState<AuthState>>(
          listener: (_, state) {

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h,),
                  TopComponent(
                    coins: 12232,
                    gems: 1223,
                    onCoinsTap: () {},
                      onGemsTap: () {}, setting: () {  }, notification: () {  },),

                      SizedBox(height: 35.h,),
                      CustomChipList(),
                      SizedBox(height: 27.h,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 13,vertical: 12),
                        decoration: BoxDecoration(
                          color: AppColors.initColors().settingsTextColor,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Sell Coins Instantly',style: TextStyle(
                                    color: AppColors.initColors().white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: AppDimensions.kFontSize22
                                  ),),
                                  Text('Sell your coins securely and get your earnings instantly!',
                                    style: TextStyle(
                                      color: AppColors.initColors().white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: AppDimensions.kFontSize14
                                  ),),
                                ],
                              ),
                            ),
                            Image.asset(AppImages.appInstantly,height: 89.h,width: 96.w,),
                            Image.asset(AppImages.appArrow,height: 30.h,width: 30.w,),
                          ],
                        ),
                      ),
                      SizedBox(height: 17.h,),
                      Text(
                        'P2P Trades',
                        style: TextStyle(
                          fontSize: AppDimensions.kFontSize22,
                          fontWeight: FontWeight.w400,
                          color: AppColors.initColors().white,
                        ),
                      ),

                      SizedBox(height: 12,),

                      ListView.builder(
                          padding: EdgeInsets.only(top: 0),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                           return  GestureDetector(
                             onTap: (){
                               Navigator.pushNamed(context, Routes.kPaymentMethodView);
                             },
                             child: TradesComponent(
                               profileImage: AppImages.appMan,
                               name: "KoTi Ishan",
                               isVerified: true,
                               likePercentage: 100.0,
                               followers: 340,
                               minLimit: 1000,
                               maxLimit: 20000,
                               pricePerCoin: 0.95,),
                           );
                          },
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
