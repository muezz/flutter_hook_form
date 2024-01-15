// /// type of return of the validation
// typedef Validator = String? Function(dynamic value);
// typedef Validator1<T> = (T, String?) Function(T value);

// class Z<T> {
//   /// list of validations
//   final List<Validator1<T>> _validations = [];

//   /// this method is responsible for validation if the param existe
//   Z<T> string([String? message]) {
//     return _add((v) {
//       if (v is String) return (v.trim() as T, null);
//       return (null as T, null);
//       // return Validations.required(v) ? null : message ?? DefaultErrors.required;
//     });
//   }

//   /// this method is responsible for validation if the param existe
//   // Z required([String? message]) {
//   //   return _add((v) {
//   //     return Validations.required(v) ? null : message ?? DefaultErrors.required;
//   //   });
//   // }

//   Z<T> _add(Validator1<T> validator) {
//     _validations.add(validator);
//     return this;
//   }
// }

// /// this is the main class of the package
// /// it is responsible for validating the data
// /// and returning the error message
// class Zod {
//   /// list of validations
//   final List<Validator> _validations = [];

//   /// this method is responsible for validation if the param existe
//   Zod required([String? message]) {
//     return _add((v) {
//       return Validations.required(v) ? null : message ?? DefaultErrors.required;
//     });
//   }

//   Zod _add(Validator validator) {
//     _validations.add(validator);
//     return this;
//   }

//   String? build(dynamic value) {
//     for (var validate in _validations) {
//       final result = validate(value);
//       if (result != null) {
//         if (result == 'opt') return null;
//         return result;
//       }
//     }
//     return null;
//   }

//   ///
//   /// The return id a Map<String, dynamic> with the errors
//   ///
//   static ValidateModel validate({
//     required Map<String, dynamic> data,
//     required Map<String, dynamic> params,
//   }) {
//     final map = _validateMapping(data: data, params: params);
//     return ValidateModel(isValid: map.isEmpty, result: map);
//   }

//   static Map<String, dynamic> _validateMapping({
//     required Map<String, dynamic> data,
//     required Map<String, dynamic> params,
//   }) {
//     final errors = <String, dynamic>{};

//     params.forEach((key, value) {
//       if (value is Zod) {
//         final valid = value.build(data[key] ?? '');
//         if (valid != null) errors.addAll({key: valid});
//       } else if (value is Map) {
//         final res = _validateMapping(
//           data: data[key] ?? {},
//           params: value as Map<String, dynamic>,
//         );
//         if (res.isNotEmpty) errors.addAll({key: res});
//       }
//     });
//     return errors;
//   }
// }

// class Validations {
//   /// verify required validate
//   static bool required(dynamic value) {
//     if (value != null) {
//       if (value is String) return value.trim().isNotEmpty;
//       return true;
//     }
//     return false;
//   }

//   static T r<T>(T? value) {
//     if (value != null) {
//       return value;
//     }
//     return value!;
//   }

//   static String? string<T>(T value) {
//     if (value is String) return value.trim();
//     return null;
//   }
// }

// ///
// /// ValidateModel
// ///
// class ValidateModel {
//   /// true when all params are valid
//   final bool isValid;

//   /// Map with the errors
//   ///
//   /// example:
//   ///
//   /// ```dart
//   /// {
//   ///    'data': {
//   ///      'user_name': 'At least 8 characters'
//   ///    }
//   /// }
//   /// ```
//   ///
//   final Map<String, dynamic> result;

//   ValidateModel({
//     required this.isValid,
//     required this.result,
//   });

//   /// true when `isValid` is false
//   bool get isNotValid => !isValid;
// }

// class DefaultErrors {
//   static String get email => 'Invalid email';
//   static String get emails => 'Invalid emails';
//   static String get equals => 'Different value';
//   static String get phone => 'Invalid phone number';
//   static String type<T>() => 'The parameter must be of type ${T.toString()}';
//   static String min(int v) => 'At least $v characters';
//   static String max(int v) => 'At most $v characters';
//   static String get isDate => 'The date entered is invalid';
//   static String get isMoney => 'Invalid value';
//   static String get required => 'Required field';
//   static String get password => 'Invalid password';
//   static String get custom => 'Invalid value';
// }
