import 'package:flutter/material.dart';
import 'package:planit/providers/event_create_provider.dart';
import 'package:planit/widgets/custom_button.dart';
import 'package:planit/widgets/event_create_page/ticket_create_modal.dart';
import 'package:planit/widgets/ticket_widget.dart';
import 'package:provider/provider.dart';

class EventTicketCreateForm extends StatefulWidget {
  const EventTicketCreateForm({super.key});

  @override
  State<EventTicketCreateForm> createState() => _EventTicketCreateFormState();
}

class _EventTicketCreateFormState extends State<EventTicketCreateForm> {
  @override
  Widget build(BuildContext context) {
    final EventFormDataProvider eventProvider =
        Provider.of<EventFormDataProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        customTextButton(
          text: "+ add ticket",
          onPress: () {
            showModalBottomSheet(
              context: context,
              useRootNavigator: true,
              isScrollControlled: true,
              constraints: const BoxConstraints(minWidth: double.infinity),
              builder: (BuildContext ctx) {
                return ChangeNotifierProvider.value(
                  value: Provider.of<EventFormDataProvider>(
                    context,
                    listen: false,
                  ),
                  child: const TicketCreateModal(),
                );
              },
            );
          },
        ),
        const SizedBox(height: 20),
        for (var i = 0; i < eventProvider.tickets.length; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Ticket(
              title: eventProvider.tickets[i].title,
              price: eventProvider.tickets[i].price,
              limit: eventProvider.tickets[i].limit,
            ),
          )
      ],
    );
  }
}
