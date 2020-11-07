
class Product {
    int id;
    int orginal_price;
    int price;
    String title;
    String url;

    Product({this.id, this.orginal_price, this.price, this.title, this.url});

    factory Product.fromJson(Map<String, dynamic> json) {
        return Product(
            id: json['id'], 
            orginal_price: json['orginal_price'], 
            price: json['price'], 
            title: json['title'], 
            url: json['url'], 
        );
    }
}