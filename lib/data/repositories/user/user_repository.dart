import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/authentication/models/user_model.dart';
import 'package:ecommerce/utils/exceptions/firebase_auth_exception.dart';
import 'package:ecommerce/utils/exceptions/firebase_exception.dart';
import 'package:ecommerce/utils/exceptions/format_exception.dart';
import 'package:ecommerce/utils/exceptions/platform_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("User").doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw EFireBaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw EFireBaseException(e.code).message;
    } on FormatException catch (_) {
      throw EFormatException(_.toString());
    } on PlatformException catch (e) {
      throw EPlatformException(e.code).message;
    } catch (e) {
      throw 'there is some thing wrong , please try again';
    }
  }
}
