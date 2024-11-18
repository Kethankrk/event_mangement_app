import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/base_layout.dart';
import 'package:planit/widgets/homepage/appbar.dart';

class CallForHelpPage extends StatefulWidget {
  const CallForHelpPage({super.key});

  @override
  State<CallForHelpPage> createState() => _CallForHelpPageState();
}

class _CallForHelpPageState extends State<CallForHelpPage> {
  int active = 1;

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      backgroundColor: Colors.black,
      appbar: hompageAppBar,
      child: Column(
        children: [
          CustomSlidingSegmentedControl<int>(
            isStretch: true,
            initialValue: 1,
            children: const {
              1: CustomText(
                text: "Call for Volunteers",
              ),
              2: CustomText(text: "Call for Speakers"),
            },
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            thumbDecoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(.3),
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                  offset: const Offset(
                    0.0,
                    2.0,
                  ),
                ),
              ],
            ),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInToLinear,
            onValueChanged: (v) {
              setState(() {
                active = v;
              });
            },
          ),
          const SizedBox(height: 20),
          active == 1
              ? const CustomText(text: "Call for volunteers page")
              : const CustomText(text: "Call for speakers page")
        ],
      ),
    );
  }
}
