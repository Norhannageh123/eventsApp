import 'package:evently_app/UI/tabs/add_event/add_event_widgets/custom_date_or_time.dart';
import 'package:evently_app/UI/tabs/home_tab/home_widgets/tab_event_widget.dart';
import 'package:evently_app/UI/tabs/tabs_widgets/custom_elevated_button.dart';
import 'package:evently_app/UI/tabs/tabs_widgets/custom_text_field.dart';
import 'package:evently_app/UI/tabs/tabs_widgets/toast.dart';
import 'package:evently_app/firebase/event_model.dart';
import 'package:evently_app/firebase/firebaseUtls.dart';
import 'package:evently_app/providers/eventList_proider.dart';
import 'package:evently_app/utls/app_colo.dart';
import 'package:evently_app/utls/app_images.dart';
import 'package:evently_app/utls/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  int selectedIndex = 0;
  final formKey = GlobalKey<FormState>();
  String formatDate="";//saveDate
  DateTime?selectedDate;
  TimeOfDay? selectedTime;//saveItem
  String formatTime="";
  var titleController=TextEditingController();//saveTitle
  var descriptionController=TextEditingController();//saveDesc
  String? selectedImage='';
  String? selectedEvent='';
  late EventListProvider eventProvider=eventProvider;
  @override
  Widget build(BuildContext context) {
      eventProvider=Provider.of<EventListProvider>(context);
    List<String> eventsNameList = [
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
    List<String> eventImageList = [
      Theme.of(context).brightness == Brightness.dark
          ? AppImages.sportImgDark
          : AppImages.sportImgLight,
      Theme.of(context).brightness == Brightness.dark
          ? AppImages.birthdayImgDark
          : AppImages.birthdayImgLight,
      Theme.of(context).brightness == Brightness.dark
          ? AppImages.meetingImgDark
          : AppImages.meetingImgLight,
      Theme.of(context).brightness == Brightness.dark
          ? AppImages.gamingImgDark
          : AppImages.gamingImgLight,
      Theme.of(context).brightness == Brightness.dark
          ? AppImages.workShopImgDark
          : AppImages.workShopImgLight,
      Theme.of(context).brightness == Brightness.dark
          ? AppImages.bookImageDark
          : AppImages.bookImgLight,
      Theme.of(context).brightness == Brightness.dark
          ? AppImages.exhibitionImgDark
          : AppImages.exhibitionImgLight,
      Theme.of(context).brightness == Brightness.dark
          ? AppImages.holidayImgDark
          : AppImages.holidayImgLight,
      Theme.of(context).brightness == Brightness.dark
          ? AppImages.eatingImgDark
          : AppImages.eatingImgLight,
    ];

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    selectedImage=eventImageList[selectedIndex];
    selectedEvent=eventsNameList[selectedIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.create_event,
            style: AppStyle.blue16bold),
        centerTitle: true,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColor.primaryDark
            : AppColor.whiteColor,
        iconTheme: const IconThemeData(color: AppColor.babyBlueColor),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(selectedImage!),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                height: height * 0.05,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        selectedIndex = index;
                        setState(() {});
                      },
                      child: TabEventWidget(
                          selectedEventDark: AppColor.babyBlueColor,
                          selectedEventLight: AppColor.babyBlueColor,
                          styleEventDarkSelected: AppStyle.dark16Medium,
                          styleEventDarkUnSelected: AppStyle.blue16Medium,
                          styleEventLightSelected: AppStyle.white16Medium,
                          styleEventLightUnSelected: AppStyle.blue16Medium,
                          isSelected: selectedIndex == index,
                          eventName: eventsNameList[index]),
                    );
                  },
                  itemCount: eventsNameList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: width * 0.02,
                    );
                  },
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(AppLocalizations.of(context)!.title,
                        style: Theme.of(context).brightness == Brightness.dark
                            ? AppStyle.white16bold
                            : AppStyle.black16Bold),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    CustomTextField(
                      controller: titleController,
                      validator: (text){
                        if(text==null||text.isEmpty){
                          return AppLocalizations.of(context)!.please_enter_event_title;
                        }
                         return null;
                      },
                      hintText: AppLocalizations.of(context)!.event_title,
                      style: Theme.of(context).brightness == Brightness.dark
                          ? AppStyle.white16Medium
                          : AppStyle.grey16Medium,
                      prefixIcon:
                          Theme.of(context).brightness == Brightness.dark
                              ? Image.asset(AppImages.editDarkIcon)
                              : Image.asset(AppImages.editLightIcon),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(AppLocalizations.of(context)!.description,
                        style: Theme.of(context).brightness == Brightness.dark
                            ? AppStyle.white14Bold
                            : AppStyle.black16Bold),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    CustomTextField(
                      controller: descriptionController,
                       validator: (text){
                        if(text==null||text.isEmpty){
                          return AppLocalizations.of(context)!.please_enter_event_description;
                        }
                         return null;
                      },
                      maxLines: 4,
                      hintText: AppLocalizations.of(context)!.event_description,
                      style: Theme.of(context).brightness == Brightness.dark
                          ? AppStyle.white16Medium
                          : AppStyle.grey16Medium,
                      obscureText: false,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomDateOrTime(
                        imageDateOrTime:
                            Theme.of(context).brightness == Brightness.dark
                                ? AppImages.calndreDarkIcon
                                : AppImages.calnderLightIcon,
                        chooseDateOrTime:selectedDate==null?
                            AppLocalizations.of(context)!.choose_date:DateFormat("dd/MM/yyyy").format(selectedDate!),
                        chooseDateOrTimeClicked: chooseDate,
                        textDateOrTime:
                            AppLocalizations.of(context)!.event_date),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    CustomDateOrTime(
                        imageDateOrTime:
                            Theme.of(context).brightness == Brightness.dark
                                ? AppImages.clockDarkIcon
                                : AppImages.clockLightIcon,
                        chooseDateOrTime:selectedTime==null?
                            AppLocalizations.of(context)!.choose_time:formatTime,
                        chooseDateOrTimeClicked: chooseTime,
                        textDateOrTime:
                            AppLocalizations.of(context)!.event_time),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      AppLocalizations.of(context)!.location,
                      style: Theme.of(context).brightness == Brightness.dark
                          ? AppStyle.white16bold
                          : AppStyle.black16Bold,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.02,
                        vertical: height * 0.01,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: AppColor.babyBlueColor,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.02,
                              vertical: height * 0.01,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColor.babyBlueColor,
                            ),
                            child:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Image.asset(AppImages.locationDarkIcon)
                                    : Image.asset(AppImages.locationLightIcon),
                          ),
                          SizedBox(
                            width: width * 0.04,
                          ),
                          Text(
                            AppLocalizations.of(context)!.choose_event_location,
                            style: AppStyle.blue16bold,
                          ),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios,
                              size: 20, color: AppColor.babyBlueColor),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomElevatedButton(
                        text: AppLocalizations.of(context)!.add_event,
                        textStyle: AppStyle.white16bold,
                        onClickedButton: addEvent),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
 void  addEvent(){
     if(formKey.currentState?.validate()==true){
            //add event
            Event event=Event(
              eventTitle: titleController.text,
               eventDescription: descriptionController.text,
                eventImage: selectedImage!,
                 eventName: selectedEvent!,
                  eventDate: selectedDate!,
                   eventTime: formatTime,
                   );
            FirebaseUtls.addEventToFireStore(event).timeout(const Duration(milliseconds: 500),
            onTimeout: (){
                ToastHelper.showSuccessToast("event added Successfully");
            });
             eventProvider.getAllEvents();
            Navigator.of(context).pop();
     }
  }
  chooseDate() async{
   var chooseDate=await showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate:DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 730)),
       );
       selectedDate=chooseDate;
        setState(() {
         
       });
  }
  chooseTime()async {
     var chooseTime=await showTimePicker(
      context: context,
       initialTime: TimeOfDay.now()
       );
       selectedTime=chooseTime;
       formatTime=selectedTime!.format(context);
       setState(() {
         
       });
  }
      
}
