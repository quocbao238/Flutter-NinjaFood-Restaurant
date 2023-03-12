part of 'helper.dart';

class Validator {
  static String? validateEmail(String? email) {
    if (email == null || email.trim() == "") return null;
    var isValid =
        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if (!isValid) return "COMMON.EMAIL_INVALID".tr;
    return null;
  }

  static String? validatePassword(String? pass) {
    if (pass == null || pass.trim() == "")
      return "COMMON.PASS_REQUITE".tr;
    else if (pass.length < 6) return "COMMON.PASS_REQUITE_LENGTH".tr;
    return null;
  }

  // static String validateURL(String url) {
  //   if (url == null || url.trim() == "")
  //     return translation.text("COMMON.URL_REQUITE");
  //   var isValid = isURL(url, requireTld: false);
  //   if (!isValid) return translation.text("COMMON.URL_INVALID");
  //   return null;
  // }

//  static String validatePhone(String phone) {
//    if (phone == null || phone.trim() == "") return translation.text("COMMON.PHONE_REQUITE");
//    var isValid = RegExp(
//            r"^(\+\d{1,2}\s?)?1?\-?\.?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$")
//        .hasMatch(phone);
//    if (!isValid) return translation.text("COMMON.PHONE_INVALID");
//    return null;
//  }
  static String? validatePhone(String? phone) {
    if (phone == null || phone.trim() == "")
      return "COMMON.PHONE_REQUITE".tr;
    else if (phone.length < 1) return "COMMON.PHONE_INVALID".tr;
    return null;
  }

//
  static String? validateName(String? name) {
    if (name == null || name == "")
      return "COMMON.NAME_REQUITE".tr;
    else if (name.length < 1) return "COMMON.NAME_INVALID".tr;
    return null;
  }

  static String? validateAddress(String? name) {
    if (name == null || name == "")
      return "COMMON.ADDRESS_REQUITE".tr;
    else if (name.length < 1) return "COMMON.ADDRESS_INVALID".tr;
    return null;
  }
//
//   static String validateBirthDay(String birthday) {
//     if (birthday == null || birthday == "")
//       return translation.text("COMMON.BIRTH_REQUITE");
//     else if (birthday.length < 1)
//       return translation.text("COMMON.BIRTH_REQUITE");
//     return null;
//   }
//
//   static String validateGender(String gender) {
//     if (gender == null || gender == "")
//       return translation.text("COMMON.GENDER_REQUITE");
//     else if (gender.length < 1)
//       return translation.text("COMMON.GENDER_REQUITE");
//     return null;
//   }
//
//   static String validateCheckGender(int gender) {
//     if (gender == null || gender == -1)
//       return translation.text("COMMON.GENDER_REQUITE");
//     return null;
//   }
//
//   static String validateSchoolName(String schoolName) {
//     if (schoolName == null || schoolName == "")
//       return translation.text("COMMON.SCHOOL_REQUITE");
//     else if (schoolName.length < 1)
//       return translation.text("COMMON.SCHOOL_REQUITE");
//     return null;
//   }
//
//   static String validateAge(String age) {
//     if (age == null || age.trim() == "")
//       return translation.text("COMMON.AGE_REQUITE");
//     var isValid = RegExp(r"^[0-99]").hasMatch(age);
//     if (!isValid) return translation.text("COMMON.AGE_INVALID");
//     return null;
//   }
//
//   static String validAddress(String address) {
//     if (address == null || address == '')
//       return translation.text("COMMON.ADDRESS_REQUITE");
//     else if (address.length < 1)
//       return translation.text("COMMON.ADDRESS_REQUITE");
//     return null;
//   }
//
//   static String validIdentificationCode(String id) {
//     if (id == null || id.trim() == "")
//       return translation.text("COMMON.IDENTIFICATION_REQUITE");
//     var isValid =
//         RegExp(r"[0-9]").hasMatch(id) && (id.length == 9 || id.length == 12);
//     if (!isValid) return translation.text("COMMON.IDENTIFICATION_INVALID");
//     return null;
//   }
//
//   static String validTin(String tin) {
//     if (tin == null || tin == '')
//       return translation.text("COMMON.TIN_REQUITE");
//     else if (tin.length < 1) return translation.text("COMMON.TIN_REQUITE");
//     return null;
//   }
//
//   static String validMoney(String money) {
//     if (money.isNotEmpty) {
//       bool isValid = RegExp(r"^[0-9]+$").hasMatch(money);
//       if (isValid) {
//         return "";
//       }
//       return "${translation.text("COMMON.MONEY_FAIL")}";
//     }
//     return "${translation.text("COMMON.MONEY_FAIL")}";
//   }
//
//   static String validHospital(int id) {
//     if (id == null || id == -1)
//       return translation.text("COMMON.HOSPITAL_REQUITE");
//     return null;
//   }
}
