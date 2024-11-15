import 'package:flutter/material.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/base_layout.dart';
import 'package:planit/widgets/custom_button.dart';
import 'package:planit/widgets/custom_input.dart';
import 'package:planit/widgets/homepage/appbar.dart';
import 'package:planit/widgets/homepage/event_card.dart';

class Homepage extends StatelessWidget {
  final TextEditingController searchText = TextEditingController();
  Homepage({super.key});
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
            const EventCard(
              title: "Techcathlon 2k24",
              location: "KMCT Kozhikode",
              datetime: "05 Sep 2024, 10 AM",
              imageUrl: "https://img.com/",
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
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: EventCard(
                        title: "Techcathlon 2k24",
                        location: "KMCT Kozhikode",
                        datetime: "05 Sep 2024, 10 AM",
                        imageUrl: "https://img.com/",
                        width: 300,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
