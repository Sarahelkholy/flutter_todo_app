// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:todolist/provider/dateProvider.dart';
import 'package:todolist/provider/timeProvider.dart';
import 'package:todolist/utils/helpers.dart';
import 'package:todolist/widgets/common_text_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class SelectDate extends ConsumerWidget {
  const SelectDate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    return Row(
      children: [
        Expanded(
            child: CommonTextContainer(
          title: 'Date',
          hint: DateFormat.yMMMd().format(date),
          readonly: true,
          suffexIcon: IconButton(
            onPressed: () => Helpers.selectDate(context, ref),
            icon: const FaIcon(FontAwesomeIcons.calendar),
          ),
        )),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: CommonTextContainer(
          title: 'Time',
          hint: Helpers.timeToString(time),
          readonly: true,
          suffexIcon: IconButton(
            onPressed: () => _selectTime(context, ref),
            icon: const FaIcon(FontAwesomeIcons.clock),
          ),
        ))
      ],
    );
  }

  void _selectTime(BuildContext context, WidgetRef ref) async {
    final initialTime = ref.read(timeProvider);
    TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: initialTime);
    if (pickedTime != null) {
      ref.read(timeProvider.notifier).state = pickedTime;
    }
  }
}
