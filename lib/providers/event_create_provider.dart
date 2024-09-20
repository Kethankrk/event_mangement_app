import 'package:flutter/material.dart';

class EventFormDataProvider extends ChangeNotifier {
  final List<String> _attendeesRequirements = [];

  List<String> get req => _attendeesRequirements;

  void addReq(String value) {
    _attendeesRequirements.add(value);
    notifyListeners();
  }

  @override
  void dispose() {
    print("disposing provider");
    super.dispose();
  }
}
