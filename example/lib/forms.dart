import 'package:flutter_hook_form/flutter_hook_form.dart';
import 'package:flutter_hook_form_annotation/flutter_hook_form_annotation.dart';
import 'package:flutter_zod/flutter_zod.dart';

part 'forms.g.dart';

@flutterHookForm
class MyForms implements FlutterHookForms {
  static const a = 5;
  @override
  Map<String, Map<String, Zod>> get forms => {
        'loginFormSchema': {
          'username': Zod().string(),
          'password': Zod().string(),
        }
      };
}

// Idea:
// class LoginForm {
//   final TextInputFieldWidget username;
//   final TextInputFieldWidget password;
// }
