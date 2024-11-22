import 'package:flutter/material.dart';
import 'package:planit/utils/theme.dart';

class CustomStep {
  final String title;
  final Widget content;
  const CustomStep({required this.title, required this.content});
}

class StepperTitle extends StatelessWidget {
  final String title;
  final bool isActive;
  const StepperTitle({super.key, required this.title, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          thickness: 2.0,
          color: isActive ? Colors.blue : Colors.grey,
        ),
        const SizedBox(height: 10.0),
        Align(
          alignment: Alignment.centerLeft,
          child: isActive
              ? LabelSmall(
                  text: title,
                  color: Colors.blue,
                )
              : LabelSmall(
                  text: title,
                ),
        )
      ],
    );
  }
}

class CustomStepper extends StatelessWidget {
  final List<CustomStep> steps;
  final int activeIndex;
  const CustomStepper({super.key, required this.steps, this.activeIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: List.generate(steps.length, (index) {
              return Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: StepperTitle(
                  title: steps[index].title,
                  isActive: index == activeIndex ? true : false,
                ),
              ));
            }),
          ),
          const SizedBox(
            height: 60.0,
          ),
          Expanded(
              child: SingleChildScrollView(child: steps[activeIndex].content))
        ],
      ),
    );
  }
}
