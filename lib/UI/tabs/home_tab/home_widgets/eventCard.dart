import 'package:evently_app/firebase/event_model.dart';
import 'package:evently_app/providers/eventList_proider.dart';
import 'package:evently_app/utls/app_colo.dart';
import 'package:evently_app/utls/app_images.dart';
import 'package:evently_app/utls/app_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventCard extends StatelessWidget {
  EventCard({super.key,required this.event});
  Event event;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var eventListProvider=Provider.of<EventListProvider>(context);
    Color containerBG = Theme.of(context).brightness == Brightness.dark
        ? AppColor.primaryDark
        : AppColor.whiteColor;
    TextStyle textstyleDark = Theme.of(context).brightness == Brightness.dark
        ? AppStyle.white16Medium
        : AppStyle.black16Medium;
    String imageDark = Theme.of(context).brightness == Brightness.dark
        ? event.eventImage
        : event.eventImage;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.01,
      ),
      child: Container(
        height: height * 0.31,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: AppColor.babyBlueColor,
            width: 2,
          ),
          image: DecorationImage(
              image: AssetImage(
                imageDark,
              ),
              fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.01,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: height * 0.01,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: containerBG,
              ),
              child: Column(
                children: [
                  Text(
                    '${event.eventDate.day}',
                    style: AppStyle.blue20bold,
                  ),
                  Text(
                       DateFormat('MMM').format(event.eventDate),
                    style: AppStyle.blue20bold,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: height * 0.01,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: containerBG,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    event.eventTitle,
                    style: textstyleDark,
                  ),
                  InkWell(
                    onTap: (){
                      eventListProvider.updateEventFavorite(event);
                    },
                    child: event.isFavorite==true?Image.asset(AppImages.heartFill,color:AppColor.babyBlueColor):
                    Image.asset(
                      AppImages.heart,
                      color: AppColor.babyBlueColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
