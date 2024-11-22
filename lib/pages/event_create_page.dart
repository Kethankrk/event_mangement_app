import 'package:flutter/material.dart';
import 'package:planit/providers/event_create_provider.dart';
import 'package:planit/widgets/custom_button.dart';
import 'package:planit/widgets/custom_stepper.dart';
import 'package:planit/widgets/event_create_page/form1.dart';
import 'package:planit/widgets/event_create_page/form2.dart';
import 'package:provider/provider.dart';

class EventCreatePage extends StatefulWidget {
  const EventCreatePage({super.key});

  @override
  State<EventCreatePage> createState() => _EventCreatePageState();
}

class _EventCreatePageState extends State<EventCreatePage> {
  int activeIndex = 0;
  late final List<CustomStep> steps;

  @override
  void initState() {
    super.initState();
    steps = [
      const CustomStep(
        title: "Detail",
        content: EventDetailsForm(),
      ),
      const CustomStep(
        title: "Date / Locaion",
        content: EventLocationForm(),
      ),
    ];
  }

  void _handleNext() {
    if (activeIndex != steps.length - 1) {
      setState(() {
        activeIndex++;
      });
    }
  }

  void _handlePrev() {
    if (activeIndex != 0) {
      setState(() {
        activeIndex--;
      });
      return;
    }
    Navigator.pop(context);
    Navigator.pushNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EventFormDataProvider(),
      builder: (context, child) => Column(
        children: [
          CustomStepper(
            steps: steps,
            activeIndex: activeIndex,
          ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                    text: activeIndex == 0 ? "Cancel" : "Prev",
                    onPressed: _handlePrev),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                  child: CustomButton(
                      text: "Next",
                      onPressed: () {
                        _handleNext();
                        if (activeIndex == steps.length - 1) {
                          print(context.read<EventFormDataProvider>().asMap);
                        }
                      })),
            ],
          )
        ],
      ),
    );
  }
}
