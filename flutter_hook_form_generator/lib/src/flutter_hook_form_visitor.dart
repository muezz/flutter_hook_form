// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

class ModelVisitor extends SimpleElementVisitor<void> {
  String functionName = '';
  String result = '';
  Map<String, dynamic> fields = {};

  @override
  void visitTopLevelVariableElement(TopLevelVariableElement element) {
    result = element.val;
    // var type = element.type;

    // if (type is ParameterizedType) {
    //   if (type.element is ClassElement && (type.element as ClassElement).name == 'Map') {
    //     var typeArguments = type.typeArguments;
    //     result = 'Found Map<String, dynamic> variable: ${element.name} - ${typeArguments.toString()}';
    //     // if (typeArguments.length == 2 && typeArguments[0].isDartCoreString && typeArguments[1].isDartCoreObject) {
    //     //   result = 'Found Map<String, dynamic> variable: ${element.name}';
    //     // }
    //   }
    // }
  }
}
