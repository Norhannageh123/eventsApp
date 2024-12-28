import 'package:evently_app/UI/tabs/home_tab/home_widgets/eventCard.dart';
import 'package:evently_app/UI/tabs/home_tab/home_widgets/tab_event_widget.dart';
import 'package:evently_app/utls/app_colo.dart';
import 'package:evently_app/utls/app_images.dart';
import 'package:evently_app/utls/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
  
    //final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    List<String> eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.work_shop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
    TextStyle textstyleDark = Theme.of(context).brightness == Brightness.dark
    ? AppStyle.black16Bold: AppStyle.blue16bold;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Color appBarColor = Theme.of(context).brightness == Brightness.dark
        ? AppColor.primaryDark
        : AppColor.babyBlueColor;

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.welcome_back,
                    style: AppStyle.white14Bold,
                  ),
                  Text(
                    "Norhan Nageh",
                    style: AppStyle.white24Bold,
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(AppImages.sunLight),
                  const SizedBox(width: 5),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.01, vertical: height * 0.01),
                    margin: EdgeInsets.only(right: width * 0.005),
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text("EN", style: textstyleDark),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              height: height * 0.1,
              decoration: BoxDecoration(
                color: appBarColor,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(AppImages.map),
                      SizedBox(width: width * 0.02),
                      Text(
                        "Cairo,Egypt",
                        style: AppStyle.white14Bold,
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  DefaultTabController(
                    length: eventsNameList.length,
                    child: TabBar(
                      onTap: (index) {
                        selectedIndex = index;
                        setState(() {});
                      },
                      tabAlignment: TabAlignment.start,
                      indicatorColor: AppColor.transparentColor,
                      dividerColor: AppColor.transparentColor,
                      labelPadding:
                          EdgeInsets.symmetric(horizontal: width * 0.01),
                      isScrollable: true,
                      tabs: eventsNameList.map((eventName) {
                        return TabEventWidget(
                          styleEventDarkSelected:AppStyle.white16Medium ,
                          styleEventDarkUnSelected: AppStyle.white16Medium, 
                          styleEventLightSelected:AppStyle.blue16Medium , 
                          styleEventLightUnSelected:AppStyle.white16Medium , 

                          selectedEventDark: AppColor.babyBlueColor,
                          selectedEventLight: AppColor.whiteColor,
                            isSelected:
                                selectedIndex == eventsNameList.indexOf(eventName),
                            eventName: eventName);
                      }).toList(),
                    ),
                  ),
                ],
              ),
      
              
            ),
      
            Expanded(
                    child:ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                           return const EventCard();
                        },
                        itemCount: 10,
      
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
