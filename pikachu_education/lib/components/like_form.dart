import 'package:flutter/material.dart';

import '../data/data_user.dart';

class LikeForm extends StatefulWidget {
  const LikeForm(
      {super.key,required this.avatar,required this.name, required this.dayAgo});
  final String? avatar;
  final String? name;
  final int? dayAgo;
  
  @override
  State<LikeForm> createState() => _LikeFormState();
}

class _LikeFormState extends State<LikeForm> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          width: MediaQuery.of(context).size.width / 6,
          child: Image.asset(widget.avatar??'assets/image/bottom_bar_me.png', fit: BoxFit.fill)),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name??'Unknown',
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              '${widget.dayAgo??'Unknown'} day ago',
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      )
    ]);
  }
}