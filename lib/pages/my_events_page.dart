import 'package:flutter/material.dart';
import 'package:forui/widgets/tabs.dart';
import 'package:planit/widgets/my_events_page/my_events_section.dart';
import 'package:planit/widgets/my_events_page/participate_section.dart';

class MyEventsPage extends StatefulWidget {
  const MyEventsPage({super.key});

  @override
  State<MyEventsPage> createState() => _MyEventsPageState();
}

class _MyEventsPageState extends State<MyEventsPage> {
  @override
  Widget build(BuildContext context) {
    return FTabs(
      initialIndex: 0,
      tabs: const [
        FTabEntry(
          label: Text('Participating events'),
          content: Expanded(
            child: ParticipateSection(),
          ),
        ),
        FTabEntry(
          label: Text('My events'),
          content: MyEventsSection(),
        ),
      ],
      onPress: (index) {},
    );
  }
}
