import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planit/widgets/custom_button.dart';

class MyEventsSection extends StatelessWidget {
  const MyEventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: CustomButton(
            text: "Create new event",
            onPressed: () {
              context.go("/event-create");
            },
          ),
        ),
      ],
    );
  }
}
