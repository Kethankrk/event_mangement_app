import 'dart:convert';

class DjangoResponse {
    bool hasError;
    Error error;
    Map<String, dynamic> response;
    String message;
    int errorCode;

    DjangoResponse({
        required this.hasError,
        required this.error,
        required this.response,
        required this.message,
        required this.errorCode,
    });

    factory DjangoResponse.fromRawJson(String str) => DjangoResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DjangoResponse.fromJson(Map<String, dynamic> json) => DjangoResponse(
        hasError: json["hasError"],
        error: Error.fromJson(json["error"]),
        response: json["response"],
        message: json["message"],
        errorCode: json["errorCode"],
    );

    Map<String, dynamic> toJson() => {
        "hasError": hasError,
        "error": error.toJson(),
        "response": response,
        "message": message,
        "errorCode": errorCode,
    };
}

class Error {
    Error();

    factory Error.fromRawJson(String str) => Error.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Error.fromJson(Map<String, dynamic> json) => Error(
    );

    Map<String, dynamic> toJson() => {
    };
}
