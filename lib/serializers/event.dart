import 'dart:convert';

class EventMainResponse {
  bool hasError;
  Error error;
  List<EventResponse> response;
  String message;

  EventMainResponse({
    required this.hasError,
    required this.error,
    required this.response,
    required this.message,
  });

  factory EventMainResponse.fromRawJson(String str) =>
      EventMainResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EventMainResponse.fromJson(Map<String, dynamic> json) =>
      EventMainResponse(
        hasError: json["hasError"],
        error: Error.fromJson(json["error"]),
        response: List<EventResponse>.from(
            json["response"].map((x) => EventResponse.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "hasError": hasError,
        "error": error.toJson(),
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
        "message": message,
      };
}

class Error {
  Error();

  factory Error.fromRawJson(String str) => Error.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Error.fromJson(Map<String, dynamic> json) => Error();

  Map<String, dynamic> toJson() => {};
}

class EventResponse {
  int id;
  String title;
  String description;
  DateTime start;
  DateTime end;
  String heroImage;
  List<String> attendeesReq;
  String location;
  int organizerId;

  EventResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.start,
    required this.end,
    required this.heroImage,
    required this.attendeesReq,
    required this.location,
    required this.organizerId,
  });

  factory EventResponse.fromRawJson(String str) =>
      EventResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EventResponse.fromJson(Map<String, dynamic> json) => EventResponse(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        heroImage: json["hero_image"],
        attendeesReq: List<String>.from(json["attendees_req"].map((x) => x)),
        location: json["location"],
        organizerId: json["organizer_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "start": start.toIso8601String(),
        "end": end.toIso8601String(),
        "hero_image": heroImage,
        "attendees_req": List<dynamic>.from(attendeesReq.map((x) => x)),
        "location": location,
        "organizer_id": organizerId,
      };
}
