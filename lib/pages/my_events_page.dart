import 'package:flutter/material.dart';
import 'package:forui/widgets/tabs.dart';
import 'package:planit/widgets/base_layout.dart';
import 'package:planit/widgets/homepage/appbar.dart';
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
    return BaseLayout(
      backgroundColor: Colors.black,
      appbar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        leading: hompageAppBar,
        leadingWidth: double.infinity,
      ),
      child: FTabs(
        initialIndex: 0,
        tabs: [
          FTabEntry(
              label: const Text('Participating events'),
              content: SizedBox(
                height: MediaQuery.of(context).size.height * .56,
                child: const ParticipateSection(),
              )),
          const FTabEntry(
            label: Text('My events'),
            content: MyEventsSection(),
          ),
        ],
        onPress: (index) {},
      ),
    );
  }
}
