class ProductModel{
  final String image;
  final String name;
  final double price;
  final String description;
  int quantity;
  ProductModel({required this.image,required this.name,required this.price,required this.description,this.quantity=1});

}