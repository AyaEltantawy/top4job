import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top4job/core/routing/page_router.dart';
import 'package:top4job/features/bottom_navigation_bar/bottom_navigation_bar_view.dart';
import 'package:top4job/features/bottom_navigation_bar/notifications/widgets/custom_text_and_divider.dart';

import 'filter_cubit.dart';
import 'filter_state.dart';

class FilterPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FilterCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FilterCubit, FilterState>(
          builder: (context, state) {
            if (state is! FilterUpdated) return SizedBox();

            final cubit = context.read<FilterCubit>();
            _controller.text = state.location;
            _controller.selection = TextSelection.collapsed(
              offset: _controller.text.length,
            );

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Icon(Icons.close),
                        onTap: () {
                          MagicRouter.navigateTo(BottomNavigationBarPage());
                        },
                      ),
                      Text(
                        'Filter',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 24),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(state.tabs.length, (index) {
                    return Expanded(
                      child: InkWell(
                        onTap: () => cubit.changeSelectedIndex(index),
                        child: CustomTextAndDivider(
                          text: state.tabs[index],
                          isSelected: state.selectedIndex == index,
                        ),
                      ),
                    );
                  }),
                ),

                if (state.selectedIndex == 2) ...[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location & Salary',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: _controller,
                            onChanged: cubit.updateLocation,
                            decoration: InputDecoration(
                              hintText: 'Enter location',
                              prefixIcon: Icon(Icons.location_on),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("\$${state.minSalary.toInt()}k"),
                                  Text("\$${state.maxSalary.toInt()}k"),
                                ],
                              ),
                              RangeSlider(
                                values: RangeValues(
                                  state.minSalary,
                                  state.maxSalary,
                                ),
                                min: 0,
                                max: 20,
                                divisions: 20,
                                activeColor: Colors.blue,
                                inactiveColor: Colors.grey.shade300,
                                onChanged:
                                    (range) => cubit.updateSalary(
                                      range.start,
                                      range.end,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          DropdownButtonFormField<String>(
                            value: state.frequency,
                            items:
                                ['Per Month', 'Per Year']
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                            onChanged: (val) => cubit.updateFrequency(val!),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.blue,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                            dropdownColor: Colors.blue,
                            iconEnabledColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],

                if (state.selectedIndex == 0) ...[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue.shade100),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Work Type',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 16),
                          RadioListTile<String>(
                            value: 'Onsite',
                            groupValue: "",
                            onChanged: (value) => value = '',
                            title: const Text('Onside (Work from office)'),
                            activeColor: Colors.blue,
                            contentPadding: EdgeInsets.zero,
                          ),
                          RadioListTile<String>(
                            value: 'Remote',
                            groupValue: "",
                            onChanged: (value) => value = '',
                            title: const Text('Remotely (Work from home)'),
                            activeColor: Colors.blue,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],

                if (state.selectedIndex == 1) ...[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue.shade100),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Job Level',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 16),
                          RadioListTile<String>(
                            value: 'Trainee',
                            groupValue: "",
                            onChanged: (value) => value = "",
                            title: const Text('Trainee'),
                            activeColor: Colors.blue,
                            contentPadding: EdgeInsets.zero,
                          ),
                          RadioListTile<String>(
                            value: 'Junior',
                            groupValue: "",
                            onChanged: (value) => value = "",
                            title: const Text('Junior'),
                            activeColor: Colors.blue,
                            contentPadding: EdgeInsets.zero,
                          ),
                          RadioListTile<String>(
                            value: 'Senior',
                            groupValue: "",
                            onChanged: (value) => value = "",
                            title: const Text('Senior'),
                            activeColor: Colors.blue,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
