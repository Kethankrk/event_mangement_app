

import 'package:flutter/material.dart';
class BackArrow extends StatelessWidget {
  const BackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: 30,backgroundColor: Colors.grey.withOpacity(0.7),
      child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,size: 20,
                          ),
                          onPressed: () {},
                        ),
    );
  }
}