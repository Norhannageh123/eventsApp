import 'package:evently_app/UI/tabs/favorite_tab/favorite.dart';
import 'package:evently_app/UI/tabs/home_tab/home.dart';
import 'package:evently_app/UI/tabs/map_tab/map.dart';
import 'package:evently_app/UI/tabs/profile_tab/profile.dart';
import 'package:evently_app/utls/app_colo.dart';
import 'package:evently_app/utls/app_images.dart';
import 'package:evently_app/utls/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int selectedIndex=0;
   List<Widget>tabs=[
    const HomeTab(),
    const mapTab(),
    const favoriteTab(),
    const ProfileTab(),
   ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColor.transparentColor,
        ),
        child: BottomAppBar(
          padding: EdgeInsets.zero,
          shape: const CircularNotchedRectangle(),
          notchMargin: 4,
          color:Theme.of(context).primaryColor,
          child: BottomNavigationBar(
            items: [
              buildBottomNavItem(
                 AppImages.home, AppLocalizations.of(context)!.home,AppImages.homeFill,0),
              buildBottomNavItem(
                  AppImages.map, AppLocalizations.of(context)!.map,AppImages.mapFill,1),
              buildBottomNavItem(
                  AppImages.heart, AppLocalizations.of(context)!.love,AppImages.heartFill,2),
              buildBottomNavItem(
                  AppImages.profile, AppLocalizations.of(context)!.profile,AppImages.profileFill,3),
            ],
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex=index;
              setState(() {
                
              });
            },
          ),
        ),

      ),
           floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.of(context).pushNamed(AppRouting.routeAddEvent);
            },
            child:const Icon(Icons.add,size: 25,color:AppColor.whiteColor,)
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  BottomNavigationBarItem buildBottomNavItem(
      String  image, String label,String fullImage,int index) {
    return BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(selectedIndex==index?fullImage:image)),
      label: label,
    );
  }
}
