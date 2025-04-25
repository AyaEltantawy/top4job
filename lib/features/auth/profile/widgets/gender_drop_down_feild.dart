import 'package:flutter/material.dart';
import 'package:top4job/core/theming/colors.dart';
import 'package:top4job/core/theming/styles.dart';

class GenderDropDownField extends StatelessWidget {
  String gender;
  String? selectedItem;

  List<String> dropDownItems;
  void Function() selectDropDownItem;

  GenderDropDownField({
    super.key,
    required this.gender,
    required this.dropDownItems,
    required this.selectDropDownItem,
  });

  @override
  Widget build(BuildContext context) {

    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text("Gender",style: TextStyles.font12StrongBlack300Weight,),
        SizedBox(height: 5,),
        Container(width:MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorsManager.grey)
          ),
          child: DropdownButton<String>(

            value: gender.isNotEmpty ? gender : null,
            underline: SizedBox(),
            hint: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text("Gender"),
            ),
            items:
                dropDownItems.map((String item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                }).toList(),
            icon: Padding(
              padding: const EdgeInsets.only(left: 200), // Add padding to align the icon at the end
              child: Icon(Icons.arrow_drop_down),
            ),
            onChanged: (String? value) {
              gender = value ?? '';
              selectedItem = value;
              selectDropDownItem();
            },
          ),
        ),
      ],
    );
  }
}
