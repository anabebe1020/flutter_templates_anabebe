import 'package:flutter/material.dart';

class PageWidget extends StatelessWidget {
  final String title;
  const PageWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(title, style: Theme.of(context).textTheme.bodyText1),
      padding: const EdgeInsets.all(20),
    );
  }
}
