import 'dart:convert';
import 'package:complex_json_example/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventProvider extends ChangeNotifier {
  late EventModel eventModel;

  final List<Event> _events = [];

  List<Event> get eventsList => _events;

  /// TO PARSE `JSON` DATA TO `DART` MODEL
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/events.json');
    final data = await jsonDecode(response);
    debugPrint(data.toString());
    eventModel = eventModelFromJson(response);
    notifyListeners();
  }

  /// Method to get the `events` on the behalf of given `date` in parameter
  void getEvents({required String date}) {
    _events.clear();
    for (final element in eventModel.data.trainings.first.trainingEvents) {
      if (element.date == date) {
        debugPrint(element.day);
        _events.addAll(element.events);
      }
    }
    notifyListeners();
  }
}

/// Extension to get the `color` on based of `status`
extension StatusToColor on String {
  Color get statusColor {
    switch (this) {
      case 'High':
        return Colors.red;
      case 'Mid':
        return Colors.yellow;
      case 'Low':
        return Colors.blue;
      default:
        return Colors.white;
    }
  }
}
