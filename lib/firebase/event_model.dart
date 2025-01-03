class Event{
  static const String collectionName='Events';
  String id;
  String eventTitle;
  String eventDescription;
  String eventImage;
  String eventName;
  DateTime eventDate;
  String eventTime;
  bool isFavorite;
  Event({
    this.id='',
    required this.eventTitle,
    required this.eventDescription,
    required this.eventImage,
    required this.eventName,
    required this.eventDate,
    required this.eventTime,
     this.isFavorite=false,
  });
  Event.fromFireStore(Map<String,dynamic>?data):this(
     id: data!['id'] ,
     eventTitle: data['title'],
     eventDescription: data['description'],
     eventImage: data['image'],
     eventName: data['event_name'],
     eventDate: DateTime.fromMillisecondsSinceEpoch(data['date']),
     eventTime: data['time'],
     isFavorite: data['is_favorite'],
  );
  Map<String,dynamic>toFireStore(){
    return {
      'id':id,
      'title':eventTitle,
      'description': eventDescription,
      'image': eventImage,
      'event_name': eventName,
      'date':eventDate.millisecondsSinceEpoch,
      'time': eventTime,
      'is_favorite': isFavorite,

    };
  }
}