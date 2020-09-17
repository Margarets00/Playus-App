import 'package:flutter/material.dart';
import 'package:playus_app/screen/home/components/code_form.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CodeForm(),
    );
  }
}
