import 'package:evently_app/UI/tabs/home_tab/home_widgets/eventCard.dart';
import 'package:evently_app/UI/tabs/tabs_widgets/custom_text_field.dart';
import 'package:evently_app/utls/app_colo.dart';
import 'package:evently_app/utls/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class favoriteTab extends StatelessWidget {
  const favoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
      Color appBarColor = Theme.of(context).brightness == Brightness.dark
        ? AppColor.primaryDark
        : AppColor.whiteColor;
    return Scaffold(
      appBar: AppBar(
            backgroundColor: appBarColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomTextField(
              hintText: AppLocalizations.of(context)!.search_for_event,
              hintStyle: AppStyle.blue16bold,
              style: AppStyle.blue16Medium,
              borderColor: AppColor.babyBlueColor,
              prefixIcon: const Icon(Icons.search,color: AppColor.babyBlueColor,size: 30,),
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
        ],),
    );
  }
}