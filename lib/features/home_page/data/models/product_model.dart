class ProductModel {
  String productTitle,
      productDescription,
      productPrice,
      productCategory,
      productImage,
      productQuantity,
      productId;
  ProductModel({
    required this.productId,
    required this.productCategory,
    required this.productImage,
    required this.productDescription,
    required this.productPrice,
    required this.productQuantity,
    required this.productTitle,
  });
}
