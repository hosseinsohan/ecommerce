
class TopBanner2 {
    int id;
    String url;

    TopBanner2({this.id, this.url});

    factory TopBanner2.fromJson(Map<String, dynamic> json) {
        return TopBanner2(
            id: json['id'], 
            url: json['url'], 
        );
    }
}