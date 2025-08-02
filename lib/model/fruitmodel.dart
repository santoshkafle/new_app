class Fruitmodel {
  final String? id;
  final DateTime? createdTime;
  final String name;
  final String price;
  final String imageUrl;
  final num rating;
  final String description;

  Fruitmodel({
    this.id,
    this.createdTime,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.description,
  });

  factory Fruitmodel.formJson(Map<String, dynamic> json) {
    final fields = json["fields"];
    return Fruitmodel(
      id: json["id"],
      createdTime:
          json["createdTime"] != null
              ? DateTime.parse(json["createdTime"])
              : null,
      name: fields["Name"],
      price: fields["price"],
      imageUrl: fields['imgLink'][0]['url'],
      rating: fields["Rating"],
      description: fields["Description"] ?? "No Description Added in Database.",
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "fields": {
        "Name": name,
        "price": price,
        "imgLink": [
          {"url": imageUrl},
        ],
      },
    };
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      'fields': {
        "Name": name,
        "price": price,
        "Rating": rating,
        "Description": description,
      },
    };
  }
}
