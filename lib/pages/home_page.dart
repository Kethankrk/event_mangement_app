import 'package:flutter/material.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/base_layout.dart';
import 'package:planit/widgets/custom_input.dart';
import 'package:planit/widgets/homepage/appbar.dart';

class Homepage extends StatelessWidget {
  final TextEditingController searchText = TextEditingController();
  Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appbar: hompageAppBar,
      padding: 30,
      backgroundColor: Colors.black,
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
        ],
      ),
    );
  }
}
