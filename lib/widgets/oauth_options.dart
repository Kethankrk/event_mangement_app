import 'package:flutter/material.dart';

class GoogleAuthOption extends StatelessWidget {
  final VoidCallback onPress;
  const GoogleAuthOption({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.white,
                  height: 4.0,
                ),
              ),
              SizedBox(width: 10.0),
              Text(
                "OR",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: Divider(
                  color: Colors.white,
                  height: 4.0,
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onPress,
              style: FilledButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              child: const Text(
                "Continue with google",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
