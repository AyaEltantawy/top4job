import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart' show TextStyles;

class JobPromoCard extends StatelessWidget {
  const JobPromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.amber[600],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "See how you Can Find a job Easily",
                    style: TextStyles.font16White600Weight

                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: ElevatedButton(

                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        "More",
                        style: TextStyles.font12SecondBlue600Weight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),


          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                   Image.asset(
                   "assets/images/blue_rect.png",
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,

                    child: Image.asset(
                      "assets/images/woman.png",
                      alignment: Alignment.center,
                      height: 160,
                      fit: BoxFit.contain,
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
