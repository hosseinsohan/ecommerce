
class TopBanner1 {
    int id;
    String url;

    TopBanner1({this.id, this.url});

    factory TopBanner1.fromJson(Map<String, dynamic> json) {
        return TopBanner1(
            id: json['id'], 
            url: json['url'], 
        );
    }
}