import 'package:flutter/material.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/base_layout.dart';
import 'package:planit/widgets/homepage/event_card.dart';
import 'package:planit/widgets/my_events_page/my_events_section.dart';
import 'package:planit/widgets/my_events_page/participate_section.dart';

class MyEventsPage extends StatefulWidget {
  const MyEventsPage({super.key});

  @override
  State<MyEventsPage> createState() => _MyEventsPageState();
}

class _MyEventsPageState extends State<MyEventsPage> {
  int active = 0;

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      backgroundColor: Colors.black,
      appbar: AppBar(
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        leading: Container(
          color: CustomColors.dim,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      active = 0;
                    });
                  },
                  child: Container(
                    height: 80,
                    color: active == 0 ? Colors.black : null,
                    child: const Align(
                      child: CustomText(text: "Participating Event"),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      active = 1;
                    });
                  },
                  child: Container(
                    color: active == 1 ? Colors.black : null,
                    child: const Align(
                      child: CustomText(text: "My Events"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        leadingWidth: double.infinity,
      ),
      child: active == 0 ? const ParticipateSection() : const MyEventsSection(),
    );
  }
}
