import 'package:example_hack2hire/model/reservation_model.dart';
import 'package:example_hack2hire/model/seats_model.dart';
import 'package:example_hack2hire/model/show_model.dart';

class Data {
  Data({
    this.total,
    this.shows,
    this.seatList,
    this.reservations,
  });

  int? total;
  List<Show>? shows;
  List<SeatList>? seatList;
  List<Reservation>? reservations;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        shows: json["shows"] == null
            ? null
            : List<Show>.from(json["shows"].map((x) => Show.fromJson(x))),
        seatList: json["seat_list"] != null
            ? List<SeatList>.from(
                json["seat_list"].map((x) => SeatList.fromJson(x)))
            : null,
        reservations: json["reservations"] == null
            ? null
            : List<Reservation>.from(
                json["reservations"].map((x) => Reservation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "shows": List<dynamic>.from(shows!.map((x) => x.toJson())),
        "seat_list": List<dynamic>.from(seatList!.map((x) => x.toJson())),
        "reservations":
            List<dynamic>.from(reservations!.map((x) => x.toJson())),
      };
}
