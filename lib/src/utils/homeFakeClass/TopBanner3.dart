
class TopBanner3 {
    int id;
    String url;

    TopBanner3({this.id, this.url});

    factory TopBanner3.fromJson(Map<String, dynamic> json) {
        return TopBanner3(
            id: json['id'], 
            url: json['url'], 
        );
    }
}