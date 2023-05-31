import 'package:flutter/cupertino.dart';

class UserModelProvider with ChangeNotifier {
  String? uid;
  String? displayName;
  String? email;
  String? phoneNumber;
  String? photoURL;
  String? token;
  String? tenantId;
  String? creationTime;
  String? lastSignInTime;

  UserModelProvider(
      {this.uid,
      this.displayName,
      this.email,
      this.phoneNumber,
      this.photoURL,
      this.token,
      this.tenantId,
      this.creationTime,
      this.lastSignInTime});

  UserModelProvider.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    displayName = json['displayName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    photoURL = json['photoURL'];
    token = json['token'];
    tenantId = json['tenantId'];
    creationTime = json['creationTime'];
    lastSignInTime = json['lastSignInTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['displayName'] = this.displayName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['photoURL'] = this.photoURL;
    data['token'] = this.token;
    data['tenantId'] = this.tenantId;
    data['creationTime'] = this.creationTime;
    data['lastSignInTime'] = this.lastSignInTime;
    return data;
  }
}
