import 'package:flutter/material.dart';
import 'package:forui/widgets/tabs.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/base_layout.dart';
import 'package:planit/widgets/homepage/appbar.dart';

class CallForHelpPage extends StatefulWidget {
  const CallForHelpPage({super.key});

  @override
  State<CallForHelpPage> createState() => _CallForHelpPageState();
}

class _CallForHelpPageState extends State<CallForHelpPage> {
  @override
  Widget build(BuildContext context) {
    return FTabs(
      initialIndex: 0,
      tabs: [
        FTabEntry(
            label: const Text('Participating events'),
            content: SizedBox(
              height: MediaQuery.of(context).size.height * .56,
              child: const CustomText(text: "Call for volunteers page"),
            )),
        const FTabEntry(
          label: Text('My events'),
          content: CustomText(text: "Call for speakers page"),
        ),
      ],
      onPress: (index) {},
    );
  }
}
