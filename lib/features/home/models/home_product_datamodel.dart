class ProductModel {
  final String name;
  final String id;
  final String description;
  final String price;
  final String imgurl;

  ProductModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.imgurl,
      required this.price});
}
