// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'dart:io';

import 'package:lz4/lz4.dart';

export "package:lz4/lz4.dart";

class Lz4 {
  static init() {
    String name_library = "liblz4";
    if (Platform.isIOS || Platform.isMacOS) {
      name_library += ".framework/${name_library}";
    }
    if (Platform.isLinux || Platform.isAndroid) {
      name_library += ".so";
    }
    if (Platform.isWindows) {
      name_library += ".dll";
    }
    Lz4Codec.libraryPath = name_library;
  }
}
