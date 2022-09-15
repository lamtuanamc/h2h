class Error {
  Error({
    this.field,
    this.description,
  });

  String? field;
  String? description;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        field: json["field"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "field": field,
        "description": description,
      };
}
