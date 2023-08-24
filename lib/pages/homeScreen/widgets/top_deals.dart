
import 'package:flutter/material.dart';

class TopDeals extends StatelessWidget {
  const TopDeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 9),
      width: MediaQuery.of(context).size.width,
      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCjmpt1gyz1BUqG4h60wokfEnONTJ0JnFNcQ&usqp=CAU",
        fit: BoxFit.fill,
      ),
    );
  }
}
