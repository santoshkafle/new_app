class VegatableModel {
  final String? id;
  final DateTime? createdTime;
  final String name;
  final String price;
  final String imageUrl;

  VegatableModel({
    this.id,
    this.createdTime,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  factory VegatableModel.formJson(Map<String, dynamic> json) {
    final fields = json["fields"];
    return VegatableModel(
      id: json["id"],
      createdTime:
          json["createdTime"] != null
              ? DateTime.parse(json["createdTime"])
              : null,
      name: fields["Name"],
      price: fields["price"],
      imageUrl: fields["imgLink"][0]["url"],
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
      "fields": {"Name": name, "price": price},
    };
  }
}
