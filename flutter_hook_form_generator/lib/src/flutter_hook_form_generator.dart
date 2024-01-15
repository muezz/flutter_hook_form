// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:flutter_hook_form_annotation/flutter_hook_form_annotation.dart';
import 'package:flutter_hook_form_generator/src/flutter_hook_form_visitor.dart';
import 'package:source_gen/source_gen.dart';

class JsonGenerator extends GeneratorForAnnotation<FlutterHookForm> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! TopLevelVariableElement || !element.type.isDartCoreMap) {
      throw InvalidGenerationSourceError(
        '@flutterHookForm can only be applied on top level Map<String, Zod> variable. Failing element: ${element.name}',
        element: element,
      );
    }
    final visitor = ModelVisitor();
    // element.visitChildren(visitor);
    element.accept(visitor);
    print(visitor.result);

    final buffer = StringBuffer();

    // buffer.writeln('import \'package:generators/src/flutter_hook_form_generator.dart\' as h;');
    buffer.writeln('abstract class SomeClass {');
    // for (int i = 0; i < visitor.fields.length; i++) {
    //   buffer.writeln('  ${visitor.fields.values.elementAt(i)} ${visitor.fields.keys.elementAt(i)};');
    //   buffer.writeln('  bool get ${visitor.fields.keys.elementAt(i)}Validator => false;');
    // }
    // buffer.writeln('  List<FlutterHookFormModel> get forms => [];');
    buffer.writeln('}');

    return buffer.toString();
  }
}
