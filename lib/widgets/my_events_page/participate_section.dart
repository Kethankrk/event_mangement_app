import 'package:flutter/material.dart';
import 'package:planit/widgets/homepage/event_card.dart';

class ParticipateSection extends StatelessWidget {
  const ParticipateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: EventCard(
              title: "Event Name",
              location: "Kozhikode, Kerala",
              datetime: "06 Nov 2024",
              imageUrl:
                  "https://image.freepik.com/free-psd/business-conference-concept-banner-template_23-2148640910.jpg",
              onPress: () {}),
        );
      },
    );
  }
}
