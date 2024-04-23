class ValidationForm {
  static String? phoneValidator(value) {
    if (value.isEmpty) {
      return "برجاء ادخال رقم الهاتف";
    }
    return null;
  }

  static String? nameValidator(value) {
    if (value.isEmpty) {
      return "برجاء ادخال الاسم";
    }
    return null;
  }

  static String? dateValidator(value) {
    if (value.isEmpty) {
      return "برجاء ادخال التاريخ";
    }
    return null;
  }

  static String? genderValidator(value) {
    if (value==null||value.isEmpty) {
      return "برجاء ادخال النوع";
    }
    return null;
  }

  static String? emailValidator(value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value!);
    if (value.isEmpty) {
      return "برجاء ادخال البريد الالكتروني";
    } else if (!emailValid) {
      return "البريد الالكتروني غير صالح";
    }
    return null;
  }

  static String? passwordValidator(v) {
    if (v!.length <= 5) {
      return "كلمة المرور ضعيفه";
    } else {
      return null;
    }
  }

  static String? confirmPasswordValidator(text, v) {
    if (text != v) {
      return "كلمة المرور غير متطابقه";
    } else {
      return null;
    }
  }
}
