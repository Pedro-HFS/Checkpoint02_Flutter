import 'package:flutter/material.dart';

class PedroCard extends StatelessWidget {
  final String musicText;
  final String bandText;

  PedroCard({required this.musicText, required this.bandText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Row(
        children: [
          Text(
            musicText,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              bandText,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
