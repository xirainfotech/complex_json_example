import 'dart:convert';

EventModel eventModelFromJson(String str) =>
    EventModel.fromJson(json.decode(str));

class EventModel {
  EventModel({
    required this.isSuccess,
    required this.data,
    required this.message,
  });

  bool isSuccess;
  Data data;
  String message;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        isSuccess: json["is_success"],
        data: Data.fromJson(json["data"]),
        message: json["message"] ?? '',
      );
}

class Data {
  Data({
    required this.trainings,
  });

  List<Training> trainings;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        trainings: List<Training>.from(
            json["trainings"].map((x) => Training.fromJson(x))),
      );
}

class Training {
  Training({
    required this.month,
    required this.trainingEvents,
  });

  String month;
  List<TrainingEvent> trainingEvents;

  factory Training.fromJson(Map<String, dynamic> json) => Training(
        month: json["Month"],
        trainingEvents: List<TrainingEvent>.from(
            json["training_events"].map((x) => TrainingEvent.fromJson(x))),
      );
}

class TrainingEvent {
  TrainingEvent({
    required this.date,
    required this.day,
    required this.events,
  });

  String date;
  String day;
  List<Event> events;

  factory TrainingEvent.fromJson(Map<String, dynamic> json) => TrainingEvent(
        date: json["Date"].toString(),
        day: json["Day"],
        events: List<Event>.from(json["Events"].map((x) => Event.fromJson(x))),
      );
}

class Event {
  Event({
    required this.id,
    required this.status,
    required this.te,
  });

  int id;
  String status;
  Te te;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        status: json["status"] ?? '',
        te: Te.fromJson(json["TE"]),
      );
}

class Te {
  Te({
    required this.tmName,
  });

  String tmName;

  factory Te.fromJson(Map<String, dynamic> json) => Te(
        tmName: json["tm_name"],
      );

  Map<String, dynamic> toJson() => {
        "tm_name": tmName,
      };
}
