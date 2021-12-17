class Ropaas {
  final int? id;
  final String model;
  final double oldPrice;
  final double currentPrice;
  final String images;
  final int color;

  Ropaas({
    this.id,
    required this.model,
    required this.oldPrice,
    required this.currentPrice,
    required this.images,
    required this.color,
  });

  factory Ropaas.fromMap(Map<String, dynamic> json) => Ropaas(
        id: json["id"],
        model: json["model"],
        oldPrice: json["oldPrice"],
        currentPrice: json["currentPrice"],
        images: json["images"],
        color: json["color"],
      );
  Map<String, dynamic> toMap() => {
        "id": id,
        "model": model,
        "oldPrice": oldPrice,
        "currentPrice": currentPrice,
        "images": images,
        "color": color,
      };
}
