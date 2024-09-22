import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EventFormDataProvider extends ChangeNotifier {
  final List<String> _attendeesRequirements = [];
  final List<TicketData> _tickets = [];
  XFile? _heroImage;

  // ----------------------| getters |------------------------
  List<String> get req => _attendeesRequirements;
  XFile? get heroImage => _heroImage;
  List<TicketData> get tickets => _tickets;

  // ----------------------| setters |------------------------
  void addReq(String value) {
    _attendeesRequirements.add(value);
    notifyListeners();
  }

  void removeReq(int index) {
    _attendeesRequirements.removeAt(index);
    notifyListeners();
  }

  void addImage(XFile? image) {
    _heroImage = image;
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
