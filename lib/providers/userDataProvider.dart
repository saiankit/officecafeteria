import 'package:flutter/material.dart';

class UserDataProvider extends ChangeNotifier {
  String fullName;
  String oraganisationName;
  String employeeId;
  int phoneNumber;
  String email;
  updateFullName(String value) {
    fullName = value;
    notifyListeners();
  }

  updateOrganizationName(String value) {
    oraganisationName = value;
    notifyListeners();
  }

  updateEmployeeIdNumber(String value) {
    employeeId = value;
    notifyListeners();
  }

  updatePhoneNumber(String value) {
    phoneNumber = int.parse(value);
    notifyListeners();
  }

  updateEmail(String value) {
    email = value;
    notifyListeners();
  }
}
