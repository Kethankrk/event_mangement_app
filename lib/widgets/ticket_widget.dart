import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:planit/utils/theme.dart';

class Ticket extends StatelessWidget {
  final String title;
  final int price;
  final int limit;
  const Ticket({
    super.key,
    required this.title,
    required this.price,
    required this.limit,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 221, 91, 4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabelLarge(
              text: title,
              alignment: Alignment.topCenter,
              color: Colors.black,
            ),
            Row(
              children: [
                Expanded(
                  child: DottedBorder(
                    padding: const EdgeInsets.all(1),
                    dashPattern: const [3, 3],
                    child: const SizedBox.shrink(),
                  ),
                ),
                const SizedBox(width: 10.0),
                LabelSmall(
                  text: limit == 0 ? "Limit: Unlimited" : "Limit: $limit",
                  color: Colors.black,
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: DottedBorder(
                    padding: const EdgeInsets.all(1),
                    dashPattern: const [3, 3],
                    child: const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
            TitleMedium(
              text: "₹ $price",
              color: Colors.black,
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double radius = 20.0;

    // Start from top-left corner
    path.moveTo(0, 0);

    // Left-top straight line
    path.lineTo(0, size.height * 0.35);

    // Left-side semicircle cutout
    path.arcToPoint(
      Offset(0, size.height * 0.65),
      radius: Radius.circular(radius),
      clockwise: true,
    );

    // Left-bottom straight line
    path.lineTo(0, size.height);

    // Bottom straight line
    path.lineTo(size.width, size.height);

    // Right-bottom straight line
    path.lineTo(size.width, size.height * 0.65);

    // Right-side semicircle cutout
    path.arcToPoint(
      Offset(size.width, size.height * 0.35),
      radius: Radius.circular(radius),
      clockwise: true,
    );

    // Right-top straight line
    path.lineTo(size.width, 0);

    // Top straight line
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
