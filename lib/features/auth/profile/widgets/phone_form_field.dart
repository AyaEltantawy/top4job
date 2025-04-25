import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/theming/colors.dart' show ColorsManager;
import '../../../../core/theming/styles.dart' show TextStyles;

class PhoneFormField extends StatelessWidget {
  String phoneCode;

  PhoneFormField({super.key, required this.phoneCode});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text("Phone",style: TextStyles.font12StrongBlack500Weight,),
        IntlPhoneField(
          decoration: InputDecoration(
            hintText: "Add your phone",
            hintStyle: TextStyles.font12LowGrey500Weight,
            fillColor: ColorsManager.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
          ),
          validator: (value) {
            if (value == null) {
              return 'Please enter your phone number';
            }
          },
          initialCountryCode: "KWT",
          onChanged: (phone) {
            phoneCode = phone.countryCode;
            print("Country Code: ${phone.countryCode}");
            print("Phone Number: ${phone.number}");
            ;
          },
        ),
      ],
    );
  }
}
