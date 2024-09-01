import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String firstName;
  final String userName;
  String lastName;
  final String email;
  String phonNumber;
  String profilePicture;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.userName,
      required this.lastName,
      required this.email,
      required this.phonNumber,
      required this.profilePicture});

  String get fullName => "$firstName $lastName";
  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();

    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUserName = "$firstName$lastName";

    String userNameWithPrefix = "cwt_ $camelCaseUserName";

    return userNameWithPrefix;
  }

  static UserModel empty() => UserModel(
      id: "",
      firstName: "",
      userName: "",
      lastName: "",
      email: "",
      phonNumber: "",
      profilePicture: "");

  Map<String, dynamic> toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "UserName": userName,
      "Email": email,
      "PhoneNumber": phonNumber,
      "ProfilePicture": profilePicture,
    };
  }

  factory UserModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    return UserModel(
        id: "",
        firstName: "",
        userName: "",
        lastName: "",
        email: "",
        phonNumber: "",
        profilePicture: "");
  }
}
