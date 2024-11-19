import 'package:flutter/material.dart';
class ShareIcon extends StatelessWidget {
  const ShareIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: 30,backgroundColor: Colors.grey.withOpacity(0.7),
      child: IconButton(
                          icon: const Icon(
                            Icons.share,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {},
                        ),
    );
  }
}