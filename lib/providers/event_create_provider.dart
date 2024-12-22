import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EventFormDataProvider extends ChangeNotifier {
  String? _title;
  String? _description;
  DateTime? _startingDateTime;
  DateTime? _endingDateTime;
  String? _location;
  final List<String> _attendeesRequirements = [];
  final List<TicketData> _tickets = [];
  XFile? _heroImage;

  // ----------------------| getters |------------------------
  String? get title => _title;
  String? get description => _description;
  String? get location => _location;
  DateTime? get startingDateTime => _startingDateTime;
  DateTime? get endingDateTime => _endingDateTime;
  List<String> get attendeesRequirements => _attendeesRequirements;
  XFile? get heroImage => _heroImage;
  List<TicketData> get tickets => _tickets;

  Map<String, dynamic> get asMap {
    return {
      'title': _title,
      'description': _description,
      'location': _location,
      'attendeesRequirements': _attendeesRequirements,
      'heroImage': _heroImage != null ? _heroImage!.path : "/",
      'tickets': _tickets
    };
  }

  // ----------------------| setters |------------------------
  set title(String? value) {
    _title = value;
    notifyListeners();
  }

  set description(String? value) {
    _description = value;
    notifyListeners();
  }

  set startingDateTime(DateTime? value) {
    _startingDateTime = value;
    notifyListeners();
  }

  set endingDateTime(DateTime? value) {
    _endingDateTime = value;
    notifyListeners();
  }

  set location(String? value) {
    _location = value;
    notifyListeners();
  }

  set heroImage(XFile? image) {
    _heroImage = image;
    notifyListeners();
  }

  void addReq(String value) {
    _attendeesRequirements.add(value);
    notifyListeners();
  }

  void removeReq(int index) {
    _attendeesRequirements.removeAt(index);
    notifyListeners();
  }

  void addTicketData(TicketData ticket) {
    _tickets.add(ticket);
    notifyListeners();
  }

  @override
  void dispose() {
    print("disposing provider");
    super.dispose();
  }
}

class TicketData {
  String title;
  int price;
  int limit;
  List<String> perks;

  TicketData({
    required this.title,
    required this.price,
    required this.limit,
    required this.perks,
  });
}
