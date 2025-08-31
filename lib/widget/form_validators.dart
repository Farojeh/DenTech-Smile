class FormValidators {
  // حروف عربية وإنجليزية وأرقام عربية وإنجليزية ومسافات
  final _nameRegex = RegExp(r"^[a-zA-Z\u0600-\u06FF0-9\u0660-\u0669\s]+$");
  final _emailRegex = RegExp(r"^[\w\.-]+@([\w-]+\.)+[\w-]{2,}$");
  // final _phoneRegex = RegExp(r"^[0-9\u0660-\u0669]{10}$");

  // ------------------ اسم المستخدم ------------------
  String? userNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Required Field";
    } 
    if (value.length < 3) {
      return "Name must be at least 3 characters";
    } 
    if (!_nameRegex.hasMatch(value)) {
      return "Only letters (Arabic/English) and numbers are allowed";
    }
    return null;
  }

  // ------------------ البريد الإلكتروني ------------------
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Required Field";
    } 
    if (!_emailRegex.hasMatch(value)) {
      return "Enter correct email";
    }
    return null;
  }

  // ------------------ كلمة المرور ------------------
  String? strongPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Required Field";
    } 
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }

  // ------------------ رقم الهاتف ------------------
  String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Required Field";
    } 
    // if (!_phoneRegex.hasMatch(value)) {
    //   return "Phone number must be 10 digits";
    // }
    

    // نحول الأرقام العربية لأرقام إنجليزية لمطابقة البادئة
    // String normalized = _convertArabicNumbersToEnglish(value);
    // if (!normalized.startsWith("09")) {
    //   return "Enter correct phone number";
    // }

    return null;
  }

  // ------------------ تحقق إن كانت أرقام فقط ------------------
String? isOnlyNumbers(String? value) {
  if (value == null || value.isEmpty) {
    return "Required Field";
  }

  // نستخدم RegExp لقبول الأرقام الإنجليزية والعربية
  final numberRegex = RegExp(r'^[0-9\u0660-\u0669]+$');

  if (!numberRegex.hasMatch(value)) {
    return "Only digits are allowed";
  }

  return null; // valid
}

  // دالة مساعدة لتحويل الأرقام العربية إلى أرقام إنجليزية
  String _convertArabicNumbersToEnglish(String input) {
    const arabicNums = ['٠','١','٢','٣','٤','٥','٦','٧','٨','٩'];
    const englishNums = ['0','1','2','3','4','5','6','7','8','9'];

    for (int i = 0; i < arabicNums.length; i++) {
      input = input.replaceAll(arabicNums[i], englishNums[i]);
    }
    return input;
  }
}
