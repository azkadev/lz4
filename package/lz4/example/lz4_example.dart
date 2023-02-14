// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:lz4/lz4.dart'; 

void main(List<String> args) {
  Lz4Codec.libraryPath = "/home/hexaminate/Documents/HEXAMINATE/app/lz4/package/lz4_flutter/example/build/linux/x64/release/bundle/lib/liblz4.so";
  List<int> encode_data = lz4.encode(utf8.encode("azka"));
  lz4.libraryVersion;
 
  print(encode_data);

  print(lz4.bindingVersion.toString());
  print(utf8.decode(lz4.decode(encode_data)));
}
