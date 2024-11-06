class Wine {
  final String name;
  final String imageAssetPath;
  final int criticScore;
  final String bottleSize;
  final int priceUsd;
  final String type;
  final String country;
  final String city;

  Wine({
    required this.name,
    required this.imageAssetPath,
    required this.criticScore,
    required this.bottleSize,
    required this.priceUsd,
    required this.type,
    required this.country,
    required this.city,
  });

  static Wine fromJson(Map<String, dynamic> jsonData) {
    return Wine(
      name: jsonData["name"],
      imageAssetPath: jsonData["image"],
      criticScore: jsonData["critic_score"],
      bottleSize: jsonData["bottle_size"],
      priceUsd: jsonData["price_usd"],
      type: jsonData["type"],
      country: jsonData["from"]["country"],
      city: jsonData["from"]["city"],
    );
  }
}
