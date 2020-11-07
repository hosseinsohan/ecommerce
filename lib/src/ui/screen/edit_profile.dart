import 'package:flutter/material.dart';
import 'package:mercikala/src/model/user_information/User.dart';
import 'package:mercikala/src/model/user_information/UserInformation.dart';

enum StateStatus{
  loading,
  loaded,
  error
}
class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String nameType = 'name';
  String phoneType = 'phone';
  String emailType = 'email';
  String cardType = 'card';
  String ibanType = 'iban';
  String nationalCodeType = 'nationalCode';

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final cardController = TextEditingController();
  final ibanController = TextEditingController();
  final nationalCodeController = TextEditingController();

  UserInformation userInformation;
  StateStatus stateStatus;




  receiveData() async{
    try {
      var data = UserInformation(user: User(
        name: 'حسین',
        avatar: 'assets/image/person.png',
        email: 'hossein.sohan@gmail.com',
        mobile: '09016718255'
      ));
      setState(() {
        userInformation = data;
        nameController.text = data.user.name??"";
        phoneController.text = data.user.mobile??"";
        emailController.text = data.user.email??"";

        stateStatus = StateStatus.loaded;
      });
    } catch (e) {
      print('errrrror: $e');
      setState(() {
        stateStatus = StateStatus.error;
      });
    }
  }
  Future editProfile() async{
    try {
      var data =  UserInformation(user: User(
          name: 'حسین',
          avatar: 'assets/image/person.png',
          email: 'hossein.sohan@gmail.com',
          mobile: '09016718255'
      ));
      setState(() {
        userInformation = data;
        nameController.text = data.user.name??"";
        phoneController.text = data.user.mobile??"";
        emailController.text = data.user.email??"";

        stateStatus = StateStatus.loaded;
      });
    } catch (e) {
      print('errrrror: $e');
      setState(() {
        stateStatus = StateStatus.error;
      });
    }
  }

  @override
  void initState() {
    receiveData();
    stateStatus = StateStatus.loading;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    cardController.dispose();
    ibanController.dispose();
    nationalCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: screenSize.width,
                height: screenSize.height * 0.5,
                color: Colors.deepOrangeAccent.withOpacity(0.3),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: screenSize.width,
                    height: screenSize.height * 0.15,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            )),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'ویرایش پروفایل',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: screenSize.height * 0.15,
                  ),

                  Container(
                    width: screenSize.width,
                    height: screenSize.height * 0.85,
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(34),
                          topRight: Radius.circular(34)),
                      boxShadow: [
                        BoxShadow(
                          color:  Colors.deepOrangeAccent.withOpacity(0.3),
                          offset: Offset(0, 3),
                          blurRadius: 29,
                        ),
                      ],
                    ),
                    child: stateStatus == StateStatus.loading
                        ?Container(
                        width: screenSize.width,
                        height: screenSize.height,
                        child: Center(child: CircularProgressIndicator(),))
                        :stateStatus == StateStatus.loaded?SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          textFormField(" نام و نام خانوادگی ", nameType),
                          SizedBox(
                            height: 20,
                          ),
                          textFormField(" شماره تلفن ", phoneType),
                          SizedBox(
                            height: 20,
                          ),
                          textFormField(" ایمیل ", emailType),
                          SizedBox(
                            height: 20,
                          ),
                          textFormField(" کد ملی ", nationalCodeType),
                          SizedBox(
                            height: 20,
                          ),
                          textFormField(" شماره کارت ", cardType),
                          SizedBox(
                            height: 20,
                          ),
                          textFormField(" شماره شبا ", ibanType),
                          SizedBox(
                            height: 56,
                          ),
                          InkWell(
                            onTap: () async{
                              await editProfile();
                            },
                            child: Container(
                              width: screenSize.width - 48,
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: const Color(0xff00c8a6),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x7026b39b),
                                    offset: Offset(0, 4),
                                    blurRadius: 11,
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'ثبت تغییرات',
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 18,
                                  color: const Color(0xffffffff),
                                  letterSpacing: 1.476,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 50,)
                        ],
                      ),
                    ):
                    Container(
                      width: screenSize.width,
                      height: screenSize.height,
                      child: Center(
                        child: Text("به نظر مشکلی پیش آمده است"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textFormField(String labelText, String type) {
    return TextFormField(
      //obscureText: type == "username" ? false : !showPasssword,
      enableInteractiveSelection: false, // will disable paste operation
      focusNode: type==phoneType? AlwaysDisabledFocusNode():null,
      controller: type == nameType
          ? nameController
          : type == phoneType
          ? phoneController
          : type == emailType
          ? emailController
          : type == nationalCodeType
          ? nationalCodeController
          : type == cardType ? cardController : ibanController,
      style: TextStyle(color: Colors.black),
      autofocus: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffe8edef),
        labelText: labelText,
        errorStyle: TextStyle(
          color: Colors.red,
          wordSpacing: 5.0,
        ),
        labelStyle: TextStyle(color: Colors.grey, letterSpacing: 1.3),
        hintStyle: TextStyle(letterSpacing: 1.3),
        contentPadding: EdgeInsets.all(15.0),
        focusedBorder: OutlineInputBorder(
          gapPadding: 0.0,
          borderSide: BorderSide(color: Color(0xff00c8a6)),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          gapPadding: 0.0,
          borderSide: BorderSide(
            color: Color(
                0xffe8edef), /*type == "username"
                  ? userName == null || userName == ""
                  ? Color(0xffe8edef)
                  : Colors.grey
                  : password == null || password == ""
                  ? Color(0xffe8edef)
                  : Colors.grey),*/
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          gapPadding: 0.0,
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onChanged: (value) {
        /*setState(() {
          type == "username" ? userName = value : password = value;
          emailValid = type == "username"
              ? RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value)
              : emailValid;
          activeSignInButton =
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(userName) &&
              (password != "" && password != null)
              ? true
              : false;
        });*/
      },
      validator: (value) {
        /*switch (type) {
          case nameType:
            if (value.isEmpty)
              return '';
            else if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)) return 'Please enter a valid email address';
            break;
          case "password":
            if (value.isEmpty) return 'Please enter password';
            break;
        }*/
        return null;
      },
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}