// ignore_for_file: unnecessary_brace_in_string_interps, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lz4_flutter/lz4_flutter.dart';

void main(List<String> args) {
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
  // Lz4Codec.libraryPath = "/home/hexaminate/Documents/HEXAMINATE/app/lz4/package/lz4_flutter/example/build/linux/x64/debug/bundle/lib/liblz4.so";

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePage> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    Future(() async {
      Lz4Codec.libraryPath = "/home/hexaminate/Documents/HEXAMINATE/app/lz4/package/lz4_flutter/example/build/linux/x64/release/bundle/lib/liblz4.so";

      utf8.decode(lz4.decode(lz4.encode(utf8.encode("azka"))));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Sas",
        ),
      ),
    );
  }
}
