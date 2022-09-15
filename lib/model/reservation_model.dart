import 'package:example_hack2hire/model/user_model.dart';

class Reservation {
  Reservation({
    this.reservationId,
    this.code,
    this.showId,
    this.seatCode,
    this.status,
    this.bookedDate,
    this.canceledDate,
    this.canceledReason,
    this.user,
  });

  String? reservationId;
  String? code;
  String? showId;
  String? seatCode;
  String? status;
  int? bookedDate;
  int? canceledDate;
  String? canceledReason;
  User? user;

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        reservationId: json["reservation_id"],
        code: json["code"],
        showId: json["show_id"],
        seatCode: json["seat_code"],
        status: json["status"],
        bookedDate: json["booked_date"],
        canceledDate:
            json["canceled_date"] == null ? null : json["canceled_date"],
        canceledReason: json["canceled_reason"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "reservation_id": reservationId,
        "code": code,
        "show_id": showId,
        "seat_code": seatCode,
        "status": status,
        "booked_date": bookedDate,
        "canceled_date": canceledDate == null ? null : canceledDate,
        "canceled_reason": canceledReason,
        "user": user?.toJson(),
      };
}
