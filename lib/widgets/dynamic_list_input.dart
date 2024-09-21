import 'package:flutter/material.dart';
import 'package:planit/utils/theme.dart';
import 'package:planit/widgets/custom_input.dart';

class DynamicListInput extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final List<String> dataList;
  final void Function(String) dataAddFunc;
  final String? hintText;
  DynamicListInput({
    super.key,
    required this.dataList,
    required this.dataAddFunc,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...List.generate(dataList.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: const Color(0xff343434),
            ),
            child: DisplaySmall(text: dataList[index]),
          ),
        );
      }),
      const SizedBox(height: 20.0),
      CustomInputField(
        controller: controller,
        hintText: hintText,
        suffixIconButton: IconButton(
            color: Colors.blue,
            onPressed: () {
              if (controller.text.isEmpty) return;
              dataAddFunc(controller.text);
              controller.clear();
            },
            icon: const Icon(
              Icons.add_circle_outlined,
            )),
      )
    ]);
  }
}
