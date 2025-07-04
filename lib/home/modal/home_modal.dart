class HomeModel {
  final int id;
  final String title;
  final double price;
  final String thumbnail;

  HomeModel({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      thumbnail: json['thumbnail'],
    );
  }
}
