import 'package:flutter/material.dart';
import 'package:planit/utils/theme.dart';

AppBar hompageAppBar = AppBar(
    backgroundColor: const Color.fromARGB(255, 41, 41, 41),
    titleSpacing: 40,
    toolbarHeight: 90,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0))),
    automaticallyImplyLeading: false,
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 40),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fsm.ign.com%2Fign_ap%2Fcover%2Fa%2Favatar-gen%2Favatar-generations_hugw.jpg&f=1&nofb=1&ipt=e43e1f8504dc297439804ab06f72fa2d78f7202997cf014d2f62d5d1660c0129&ipo=images"),
        ),
      )
    ],
    title: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Your location",
          size: 14,
          color: Colors.blue,
        ),
        CustomText(
          text: "Kozhikode",
          size: 20,
          weight: FontWeight.bold,
        ),
      ],
    ));
