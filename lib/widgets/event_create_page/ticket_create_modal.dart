import 'package:flutter/material.dart';
import 'package:planit/providers/event_create_provider.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/custom_button.dart';
import 'package:planit/widgets/custom_input.dart';
import 'package:planit/widgets/dynamic_list_input.dart';
import 'package:provider/provider.dart';

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
  String? titleError;
  String? priceError;
  String? ticketLimitError;

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
                errorText: titleError,
                controller: titleController,
              ),
              const SizedBox(height: 20.0),
              StandardInputField(
                label: "Price",
                hintText: "eg: 500",
                errorText: priceError,
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
                        hintText: "eg: 50",
                        errorText: ticketLimitError,
                        controller: ticketLimit,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20.0),
              const LabelLarge(text: "What's included in the price"),
              DynamicListInput(
                dataList: perks,
                dataAddFunc: _addPerks,
                removeDataFunc: _removePerks,
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
                    child: CustomButton(
                      text: "Create",
                      onPressed: () {
                        _handleCreate(context);
                      },
                    ),
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

  void _removePerks(int index) {
    setState(() {
      perks.removeAt(index);
    });
  }

  void _handleCreate(BuildContext ctx) {
    if (titleController.text.isEmpty) {
      setState(() {
        titleError = "This field is required";
      });
      return;
    }
    if (priceController.text.isEmpty) {
      setState(() {
        priceError = "This field is required";
      });
      return;
    } else if (int.parse(priceController.text) < 0) {
      setState(() {
        priceError = "Please enter a possitive number";
      });
      return;
    }
    if (ticketLimit.text.isNotEmpty && int.parse(ticketLimit.text) <= 0) {
      setState(() {
        ticketLimitError = "Invalid limit, enter a posstive number";
      });
      return;
    }
    final TicketData ticketData = TicketData(
      title: titleController.text,
      price: int.parse(priceController.text),
      perks: perks,
      limit: ticketLimit.text.isNotEmpty ? int.parse(ticketLimit.text) : 0,
    );
    ctx.read<EventFormDataProvider>().addTicketData(ticketData);
    Navigator.pop(context);
  }
}
