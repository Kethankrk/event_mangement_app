import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EventFormDataProvider extends ChangeNotifier {
  final List<String> _attendeesRequirements = [];
  XFile? _heroImage;

  List<String> get req => _attendeesRequirements;

  XFile? get heroImage => _heroImage;

  void addReq(String value) {
    _attendeesRequirements.add(value);
    notifyListeners();
  }

  void addImage(XFile? image) {
    _heroImage = image;
    notifyListeners();
  }

  @override
  void dispose() {
    print("disposing provider");
    super.dispose();
  }
}
