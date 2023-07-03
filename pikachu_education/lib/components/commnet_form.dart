import 'package:flutter/material.dart';

import '../data/data_user.dart';
import 'like_form.dart';

class CommentForm extends StatefulWidget {
  const CommentForm({
    super.key,
    required this.avatar,
    required this.name,
    required this.dayAgo,
    required this.commentContent,
  });

  final String? commentContent;
  final String? avatar;
  final String? name;
  final int? dayAgo;

  @override
  State<CommentForm> createState() => _CommentFormState();
}

class _CommentFormState extends State<CommentForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25, left: 30, right: 30),
      child: Column(
        children: [
          LikeForm(
              avatar: widget.avatar, name: widget.name, dayAgo: widget.dayAgo),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0xFFFDFFAE), Color(0xFFFFFFFF)])),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.commentContent ?? '',
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
