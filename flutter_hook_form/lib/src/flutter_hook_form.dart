import 'package:flutter_zod/flutter_zod.dart';

enum InputType {
  textField,
  radio,
  checkbox,
  // checkboxGroup,
  choiceChip,
  dateRangePicker,
  dateTimePicker,
  dropdown,
  filterChip,
  radioGroup,
  rangeSlider,
  slider,
  toggle,
}

abstract class FlutterHookForms {
  final Map<String, Map<String, Zod>> forms;

  FlutterHookForms({
    required this.forms,
  });
}
