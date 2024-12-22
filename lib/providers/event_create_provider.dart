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

  bool _nextDisabled = true;
  GlobalKey<FormState>? _currentStageFormKey;

  // ----------------------| getters |------------------------
  String? get title => _title;
  String? get description => _description;
  String? get location => _location;
  DateTime? get startingDateTime => _startingDateTime;
  DateTime? get endingDateTime => _endingDateTime;
  List<String> get attendeesRequirements => _attendeesRequirements;
  XFile? get heroImage => _heroImage;
  List<TicketData> get tickets => _tickets;

  bool get nextDisabled => _nextDisabled;
  GlobalKey<FormState>? get currentStageFormKey => _currentStageFormKey;

  Map<String, dynamic> get asMap {
    return {
      'title': _title,
      'description': _description,
      'location': _location,
      'attendees_req': _attendeesRequirements,
      'start': _startingDateTime!.toIso8601String(),
      'end': _endingDateTime!.toIso8601String(),
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

  set nextDisabled(bool val) {
    _nextDisabled = val;
    notifyListeners();
  }

  set currentStateFormKey(GlobalKey<FormState> formKey) {
    _currentStageFormKey = formKey;
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
