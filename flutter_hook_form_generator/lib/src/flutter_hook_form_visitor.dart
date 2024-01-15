// ignore_for_file: depend_on_referenced_packages, avoid_print
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:flutter_zod/flutter_zod.dart';

class ModelVisitor extends SimpleElementVisitor<void> {
  List<Map<String, Map<String, Zod>>> forms = [];
  dynamic value;

  @override
  void visitFieldElement(FieldElement element) {
    // fields[element.name] = element.type.toString().replaceFirst('*', '');
    // value = element.computeConstantValue();
    value = element.metadata;
    // throw Exception(element);

    // if (element.metadata.any((meta) => meta.computeConstantValue()?.type?.name == 'FlutterHookForm')) {
    //   var instanceMirror = reflect(element.metadata.first.computeConstantValue()?.type?.element?.newInstance);
    //   var formsGetter = instanceMirror.getField(const Symbol('forms'));
    //   var formsValue = formsGetter.reflectee;

    //   print(formsValue);
    // }
    super.visitFieldElement(element);
  }
}
