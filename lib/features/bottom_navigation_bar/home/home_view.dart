import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top4job/core/routing/page_router.dart';
import 'package:top4job/core/shared_widgets/custom_text_form_feild.dart';
import 'package:top4job/features/bottom_navigation_bar/home/filter/filter_view.dart';
import 'package:top4job/features/bottom_navigation_bar/home/widgets/custom_home_container.dart';
import 'package:top4job/features/bottom_navigation_bar/home/widgets/image_and_text_and_notification.dart';
import 'package:top4job/features/bottom_navigation_bar/home/widgets/job_promo_card.dart';
import 'package:top4job/features/bottom_navigation_bar/home/widgets/search.dart';
import 'package:top4job/features/bottom_navigation_bar/recent_jobs/recent_jobs_view.dart';
import 'package:top4job/features/bottom_navigation_bar/recommendtions/recommendtions_view.dart';
import '../../../core/theming/styles.dart';
import '../../../core/shared_widgets/developer_container.dart';
import 'home_cubit.dart';
import 'home_state.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            children: [
              ImageAndTextAndNotification(),
              SizedBox(height: 20),
              CustomTextFormFeild(
                controller: _controller,
                hint: "Search for Job or Company",
                prefixIcon: SvgPicture.asset("assets/svgs/search.svg"),
                suffixIcon: InkWell(
                  onTap: () {
                    MagicRouter.navigateTo(FilterPage());
                  },
                  child: Image.asset("assets/images/filters.png"),
                ),
                onFieldSubmitted: (value) {
                  final cubit = context.read<HomeCubit>();
                  cubit.search(value);

                  MagicRouter.navigateTo(
                    BlocProvider.value(
                      value: cubit,
                      child: SearchPage(searchTerm: value),
                    ),
                  );
                },
              ),
              SizedBox(height: 40),
              JobPromoCard(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      MagicRouter.navigateTo(RecommendationsPage());
                    },
                    child: Text(
                      "Recommendation",
                      style: TextStyles.font18StrongBlue600Weight,
                    ),
                  ),
                  Text("See All", style: TextStyles.font12SecondBlue500Weight),
                ],
              ),
              SizedBox(height: 10),
              DeveloperContainer(imagePath: "assets/images/google.png"),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      MagicRouter.navigateTo(RecentJobsPage());
                    },
                    child: Text(
                      "Recent Jobs",
                      style: TextStyles.font18StrongBlue600Weight,
                    ),
                  ),
                  Text("See All", style: TextStyles.font12SecondBlue500Weight),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomHomeContainer(isSelected: false, text: "All"),
                  CustomHomeContainer(isSelected: false, text: "Design"),
                  CustomHomeContainer(isSelected: true, text: "Marketing"),
                  CustomHomeContainer(isSelected: true, text: "Finance"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
