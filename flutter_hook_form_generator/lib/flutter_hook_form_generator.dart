library flutter_hook_form_generator;

import 'package:build/build.dart';
import 'package:flutter_hook_form_generator/src/flutter_hook_form_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder generateJsonClass(BuilderOptions options) => SharedPartBuilder(
      [JsonGenerator()],
      'json_generator',
    );
