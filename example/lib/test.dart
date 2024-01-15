import 'package:flutter_hook_form_annotation/flutter_hook_form_annotation.dart';
import 'package:flutter_zod/flutter_zod.dart';

part 'test.g.dart';

@flutterHookForm
Map<String, Zod> loginFormSchema = {
  'username': Zod().string(),
  'password': Zod().string(),
};
