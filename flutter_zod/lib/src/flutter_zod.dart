typedef Validator = String? Function(dynamic value);

class Zod {
  /// list of validations
  final List<Validator> _validations = [];

  /// this method is responsible for validation if the param existe
  Zod type<T>([String? message]) {
    return _add((v) {
      if (v is T) return null;
      if (v == null) return null;
      return message ?? DefaultErrors.type<T>();
    });
  }

  Zod string([String? message]) => type<String>();
  Zod integer([String? message]) => type<int>();
  Zod float([String? message]) => type<double>();

  /// this method is responsible for validation if the param existe
  // Z required([String? message]) {
  //   return _add((v) {
  //     return Validations.required(v) ? null : message ?? DefaultErrors.required;
  //   });
  // }

  Zod _add(Validator validator) {
    _validations.add(validator);
    return this;
  }
}

class DefaultErrors {
  static String get email => 'Invalid email';
  static String get emails => 'Invalid emails';
  static String get equals => 'Different value';
  static String get phone => 'Invalid phone number';
  static String type<T>() => 'The parameter must be of type ${T.toString()}';
  static String min(int v) => 'At least $v characters';
  static String max(int v) => 'At most $v characters';
  static String get isDate => 'The date entered is invalid';
  static String get isMoney => 'Invalid value';
  static String get required => 'Required field';
  static String get password => 'Invalid password';
  static String get custom => 'Invalid value';
}
