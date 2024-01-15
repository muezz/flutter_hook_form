// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class FlutterHookFormFieldSchema {
  final InputType type;
  final List<Function> validators;

  FlutterHookFormFieldSchema({
    required this.type,
    required this.validators,
  });
}
