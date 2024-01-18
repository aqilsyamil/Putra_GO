// enum Roles { passenger, driver, admin }

class Driver {
  String uid;
  String name;
  String email;
  String phoneNumber;
  String icNumber;
  String password;
  // Roles role;

  // Car information
  String carBrand;
  String carPlate;
  String carColor;
  // String carBrand;
  // String carColor;

  Driver({
    required this.uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.icNumber,
    required this.password,
    required this.carBrand,
    required this.carPlate,
    required this.carColor,

    // required this.role,
    // Car information
    // required this.carID,
    // required this.carBrand,
    // required this.carColor,
  });

  // Getters and setters for user attributes
  String get getUid => uid;
  String get getName => name;
  String get getEmail => email;
  String get getPhoneNumber => phoneNumber;
  String get getIcNumber => icNumber;
  String get getPassword => password;
  String get getCarBrand => carBrand;
  String get getCarPlate => carPlate;
  String get getCarColor => carColor;
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
  set setCarID(String newCarPlate) {
    carPlate = newCarPlate;
  }
  //
  // String get getCarBrand => carBrand;
  //
  set setCarBrand(String newCarBrand) {
    carBrand = newCarBrand;
  }
  //
  // String get getCarColor => carColor;
  //
  set setCarColor(String newCarColor) {
    carColor = newCarColor;
  }

  toJson() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "icNumber": icNumber,
      "password": password,
      // Car information
      "carID": carPlate,
      "carBrand": carBrand,
      "carColor": carColor,
    };
  }
}
