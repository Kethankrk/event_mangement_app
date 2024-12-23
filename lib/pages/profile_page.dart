import 'package:flutter/material.dart';
import 'package:planit/utils/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fsm.ign.com%2Fign_ap%2Fcover%2Fa%2Favatar-gen%2Favatar-generations_hugw.jpg&f=1&nofb=1&ipt=e43e1f8504dc297439804ab06f72fa2d78f7202997cf014d2f62d5d1660c0129&ipo=images'),
          ),
          const SizedBox(height: 20),
          const CustomText(
            text: "Arjun",
            size: 24,
          ),
          const SizedBox(height: 10),
          const CustomText(
            text: 'Event Organizer',
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomText(
              color: Colors.white70,
              text:
                  'Passionate event organizer with 5 years of experience in creating memorable experiences. Specializing in tech conferences and music festivals.',
            ),
          ),
          const SizedBox(height: 20),
          const ListTile(
            leading: Icon(Icons.work, color: Colors.blue),
            title: CustomText(text: 'Qualification'),
            subtitle: CustomText(
              text: 'Bachelor\'s in Event Management',
              color: Colors.white70,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.business, color: Colors.blue),
            title: CustomText(text: 'Company'),
            subtitle: CustomText(
              text: 'EventPro Solutions',
              color: Colors.white70,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.location_on, color: Colors.blue),
            title: CustomText(text: 'Location'),
            subtitle: CustomText(
              text: 'San Francisco, CA',
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
            child: const CustomText(text: 'Edit Profile'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
