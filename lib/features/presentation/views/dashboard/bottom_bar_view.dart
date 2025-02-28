import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ludoapp/features/presentation/views/dashboard/widget/bottom_bar_item.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../friends/friends_view.dart';
import '../home/home_view.dart';
import '../shop/shop_view.dart';


class DashboardView extends StatefulWidget {
  final int? initTab;

  const DashboardView({super.key, this.initTab});
  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int selectedTab = 0;
  List<int> tabHistory = [0];

  @override
  void initState() {
    super.initState();
    if (widget.initTab != null) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        changeTab(widget.initTab!);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (selectedTab == 0) {
          return true;
        } else {
          changeTab(0);
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.initColors().mainGradient1,
        body: _getBody(),
        bottomNavigationBar: Container(
          height: 68.h,
          decoration: BoxDecoration(
            color: AppColors.initColors().mainGradient1,
            boxShadow: [
              BoxShadow(
                  blurRadius: 20,
                  color: AppColors.initColors().darkGrey,
                  offset: Offset(0, 2),
                  spreadRadius: 1 // Shadow position
              ),
            ],

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomBarItem(
                name: 'HOME',
                icon: AppImages.appHome,
                onTap: () {
                  changeTab(0);
                },
                isSelected: selectedTab == 0,
              ),
              BottomBarItem(
                name: 'Friend',
                icon: AppImages.appFriend,
                onTap: () {
                  changeTab(1);
                },
                isSelected: selectedTab == 1,
              ),
              //SizedBox(width: 10.w),
              BottomBarItem(
                name: 'SEARCH',
                icon: AppImages.appSkins,
                onTap: () {
                  changeTab(2);
                },
                isSelected: selectedTab == 2,
              ),
              BottomBarItem(
                name: 'Shop',
                icon: AppImages.appShop,
                onTap: () {
                  changeTab(3);
                },
                isSelected: selectedTab == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeTab(int value) {
    setState(() {
      if (selectedTab != value) {
        selectedTab = value;
        tabHistory.add(value);
      }
    });
  }

  _getBody() {
    switch (selectedTab) {
      case 0:
        return HomeView(
          onTapJoinButton: () {
            changeTab(3);
          }, onTapBack: () {  },
        );
      case 1:
        return FriendsView(
          onTapJoinButton: () {
            changeTab(1);
          },
          onTapBack: () {
            changeTab(0);
          },
        );
      case 2:
        return HomeView(
          onTapJoinButton: () {
            changeTab(3);
          },
          onTapBack: () {
            changeTab(0);
          },
        );
      case 3:
        return ShopView(onTapJoinButton: () {  }, onTapBack: () {  },);
      default:
        return HomeView(
          onTapJoinButton: () {
            changeTab(3);
          }, onTapBack: () {  },
        );
    }
  }
}
