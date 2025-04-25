import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:top4job/core/theming/styles.dart';

import '../../../../core/theming/colors.dart' show ColorsManager;

class BirthDateFormFeild extends StatelessWidget {
  DateTime? selectedDate;

  BirthDateFormFeild({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(textAlign: TextAlign.start,"Birth", style: TextStyles.font12StrongBlack300Weight),
        Container(
          decoration: BoxDecoration(
            color: ColorsManager.white,
            border: Border.all(color: ColorsManager.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DateTimeFormField(
            decoration: InputDecoration(
              hintText: "   Birth",
              hintStyle: TextStyles.font12LowGrey300Weight,
              border: InputBorder.none,
            ),
            firstDate: DateTime.now().add(const Duration(days: 10)),
            lastDate: DateTime.now().add(const Duration(days: 40)),
            initialPickerDateTime: DateTime.now().add(const Duration(days: 20)),
            onChanged: (DateTime? value) {
              selectedDate = value;
            },
            mode: DateTimeFieldPickerMode.date,
          ),
        ),
      ],
    );
  }
}
