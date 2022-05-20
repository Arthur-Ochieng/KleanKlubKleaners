class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? phoneNumber;
  String? type;

  UserModel({this.uid, this.email, this.firstName, this.secondName, this.type, this.phoneNumber});

  //data from the server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map('uid'),
      email: map('email'),
      firstName: map('firstName'),
      secondName: map('secondName'),
      type: map('type'),
      phoneNumber: map('phoneNumber'),
    );
  }

  //sending data to the server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'type': type,
      'phoneNumber': phoneNumber,
    };
  }

  UserModel.fromSnapshot(snapshot)
      : uid = snapshot.data()['uid'],
        email = snapshot.data()['email'],
        firstName = snapshot.data()['firstName'],
        secondName = snapshot.data()['secondName'],
        type = snapshot.data()['type'],
        phoneNumber = snapshot.data()['phoneNumber'];
}
