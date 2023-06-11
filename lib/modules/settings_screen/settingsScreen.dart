import 'package:flutter/cupertino.dart';

class Settingpage extends StatelessWidget {
  const Settingpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Settings page',
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
      ),
    );
  }
}
