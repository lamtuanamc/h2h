class SeatList {
  SeatList({
    this.seatId,
    this.seatCode,
    this.showId,
    this.status,
    this.bookedDate,
  });

  String? seatId;
  String? seatCode;
  String? showId;
  String? status;
  int? bookedDate;

  factory SeatList.fromJson(Map<String, dynamic> json) => SeatList(
        seatId: json["seat_id"],
        seatCode: json["seat_code"],
        showId: json["show_id"],
        status: json["status"],
        bookedDate: json["booked_date"],
      );

  Map<String, dynamic> toJson() => {
        "seat_id": seatId,
        "seat_code": seatCode,
        "show_id": showId,
        "status": status,
        "booked_date": bookedDate,
      };
}
