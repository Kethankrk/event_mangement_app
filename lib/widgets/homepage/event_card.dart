import 'package:flutter/material.dart';
import 'package:planit/utils/theme.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String location;
  final String datetime;
  final String imageUrl;
  final double? width;
  final VoidCallback onPress;
  const EventCard({
    super.key,
    required this.title,
    required this.location,
    required this.datetime,
    required this.imageUrl,
    required this.onPress,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width ?? double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: CustomColors.dim,
          image:
              DecorationImage(fit: BoxFit.cover, image: NetworkImage(imageUrl)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      iconSize: 15,
                      constraints: const BoxConstraints(
                        maxHeight: 32,
                        maxWidth: 32,
                      ),
                      style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.lightBlue),
                      ),
                      icon: const Icon(
                        Icons.bookmark,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(180, 0, 0, 0),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    size: 18,
                    weight: FontWeight.w600,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: location,
                        size: 12,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 10),
                      CustomText(
                        text: datetime,
                        size: 12,
                        weight: FontWeight.w300,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
