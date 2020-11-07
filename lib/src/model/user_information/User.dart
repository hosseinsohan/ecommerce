
class User {
    String avatar;
    String email;
    String name;
    String mobile;

    User({this.avatar, this.email, this.name, this.mobile});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            avatar: json['avatar'] != null ? json['avatar'] : 'null',
            email: json['email']!= null ? json['email'] : null,
            name: json['name']!= null ? json['name'] : null,
            mobile: json['mobile']!= null ? json['mobile'] : null,
        );
    }
}