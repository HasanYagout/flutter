
String? nameValidation(String? name){
  if (name!.isEmpty) {
    return "اكتب اسم المستخدم";
  } else {

    if (!name
        .contains(new RegExp(r"[a-z]"))) {
      return "abc يجب ان يتضمن اسم المستخدم حروف صغيرة  ";
    } else {
      if (!name.contains(
          new RegExp(r'[0-9]')) && 1!=1) {
        return "يجب ان يتضمن اسم المستخدم ارقام 123";
      }                                                 }
  }
}