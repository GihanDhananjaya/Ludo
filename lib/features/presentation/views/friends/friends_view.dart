import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ludoapp/features/presentation/views/friends/widget/friend_component.dart';
import '../../../../core/service/dependency_injection.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';
import '../../../../utils/app_images.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_state.dart';
import '../../bloc/base_bloc.dart';
import '../../bloc/base_event.dart';
import '../../bloc/base_state.dart';
import '../../common/app_search_component.dart';
import '../../common/top_component.dart';
import '../base_view.dart';

class FriendsView extends BaseView {
  final VoidCallback onTapJoinButton;
  final VoidCallback onTapBack;


  FriendsView({super.key, required this.onTapJoinButton,required this.onTapBack,});

  @override
  State<FriendsView> createState() => _FriendsViewState();
}

class _FriendsViewState extends BaseViewState<FriendsView> {
  var bloc = injection<AuthBloc>();

  final List<PlayerCard>  playerCard=[
    PlayerCard(playerName: 'Mala 56', level: 300, points: 300, onChallenge: () {  }, onChat: () {  },),
    PlayerCard(playerName: 'Nikila Sharu...', level: 3333, points: 300, onChallenge: () {  }, onChat: () {  },),
    PlayerCard(playerName: 'KoTi Ishan', level: 3333, points: 300, onChallenge: () {  }, onChat: () {  },),
    PlayerCard(playerName: 'Dinuka malla', level: 555, points: 300, onChallenge: () {  }, onChat: () {  },),
    PlayerCard(playerName: 'Lahiruu', level: 333, points: 300, onChallenge: () {  }, onChat: () {  },),
  ];

  List<PlayerCard> filteredPeople = [];


  @override
  void initState() {
    setState(() {
      filteredPeople.clear();
      filteredPeople.addAll(playerCard);
    });
    super.initState();
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h,),
                      TopComponent(
                        coins: 12232,
                        gems: 1223,
                        onCoinsTap: () {},
                        onGemsTap: () {}, setting: () {  }, notification: () {  },),
                      SizedBox(height: 21.h,),
                      Text(
                        "Friends",
                        style: TextStyle(
                          fontSize: AppDimensions.kFontSize24,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: AppSearchComponent(
                              searchCriteria: AppSearchCriteria(
                                  defaultValue: '',
                                  onSubmit: (String ) {},
                                  dataset: playerCard.map((e)=>e.playerName).toList(),
                                  onQueryChanged: (p0) {
                                    setState(() {
                                      filteredPeople.clear();
                                      filteredPeople.addAll(
                                        playerCard
                                            .where((element) => element.playerName
                                            .toLowerCase()
                                            .contains(p0.toLowerCase()))
                                            .toList(),
                                      );
                                    });

                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 20.w,),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 9,vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColors.initColors().disableButtonColor
                              ),
                              child: Row(
                                children: [
                                  Image.asset(AppImages.appUser,width: 30.w,height: 30.h,),
                                  Text(
                                    "Add",
                                    style: TextStyle(
                                      fontSize: AppDimensions.kFontSize18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),

                      SizedBox(height: 35.h,),

                      ListView.builder(
                        padding: EdgeInsets.only(top: 0),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: filteredPeople.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final person = filteredPeople[index];
                          return PlayerCard(
                            playerName: person.playerName,
                            level: person.level,
                            points: person.points,
                            onChallenge: () {  },
                            onChat: () {  },);
                        },)


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
