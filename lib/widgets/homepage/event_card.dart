import 'package:flutter/material.dart';
import 'package:planit/utils/theme.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String location;
  final String datetime;
  final String imageUrl;
  final double? width;
  const EventCard({
    super.key,
    required this.title,
    required this.location,
    required this.datetime,
    required this.imageUrl,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: 180,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: CustomColors.dim,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                  ),
                  hoverColor: Colors.blue,
                  icon: const Icon(
                    Icons.bookmark,
                    color: Colors.black,
                  )),
            ],
          ),
          Column(
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
          )
        ],
      ),
    );
  }
}
