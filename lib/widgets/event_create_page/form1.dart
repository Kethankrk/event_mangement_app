import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planit/providers/event_create_provider.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/custom_button.dart';
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
        if (context.watch<EventFormDataProvider>().heroImage == null)
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
                        context.read<EventFormDataProvider>().addImage(image);
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
        if (context.watch<EventFormDataProvider>().heroImage != null)
          SizedBox(
            height: 250.0,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    File(
                        context.watch<EventFormDataProvider>().heroImage!.path),
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
                            context
                                .read<EventFormDataProvider>()
                                .addImage(null);
                          })),
                )
              ],
            ),
          ),
        const SizedBox(height: 30.0),
        const Align(
          alignment: Alignment.centerLeft,
          child: LabelLarge(text: "Attendees requirements"),
        ),
        const SizedBox(height: 5.0),
        AttendeesReqSection(),
      ],
    );
  }

  Future<XFile?> _addImage(BuildContext context) async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }
}

// ##############################| Attendees requirement adding section |##############################
class AttendeesReqSection extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  AttendeesReqSection({
    super.key,
  });

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
              if (controller.text.isEmpty) return;
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
