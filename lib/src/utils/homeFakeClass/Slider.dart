
class Slider {
    int id;
    String url;

    Slider({this.id, this.url});

    factory Slider.fromJson(Map<String, dynamic> json) {
        return Slider(
            id: json['id'], 
            url: json['url'], 
        );
    }
}