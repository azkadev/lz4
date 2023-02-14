import 'dart:convert';

import 'package:lz4/lz4.dart';
import 'package:lz4/src/lz4/ffi/codec.dart';

void main(List<String> args) {
  Lz4Codec.libraryPath = "/home/hexaminate/Documents/HEXAMINATE/app/lz4/package/lz4_flutter/example/build/linux/x64/release/bundle/lib/liblz4.so";
  List<int> encode_data = lz4.encode(utf8.encode("azka"));

  print(encode_data);

  print(lz4.bindingVersion.toString());
  print(utf8.decode(lz4.decode(encode_data)));
}
