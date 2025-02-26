import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../friends/friends_view.dart';
import '../home/home_view.dart';
import '../shop/shop_view.dart';

class ImageDashboardView extends StatefulWidget {
  final int? initTab;

  const ImageDashboardView({super.key, this.initTab});
  @override
  State<ImageDashboardView> createState() => _ImageDashboardViewState();
}

class _ImageDashboardViewState extends State<ImageDashboardView> {
  int selectedTab = 2;
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
        if (selectedTab == 2) {
          return true;
        } else {
          changeTab(2);
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.initColors().mainGradient1,
        body: _getBody(),
        bottomNavigationBar: Container(

          height: 60.h,
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Container(
                  child: selectedTab == 1? (_bottomBarItem(0, AppImages.appNavBarHome, AppImages.appNavBarHome)
                  ):selectedTab == 2 ?  _bottomBarItem(1, AppImages.appNavBarFriend, AppImages.appNavBarFriend):
                  selectedTab == 3? _bottomBarItem(2, AppImages.appNavBarSkins, AppImages.appNavBarSkins):
                  _bottomBarItem(3, AppImages.appNavBarShop, AppImages.appNavBarShop)
              ),
            ],
          ),
      ),
    ));
  }

  Widget _bottomBarItem(int index, String icon, String selectedIcon) {
    return GestureDetector(
      onTap: () => changeTab(index),
      child: Container(
        child: Image.asset(
          fit: BoxFit.fill,
          selectedTab == index ? selectedIcon : icon,
          height: 50,
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

  Widget _getBody() {
    switch (selectedTab) {
      case 0:
        return HomeView(
          onTapJoinButton: () => changeTab(3),
          onTapBack: () => changeTab(2),
        );
      case 1:
        return FriendsView(
          onTapJoinButton: () => changeTab(1),
          onTapBack: () => changeTab(0),
        );
      case 2:
        return HomeView(
          onTapJoinButton: () => changeTab(3),
          onTapBack: () => changeTab(0),
        );
      case 3:
        return ShopView(
          onTapJoinButton: () {},
          onTapBack: () {},
        );
      default:
        return HomeView(
          onTapJoinButton: () => changeTab(3),
          onTapBack: () => changeTab(0),
        );
    }
  }
}
