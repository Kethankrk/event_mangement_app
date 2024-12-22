import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:planit/providers/event_create_provider.dart';
import 'package:provider/provider.dart';

class EventLocationForm extends StatefulWidget {
  const EventLocationForm({super.key});

  @override
  State<EventLocationForm> createState() => EventLocationFormState();
}

class EventLocationFormState extends State<EventLocationForm> {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController startingDateTimeController =
      TextEditingController();
  final TextEditingController endingDateTimeController =
      TextEditingController();
  late final EventFormDataProvider eventProvider;

  @override
  void initState() {
    super.initState();
    eventProvider = Provider.of<EventFormDataProvider>(context, listen: false);
    locationController.text = eventProvider.location ?? "";
    DateTime? sdt = eventProvider.startingDateTime;
    DateTime? edt = eventProvider.endingDateTime;

    if (sdt != null) {
      startingDateTimeController.text =
          "${sdt.day}/${sdt.month}/${sdt.year} ${sdt.hour.toString().padLeft(2, '0')}:${sdt.minute.toString().padLeft(2, '0')}";
    }
    if (edt != null) {
      endingDateTimeController.text =
          "${edt.day}/${edt.month}/${edt.year} ${edt.hour.toString().padLeft(2, '0')}:${edt.minute.toString().padLeft(2, '0')}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FTextField(
          controller: locationController,
          enabled: true,
          label: const Text('Location'),
          description: const Text('Enter your venue address'),
          onChange: (value) => eventProvider.location = value,
          maxLines: 1,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: FTextField(
                controller: startingDateTimeController,
                enabled: true,
                label: const Text('Starting date and time'),
                description: const Text('select your event starting time'),
                readOnly: true,
                maxLines: 1,
                suffix: IconButton(
                  onPressed: () {
                    _selectDateTime(
                      callBack: (value) =>
                          eventProvider.startingDateTime = value,
                      selectedDatetime: eventProvider.startingDateTime,
                      controller: startingDateTimeController,
                    );
                  },
                  icon: const Icon(
                    Icons.calendar_month_rounded,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: FTextField(
                controller: endingDateTimeController,
                enabled: true,
                label: const Text('Ending date and time'),
                description: const Text('select your event ending time'),
                readOnly: true,
                maxLines: 1,
                suffix: IconButton(
                  onPressed: () {
                    _selectDateTime(
                      callBack: (value) => eventProvider.endingDateTime = value,
                      selectedDatetime: eventProvider.endingDateTime,
                      controller: endingDateTimeController,
                    );
                  },
                  icon: const Icon(
                    Icons.calendar_month_rounded,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Future<void> _selectDateTime({
    required void Function(DateTime value) callBack,
    required DateTime? selectedDatetime,
    required TextEditingController controller,
  }) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDatetime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (!mounted || pickedDate == null) return;

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedDatetime != null
          ? TimeOfDay.fromDateTime(selectedDatetime)
          : TimeOfDay.now(),
    );
    if (pickedTime == null) return;

    DateTime newDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );
    callBack(newDateTime);
    if (!mounted) return;
    controller.text =
        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year} ${pickedTime.format(context)}";
  }
}
