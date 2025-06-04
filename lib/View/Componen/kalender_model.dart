import 'dart:convert';

ApiKalender apiKalenderFromJson(String str) => ApiKalender.fromJson(json.decode(str));

String apiKalenderToJson(ApiKalender data) => json.encode(data.toJson());

class ApiKalender {
    Meta meta;
    Response response;

    ApiKalender({
        required this.meta,
        required this.response,
    });

    factory ApiKalender.fromJson(Map<String, dynamic> json) => ApiKalender(
        meta: Meta.fromJson(json["meta"]),
        response: Response.fromJson(json["response"]),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "response": response.toJson(),
    };
}

class Meta {
    int code;

    Meta({
        required this.code,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
    };
}

class Response {
    List<Holiday> holidays;

    Response({
        required this.holidays,
    });

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        holidays: List<Holiday>.from(json["holidays"].map((x) => Holiday.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "holidays": List<dynamic>.from(holidays.map((x) => x.toJson())),
    };
}

class Holiday {
    String name;
    String description;
    Date date;
    List<String> type;

    Holiday({
        required this.name,
        required this.description,
        required this.date,
        required this.type,
    });

    factory Holiday.fromJson(Map<String, dynamic> json) => Holiday(
        name: json["name"],
        description: json["description"],
        date: Date.fromJson(json["date"]),
        type: List<String>.from(json["type"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "date": date.toJson(),
        "type": List<dynamic>.from(type.map((x) => x)),
    };
}

class Date {
    DateTime iso;
    Datetime datetime;

    Date({
        required this.iso,
        required this.datetime,
    });

    factory Date.fromJson(Map<String, dynamic> json) => Date(
        iso: DateTime.parse(json["iso"]),
        datetime: Datetime.fromJson(json["datetime"]),
    );

    Map<String, dynamic> toJson() => {
        "iso": "${iso.year.toString().padLeft(4, '0')}-${iso.month.toString().padLeft(2, '0')}-${iso.day.toString().padLeft(2, '0')}",
        "datetime": datetime.toJson(),
    };
}

class Datetime {
    int year;
    int month;
    int day;

    Datetime({
        required this.year,
        required this.month,
        required this.day,
    });

    factory Datetime.fromJson(Map<String, dynamic> json) => Datetime(
        year: json["year"],
        month: json["month"],
        day: json["day"],
    );

    Map<String, dynamic> toJson() => {
        "year": year,
        "month": month,
        "day": day,
    };
}
