class Wine {
  final String name;
  final String imageUrl;
  final int criticScore;
  final String bottleSize;
  final int priceUsd;
  final String type;
  final String country;
  final String city;
  final bool isAvailable;
  bool isFavorite = false;

  Wine({
    required this.name,
    required this.imageUrl,
    required this.criticScore,
    required this.bottleSize,
    required this.priceUsd,
    required this.type,
    required this.country,
    required this.city,
    required this.isAvailable,
  });

  static Wine fromJson(Map<String, dynamic> jsonData) {
    return Wine(
      isAvailable: jsonData["available"],
      name: jsonData["name"],
      imageUrl: jsonData["image"],
      criticScore: jsonData["critic_score"],
      bottleSize: jsonData["bottle_size"],
      priceUsd: jsonData["price_usd"],
      type: jsonData["type"],
      country: jsonData["from"]["country"],
      city: jsonData["from"]["city"],
    );
  }
}
