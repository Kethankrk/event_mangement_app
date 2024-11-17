import 'package:flutter/material.dart';
import 'package:planit/utils/request.dart';
import 'package:planit/serializers/event.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/base_layout.dart';
import 'package:planit/widgets/custom_button.dart';
import 'package:planit/widgets/custom_input.dart';
import 'package:planit/widgets/homepage/appbar.dart';
import 'package:planit/widgets/homepage/event_card.dart';

class Homepage extends StatefulWidget {
  final TextEditingController searchText = TextEditingController();
  Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController searchText = TextEditingController();
  List<EventResponse> eventData = [];

  @override
  void initState() {
    fetchEventData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appbar: hompageAppBar,
      padding: 30,
      backgroundColor: Colors.black,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomInputField(
              controller: searchText,
              borderColor: Colors.transparent,
              backgroudColor: CustomColors.dim,
              hintText: "Search an event or venue",
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            if (eventData.isNotEmpty)
              EventCard(
                title: eventData[0].title,
                location: eventData[0].location,
                datetime: eventData[0].start.toString(),
                imageUrl: eventData[0].heroImage,
                onPress: () {},
              ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const DisplaySmall(text: "Trending"),
                customTextButton(text: "See All", onPress: () {})
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 220,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: eventData.length,
                  itemBuilder: (context, index) {
                    final data = eventData[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: EventCard(
                        title: data.title,
                        location: data.location,
                        datetime: "${data.start}",
                        imageUrl: data.heroImage,
                        onPress: () {
                          Navigator.pushNamed(context, '/event');
                        },
                        width: 350,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchEventData() async {
    final response = await getHelper("/api/event/");
    if (response == null) return;
    if (response.statusCode == 200) {
      final EventMainResponse res =
          EventMainResponse.fromRawJson(response.body);
      setState(() {
        eventData = res.response;
      });
    }
  }
}
