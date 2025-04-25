import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top4job/core/routing/page_router.dart';
import 'package:top4job/core/shared_widgets/custom_button.dart';
import 'package:top4job/core/theming/styles.dart';
import 'package:top4job/features/auth/choose_job_type/widgets/finding_job_or_emploee.dart';
import 'package:top4job/features/auth/select_experience/select_experience_view.dart';
import 'package:top4job/features/auth/select_region/select_region_view.dart';

import '../../../core/theming/colors.dart' show ColorsManager;
import 'choose_job_type_cubit.dart';
import 'choose_job_type_state.dart';

class ChooseJobTypePage extends StatelessWidget {
  const ChooseJobTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ChooseJobTypeCubit(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
            children: [
              IconButton(
                alignment: Alignment.topLeft,
                onPressed: () {MagicRouter.navigateTo(SelectRegionPage());},
                icon: Icon(Icons.arrow_back, color: ColorsManager.strongBlue),
              ),
              const SizedBox(height: 20),
              Image.asset("assets/images/Logo.png"),
              const SizedBox(height: 20),
              Text(
                "Choose your job type",
                textAlign: TextAlign.center,
                style: TextStyles.font24StrongBlack600Weight,
              ),
              SizedBox(height: 20),
              Text(
                "Choose whether you looking for a\njob or you are a company looking for\nemployee",
                textAlign: TextAlign.center,
                style: TextStyles.font15MediumGrey500Weight,
              ),
              SizedBox(height: 50),
              FindingJobOrEmployee(),
              SizedBox(height: 40),
              CustomButton(
                text: "Continue",
                onPressed: () {
                  MagicRouter.navigateTo(SelectExperiencePage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
