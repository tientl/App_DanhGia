abstract class Stringvalidator{
  bool isValid(String value);
}

class NonEmptyStringValidator implements Stringvalidator{
  @override
  bool isValid(String value){
    return value.isNotEmpty;
  }
}

class EmailAndPasswordValidator{
  final Stringvalidator emailValidator = NonEmptyStringValidator();
  final Stringvalidator passwordValidator = NonEmptyStringValidator();
  final String invalidEmailErrorText = "Email không được để trống";
  final String invalidPasswordErrorText = "Password không được để trống";
}

class NameAndNumberPhoneValidator{
  final Stringvalidator nameValidator = NonEmptyStringValidator();
  final Stringvalidator phoneValidator = NonEmptyStringValidator();
  final String invalidNameErrorText = "Tên không được để trống";
  final String invalidNumberPhoneErrorText = "Số điện thoại không được để trống";
}