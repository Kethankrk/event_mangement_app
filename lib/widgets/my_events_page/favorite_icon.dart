import 'package:flutter/material.dart';
class FavIcon extends StatelessWidget {
  const FavIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: 25,backgroundColor: Colors.white.withOpacity(0.3),
      child: IconButton(
                              icon: Icon(Icons.favorite),
                              color: Colors.white,
                              onPressed: () {}),
    );
  }
}