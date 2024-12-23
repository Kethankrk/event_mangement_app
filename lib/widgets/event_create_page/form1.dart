import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planit/providers/event_create_provider.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/custom_button.dart';
import 'package:planit/widgets/dynamic_list_input.dart';
import 'package:provider/provider.dart';

class EventDetailsForm extends StatefulWidget {
  const EventDetailsForm({super.key});

  @override
  State<EventDetailsForm> createState() => _EventDetailsFormState();
}

class _EventDetailsFormState extends State<EventDetailsForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final provider = Provider.of<EventFormDataProvider>(context, listen: false);
    if (provider.title != null) {
      titleController.text = provider.title!;
    }
    if (provider.description != null) {
      descriptionController.text = provider.description!;
    }

    titleController.addListener(() => _checkFieldAreFilled(context));
    descriptionController.addListener(() => _checkFieldAreFilled(context));
    provider.currentStateFormKey = _formKey;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventFormDataProvider>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FTextField(
            controller: titleController,
            enabled: true,
            label: const Text('Title'),
            description: const Text('Enter your event title'),
            maxLines: 1,
            onChange: (value) => eventProvider.title = value,
            validator: (value) {
              if (value == null || value.length < 4) return null;
              return "Title must have minimum four characters";
            },
          ),
          const SizedBox(height: 30.0),
          FTextField(
            controller: descriptionController,
            enabled: true,
            label: const Text('Description'),
            description: const Text('Describe your event'),
            minLines: 5,
            onChange: (value) => eventProvider.description = value,
            validator: (value) {
              if (value == null || value.length < 5) return null;
              return "Descirption must have minimum five characters";
            },
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
                          _checkFieldAreFilled(context);
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
                              _checkFieldAreFilled(context);
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
      ),
    );
  }

  // ----------------------| methods |---------------------------
  Future<XFile?> _addImage(BuildContext context) async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  void _checkFieldAreFilled(BuildContext context) {
    final provider = Provider.of<EventFormDataProvider>(context, listen: false);
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        provider.heroImage != null) {
      provider.nextDisabled = false;
      return;
    }
    if (!provider.nextDisabled) {
      provider.nextDisabled = true;
    }
  }
}
