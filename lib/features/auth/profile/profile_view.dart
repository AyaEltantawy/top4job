import 'package:date_field/date_field.dart'
    show DateTimeFieldPickerMode, DateTimeFormField;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:top4job/core/routing/page_router.dart';
import 'package:top4job/core/shared_widgets/custom_button.dart';
import 'package:top4job/core/shared_widgets/custom_text_form_feild.dart';
import 'package:top4job/core/theming/styles.dart';
import 'package:top4job/features/auth/pin_number/pin_number_view.dart';
import 'package:top4job/features/auth/profile/widgets/birth_date_form_feild.dart';
import 'package:top4job/features/auth/profile/widgets/gender_drop_down_feild.dart';
import 'package:top4job/features/auth/profile/widgets/phone_form_field.dart';
import 'package:top4job/features/auth/select_experience/select_experience_view.dart';

import '../../../core/theming/colors.dart' show ColorsManager;
import 'profile_cubit.dart';
import 'profile_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProfileCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              final controller = BlocProvider.of<ProfileCubit>(context);
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                children: [
                  IconButton(
                    alignment: Alignment.topLeft,
                    onPressed: () {
                      MagicRouter.navigateTo(SelectExperiencePage());
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: ColorsManager.strongBlue,
                    ),
                  ),
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Image.asset(
                          "assets/images/User-Avatar.png",
                          width: 179,
                          height: 164,
                        ),
                        Image.asset("assets/images/edit_icon.png"),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    textAlign: TextAlign.center,
                    "Fill your profile",
                    style: TextStyles.font24StrongBlack600Weight,
                  ),
                  CustomTextFormFeild(upperText: "Name", hint: "Full Name"),
                  BirthDateFormFeild(selectedDate: controller.selectedDate),
                  SizedBox(height: 5),
                  GenderDropDownField(
                    dropDownItems: controller.dropDownItems,
                    gender: controller.gender,
                    selectDropDownItem: controller.selectDropDownItem,
                  ),
                  CustomTextFormFeild(
                    upperText: "Email",
                    hint: "Email",
                    prefixIcon: SvgPicture.asset("assets/svgs/email_icon.svg"),
                  ),
                  SizedBox(height: 5),
                  PhoneFormField(phoneCode: controller.phoneCode),
                  SizedBox(height: 20),

                  FractionallySizedBox(
                    widthFactor: .75,
                    child: CustomButton(
                      text: "Continue",
                      onPressed: () {
                        MagicRouter.navigateTo(PinNumberPage());
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
