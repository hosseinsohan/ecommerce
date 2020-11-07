

import 'package:mercikala/src/model/user_information/User.dart';

class UserInformation {
    bool status;
    User user;

    UserInformation({this.status, this.user});

    factory UserInformation.fromJson(Map<String, dynamic> json) {
        return UserInformation(
            status: json['status'], 
            user: json['user'] != null ? User.fromJson(json['user']) : null, 
        );
    }

}