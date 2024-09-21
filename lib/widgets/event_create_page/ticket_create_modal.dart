import 'package:flutter/material.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/custom_button.dart';
import 'package:planit/widgets/custom_input.dart';
import 'package:planit/widgets/dynamic_list_input.dart';

class TicketCreateModal extends StatefulWidget {
  const TicketCreateModal({
    super.key,
  });

  @override
  State<TicketCreateModal> createState() => _TicketCreateModalState();
}

class _TicketCreateModalState extends State<TicketCreateModal> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController ticketLimit = TextEditingController();
  final List<String> perks = [];
  bool _isLimited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff171717),
      padding: const EdgeInsets.all(40.0),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Checkbox(
                      value: _isLimited,
                      onChanged: (bool? value) {
                        setState(() {
                          _isLimited = value ?? false;
                          ticketLimit.clear();
                        });
                      }),
                  const LabelLarge(text: "Limited Ticket"),
                  const SizedBox(width: 40.0),
                  if (_isLimited)
                    Expanded(
                      child: CustomInputField(
                        controller: ticketLimit,
                        hintText: "eg: 50",
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20.0),
              const LabelLarge(text: "What's included in the price"),
              DynamicListInput(
                dataList: perks,
                dataAddFunc: _addPerks,
                hintText: "Add perks",
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                        text: "Cancel",
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: CustomButton(text: "Create", onPressed: () {}),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _addPerks(String value) {
    setState(() {
      perks.add(value);
    });
  }
}
