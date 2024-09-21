import 'package:flutter/material.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/custom_input.dart';

void showTicketModal(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController titleController = TextEditingController();
        final TextEditingController priceController = TextEditingController();
        return Container(
          color: const Color(0xff171717),
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              const TitleSmall(
                text: "Ticket details",
                alignment: Alignment.topCenter,
              ),
              StandardInputField(
                label: "Title",
                hintText: "eg: Professional",
                controller: titleController,
              ),
              const SizedBox(height: 20.0),
              StandardInputField(
                label: "Price",
                hintText: "eg: 500",
                controller: priceController,
              ),
              const LabelLarge(text: "What's included in the price"),
            ],
          ),
        );
      });
}
