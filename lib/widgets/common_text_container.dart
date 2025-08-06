import 'package:flutter/material.dart';
import 'package:todolist/utils/extentions.dart';

class CommonTextContainer extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final int? maxline;
  final Widget? suffexIcon;
  final bool readonly;
  const CommonTextContainer(
      {super.key,
      required this.title,
      required this.hint,
      this.controller,
      this.maxline,
      this.suffexIcon,
      this.readonly = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          readOnly: readonly,
          controller: controller,
          maxLines: maxline,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(hintText: hint, suffixIcon: suffexIcon),
          onChanged: (value) {},
        )
      ],
    );
  }
}
