import 'package:flutter/material.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/base_layout.dart';
import 'package:planit/widgets/custom_button.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Techathon 2k24",
                    size: 20.0,
                  ),
                  CustomText(
                    text: "Thamarassery, Kozhikode",
                    size: 16.0,
                    color: Colors.white70,
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(99.0),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: const CustomText(
                  text: "500",
                  size: 14,
                  color: Colors.black,
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          const Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: "05", size: 16),
                  CustomText(
                    text: "Setemper",
                    size: 14,
                    color: Colors.white70,
                  ),
                ],
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                children: [
                  CustomText(
                    text: "Thursday",
                    size: 16,
                  ),
                  CustomText(
                    text: "10:00 AM",
                    size: 14,
                    color: Colors.white70,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          const CustomText(
            text:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            size: 14,
            color: Colors.white70,
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: "Get Ticket",
                  onPressed: () {},
                  radius: 99,
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
