class Show {
  Show({
    this.showId,
    this.name,
    this.startDate,
    this.imageUrl,
  });

  String? showId;
  String? name;
  int? startDate;
  String? imageUrl;

  factory Show.fromJson(Map<String, dynamic> json) => Show(
        showId: json["show_id"],
        name: json["name"],
        startDate: json["start_date"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "show_id": showId,
        "name": name,
        "start_date": startDate,
        "image_url": imageUrl,
      };
}
