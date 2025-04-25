import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top4job/core/routing/page_router.dart';
import 'package:top4job/core/shared_widgets/custom_button.dart';
import 'package:top4job/core/shared_widgets/custom_text_form_feild.dart';
import 'package:top4job/features/auth/choose_job_type/choose_job_type_view.dart';
import 'package:top4job/features/auth/register/register_view.dart';

import '../../../core/theming/colors.dart' show ColorsManager;
import '../../../core/theming/styles.dart' show TextStyles;
import 'select_region_cubit.dart';
import 'select_region_state.dart';

class SelectRegionPage extends StatelessWidget {
  const SelectRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SelectRegionCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<SelectRegionCubit, SelectRegionState>(
            builder: (context, state) {
              final controller = BlocProvider.of<SelectRegionCubit>(context);
              return ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 40,
                ),
                children: [
                  IconButton(
                    alignment: Alignment.topLeft,
                    onPressed: () {MagicRouter.navigateTo(RegisterPage());},
                    icon: Icon(
                      Icons.arrow_back,
                      color: ColorsManager.strongBlue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Image.asset("assets/images/Logo.png"),
                  const SizedBox(height: 20),
                  Text(
                    "Select your region",
                    textAlign: TextAlign.center,
                    style: TextStyles.font24StrongBlack600Weight,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormFeild(
                    hint: "Search",
                    prefixIcon: SvgPicture.asset("assets/svgs/search.svg"),
                    onChanged: controller.updateSearchText,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 250,
                    child: Stack(
                      children: [
                        Scrollbar(
                          controller: controller.scrollController,
                          thickness: 3,
                          radius: const Radius.circular(8),
                          thumbVisibility: true,
                          child: ListView.builder(
                            controller: controller.scrollController,
                            itemCount: state.filteredRegions.length,
                            itemBuilder: (context, index) {
                              String region = state.filteredRegions[index];
                              return RadioListTile<String>(
                                title: Text(region),
                                value: region,
                                groupValue: state.selectedRegion,
                                onChanged: (value) {
                                  if (value != null) {
                                    controller.selectRegion(value);
                                  }
                                },
                                activeColor: ColorsManager.strongBlue,
                              );
                            },
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Column(
                            children: [
                              Image.asset("assets/images/grey_divider.png"),
                              Image.asset("assets/images/blue_divider.png"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    text: "Continue",
                    onPressed: () {
                      MagicRouter.navigateTo(ChooseJobTypePage());
                    },
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
