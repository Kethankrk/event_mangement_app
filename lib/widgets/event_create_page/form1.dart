import 'package:flutter/material.dart';
import 'package:planit/providers/event_create_provider.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/custom_input.dart';
import 'package:provider/provider.dart';

class EventDetailsForm extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  const EventDetailsForm({
    super.key,
    required this.titleController,
    required this.descriptionController,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StandardInputField(
          label: "Title",
          hintText: "Name your event.",
          controller: titleController,
        ),
        const SizedBox(height: 30.0),
        StandardInputField(
          label: "Description",
          hintText: "Describe your event.",
          controller: descriptionController,
          maxLines: null,
          minLines: 5,
        ),
        const SizedBox(height: 30.0),
        const Align(
          alignment: Alignment.centerLeft,
          child: LabelLarge(text: "Attendees requirements"),
        ),
        const SizedBox(height: 5.0),
        const AttendeesReqSection(),
      ],
    );
  }
}

// ##############################| Attendees requirement adding section |##############################
class AttendeesReqSection extends StatefulWidget {
  const AttendeesReqSection({
    super.key,
  });

  @override
  State<AttendeesReqSection> createState() => _AttendeesReqSectionState();
}

class _AttendeesReqSectionState extends State<AttendeesReqSection> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...List.generate(context.watch<EventFormDataProvider>().req.length,
          (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: const Color(0xff343434),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: DisplaySmall(
                  text: context.watch<EventFormDataProvider>().req[index]),
            ),
          ),
        );
      }),
      const SizedBox(height: 20.0),
      CustomInputField(
        controller: controller,
        hintText: "Add a requirement.",
        suffixIconButton: IconButton(
            color: Colors.blue,
            onPressed: () {
              context.read<EventFormDataProvider>().addReq(controller.text);
              controller.clear();
            },
            icon: const Icon(
              Icons.add_circle_outlined,
            )),
      )
    ]);
  }
}
