import 'package:flutter/material.dart';
import 'package:planit/widgets/custom_input.dart';

class EventLocationForm extends StatefulWidget {
  const EventLocationForm({super.key});

  @override
  State<EventLocationForm> createState() => EventLocationFormState();
}

class EventLocationFormState extends State<EventLocationForm> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController startingDateController = TextEditingController();
  final TextEditingController startingTimeController = TextEditingController();
  final TextEditingController endingDateController = TextEditingController();
  final TextEditingController endingTimeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StandardInputField(
          label: "Address",
          controller: addressController,
          hintText: "Enter the venue address.",
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: StandardInputField(
                label: "starting date",
                controller: startingDateController,
                readOnly: true,
                hintText: "Select starting date",
                suffixIconButton: IconButton(
                  onPressed: () {
                    _selectDate(startingDateController);
                  },
                  icon: const Icon(
                    Icons.calendar_month,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: StandardInputField(
                label: "starting time",
                readOnly: true,
                controller: startingTimeController,
                hintText: "Select starting time",
                suffixIconButton: IconButton(
                    onPressed: () {
                      _selectTime(startingTimeController);
                    },
                    icon: const Icon(
                      Icons.access_time,
                      color: Colors.blue,
                    )),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: StandardInputField(
                label: "ending date",
                controller: endingDateController,
                readOnly: true,
                hintText: "Select ending date",
                suffixIconButton: IconButton(
                  onPressed: () {
                    _selectDate(endingDateController);
                  },
                  icon: const Icon(
                    Icons.calendar_month,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: StandardInputField(
                label: "ending time",
                readOnly: true,
                controller: endingTimeController,
                hintText: "Select ending time",
                suffixIconButton: IconButton(
                    onPressed: () {
                      _selectTime(startingTimeController);
                    },
                    icon: const Icon(
                      Icons.access_time,
                      color: Colors.blue,
                    )),
              ),
            ),
          ],
        )
      ],
    );
  }

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      controller.text =
          "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
    }
  }

  Future<void> _selectTime(TextEditingController controller) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        controller.text = pickedTime.format(context);
      });
    }
  }
}
