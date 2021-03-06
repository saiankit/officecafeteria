import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:officecafeteria/views/common/authWrapper.dart';
import 'package:officecafeteria/views/screens/settingsScreen/components/userInfo.dart';
import 'package:officecafeteria/views/screens/settingsScreen/profile_menu.dart';

final secureStorage = FlutterSecureStorage();

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          UserInfo(
            info: 'name',
            icon: "assets/user.svg",
          ),
          UserInfo(
            info: 'email',
            icon: "assets/email.svg",
          ),
          UserInfo(
            info: 'phoneNumber',
            icon: "assets/phone-call.svg",
          ),
          UserInfo(
            info: 'organization',
            icon: "assets/group.svg",
          ),
          UserInfo(
            info: 'registrationId',
            icon: "assets/face-detection.svg",
          ),
          UserInfo(
            info: 'employeeId',
            icon: "assets/touch.svg",
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/Log out.svg",
            press: () {
              showLogOutDialog(context);
            },
          ),
        ],
      ),
    );
  }
}

void clearUserData() async {
  await secureStorage.write(key: 'jwt', value: "");
  await secureStorage.write(key: 'name', value: "");
  await secureStorage.write(key: 'organization', value: "");
  await secureStorage.write(key: 'employeeId', value: "");
  await secureStorage.write(key: 'phoneNumber', value: "");
  await secureStorage.write(key: 'email', value: "");
  await secureStorage.write(key: 'password', value: "");
  await secureStorage.write(key: 'registrationId', value: "");
}

void showLogOutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Logout"),
        content: Text("Are you sure you want to logout from the App ?"),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Yes',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onPressed: () {
              clearUserData();
              Future.delayed(Duration.zero, () {
                Navigator.pop(context);
              });
              Future.delayed(Duration.zero, () {
                Navigator.pop(context);
              });
              Future.delayed(Duration.zero, () {
                Navigator.pop(context);
              });
              Future.delayed(Duration.zero, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomAuthWrapper(),
                  ),
                );
              });
            },
          ),
          FlatButton(
            child: new Text("No"),
            onPressed: () {
              Future.delayed(Duration.zero, () {
                Navigator.pop(context);
              });
            },
          ),
        ],
      );
    },
  );
}
