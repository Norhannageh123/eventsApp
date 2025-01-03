import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/UI/tabs/tabs_widgets/toast.dart';
import 'package:evently_app/firebase/event_model.dart';
import 'package:evently_app/firebase/firebaseUtls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class EventListProvider extends ChangeNotifier{
  List<Event> eventList = [];
  int selectedIndex = 0;
  List<String>eventNameList=[];
  void getEventNameList(BuildContext context){
    AppLocalizations.of(context)!.all;
    AppLocalizations.of(context)!.sport;
    AppLocalizations.of(context)!.birthday;
    AppLocalizations.of(context)!.meeting;
    AppLocalizations.of(context)!.gaming;
    AppLocalizations.of(context)!.work_shop;
    AppLocalizations.of(context)!.book_club;
    AppLocalizations.of(context)!.exhibition;
    AppLocalizations.of(context)!.holiday;
    AppLocalizations.of(context)!.eating;
    
  }
 List<Event>favoriteEventList=[];
 List<Event> filtereventList=[];
  void getAllEvents() async {
    QuerySnapshot<Event> querySnapshot = await FirebaseUtls.getEventCollection().get();
    eventList = querySnapshot.docs.map((docs) {
      return docs.data();
    }).toList();
     eventList.sort((Event event1,Event event2){
      return event1.eventTime.compareTo(event2.eventTime);
     });
     filtereventList=eventList;
        notifyListeners();
  }
    void getFilterEvents() async {
    if (eventNameList.isEmpty) return; 
    QuerySnapshot<Event> querySnapshot =
        await FirebaseUtls.getEventCollection().get();
    eventList = querySnapshot.docs.map((docs) {
      return docs.data();
    }).toList();
      filtereventList=eventList.where((event){
        return event.eventName==eventNameList[selectedIndex];
      }).toList();
      eventList.sort((Event event1,Event event2){
      return event1.eventTime.compareTo(event2.eventTime);
     });
    notifyListeners();
  }
   void updateEventFavorite(Event event){
    FirebaseUtls.getEventCollection().doc(event.id).update({
         'is_favorite': !event.isFavorite,
    }).timeout(const Duration(milliseconds: 500),onTimeout: () {
        ToastHelper.showSuccessToast("Event Updated into  Favorire");
    },);
    selectedIndex==0?getAllEvents():getFilterEvents();
    getFavoriteEvent();
    
   }
   void getFavoriteEvent()async{
    QuerySnapshot<Event> querySnapshot =await FirebaseUtls.getEventCollection().orderBy(
      'date',descending: false,
    ).where(
      'is_favorite',isEqualTo: true,
    ).get();
     favoriteEventList=querySnapshot.docs.map((doc){
        return doc.data();
     }).toList();
     notifyListeners();
   }

  void getSelectedIndex(int newSelectedIndex){
          selectedIndex = newSelectedIndex;
          if(selectedIndex==0){
            getAllEvents();
          }
          else{
             getFilterEvents();
          }
         
  }
}
