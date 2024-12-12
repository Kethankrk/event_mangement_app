import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planit/providers/event_create_provider.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/custom_button.dart';
import 'package:planit/widgets/dynamic_list_input.dart';
import 'package:planit/widgets/event_create_page/ticket_create_modal.dart';
import 'package:planit/widgets/ticket_widget.dart';
import 'package:provider/provider.dart';

class EventDetailsForm extends StatefulWidget {
  const EventDetailsForm({super.key});

  @override
  State<EventDetailsForm> createState() => _EventDetailsFormState();
}

class _EventDetailsFormState extends State<EventDetailsForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    final eventProviderReadOnly =
        Provider.of<EventFormDataProvider>(context, listen: false);
    titleController.text = eventProviderReadOnly.title ?? "";
    descriptionController.text = eventProviderReadOnly.description ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventFormDataProvider>(context);
    return Column(
      children: [
        FTextField(
          controller: titleController,
          enabled: true,
          label: const Text('Title'),
          description: const Text('Enter your event title'),
          onChange: (value) => eventProvider.title = value,
          maxLines: 1,
        ),
        const SizedBox(height: 30.0),
        FTextField(
          controller: descriptionController,
          enabled: true,
          label: const Text('Description'),
          description: const Text('Describe your event'),
          onChange: (value) => eventProvider.description = value,
          minLines: 5,
        ),
        const SizedBox(height: 30.0),
        if (eventProvider.heroImage == null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: DottedBorder(
              padding: const EdgeInsets.symmetric(vertical: 60.0),
              color: Colors.white,
              dashPattern: const [10, 8],
              radius: const Radius.circular(10),
              borderType: BorderType.RRect,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: IconButton(
                      onPressed: () async {
                        XFile? image = await _addImage(context);
                        if (image == null) return;
                        eventProvider.heroImage = image;
                      },
                      color: Colors.blue,
                      iconSize: 42.0,
                      icon: const Icon(
                        Icons.upload_rounded,
                      ),
                    ),
                  ),
                  const DisplayMedium(
                    text: "Upload Hero Photo",
                    alignment: Alignment.center,
                  ),
                  const SizedBox(height: 10.0),
                  const LabelSmall(
                    text: "supports JPG, JPEG, PNG",
                    alignment: Alignment.center,
                  )
                ],
              ),
            ),
          ),
        if (eventProvider.heroImage != null)
          SizedBox(
            height: 250.0,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    File(eventProvider.heroImage!.path),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                          text: "Change Image",
                          onPressed: () {
                            eventProvider.heroImage = null;
                          })),
                )
              ],
            ),
          ),
        const SizedBox(height: 30.0),
        const LabelLarge(text: "Attendees requirements"),
        const SizedBox(height: 5.0),
        DynamicListInput(
          dataList: eventProvider.attendeesRequirements,
          dataAddFunc: eventProvider.addReq,
          removeDataFunc: eventProvider.removeReq,
          hintText: "Add a requirement.",
        ),
      ],
    );
  }

  // ----------------------| methods |---------------------------
  Future<XFile?> _addImage(BuildContext context) async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }
}
