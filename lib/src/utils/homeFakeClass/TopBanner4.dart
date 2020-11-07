
class TopBanner4 {
    int id;
    String url;

    TopBanner4({this.id, this.url});

    factory TopBanner4.fromJson(Map<String, dynamic> json) {
        return TopBanner4(
            id: json['id'], 
            url: json['url'], 
        );
    }
}