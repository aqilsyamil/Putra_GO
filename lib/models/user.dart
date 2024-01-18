// enum Roles { passenger, driver, admin }

class User {
  String uid;
  String name;
  String email;
  String phoneNumber;
  String icNumber;
  String password;
  // Roles role;

  // Car information
  // String carID;
  // String carBrand;
  // String carColor;

  User({
    required this.uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.icNumber,
    required this.password,
  });

  // Getters and setters for user attributes
  String get getUid => uid;
  String get getName => name;
  String get getEmail => email;
  String get getPhoneNumber => phoneNumber;
  String get getIcNumber => icNumber;
  String get getPassword => password;
  // Roles get getRole => role;

  set setUid(String newUid) {
    uid = newUid;
  }

  set setName(String newName) {
    name = newName;
  }

  set setEmail(String newEmail) {
    email = newEmail;
  }

  set setPhoneNumber(String newPhoneNumber) {
    phoneNumber = newPhoneNumber;
  }

  set setIcNumber(String newIcNumber) {
    icNumber = newIcNumber;
  }

  set setPassword(String newPassword) {
    password = newPassword;
  }

  // set setRole(Roles newRole) {
  //   role = newRole;
  // }

  // Getters and setters for car information
  // String get getCarID => carID;
  //
  // set setCarID(String newCarID) {
  //   carID = newCarID;
  // }
  //
  // String get getCarBrand => carBrand;
  //
  // set setCarBrand(String newCarBrand) {
  //   carBrand = newCarBrand;
  // }
  //
  // String get getCarColor => carColor;
  //
  // set setCarColor(String newCarColor) {
  //   carColor = newCarColor;
  // }

  toJson() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "icNumber": icNumber,
      "password": password,
      // "role": role.toString(),
      // Car information
      // "carID": carID,
      // "carBrand": carBrand,
      // "carColor": carColor,
    };
  }
}
