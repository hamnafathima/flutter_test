import 'package:flutter/material.dart';
import 'package:flutter_machine_test/constants/colors.dart';
import 'package:flutter_machine_test/constants/icons.dart';
import 'package:flutter_machine_test/constants/text_styles.dart';
import 'package:flutter_machine_test/constants/ui_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final List<Map<String, String>> bookings = [
    {
      'name': 'Vikram Singh',
      'package': 'Couple Combo Package (Rejuvenation)',
      'date': '31/01/2024',
      'staff': 'Jithesh'
    },
    {
      'name': 'Vikram Singh',
      'package': 'Couple Combo Package (Rejuvenation)',
      'date': '31/01/2024',
      'staff': 'Jithesh'
    },
    {
      'name': 'Vikram Singh',
      'package': 'Couple Combo Package (Rejuvenation)',
      'date': '31/01/2024',
      'staff': 'Jithesh'
    },
    {
      'name': 'Vikram Singh',
      'package': 'Couple Combo Package (Rejuvenation)',
      'date': '31/01/2024',
      'staff': 'Jithesh'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.arrow_back),
                  const Spacer(),
                  Stack(
                    children: [
                      SvgPicture.asset(IconClass.notificationIcon),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: ColorClass.white.withOpacity(0.90)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: Colors.grey),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search for treatments',
                                hintStyle: TextStyleClass.poppins400TextStyle(
                                    12, ColorClass.white),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  UiStyles.customisedSmallButton(
                      'Search', ColorClass.darkGreen, () {})
                ],
              ),
              const SizedBox(height: 35),
              Row(
                children: [
                  Text(
                    'Sort by :',
                    style: TextStyleClass.poppins500TextStyle(
                        12, ColorClass.darkGrey),
                  ),
                  const Spacer(),
                  Container(
                    height: 39,
                    width: 169,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Date',
                              style: TextStyleClass.poppins400TextStyle(
                                  15, ColorClass.darkGrey)),
                          const SizedBox(width: 75),
                          const Icon(Icons.keyboard_arrow_down,
                              color: ColorClass.darkGreen),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 21),
              Divider(
                color: ColorClass.darkGrey.withOpacity(0.2),
                thickness: 2.0,
              ),
              const SizedBox(height: 14),
              Expanded(
                child: ListView.builder(
                  itemCount: bookings.length,
                  itemBuilder: (context, index) {
                    final booking = bookings[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: ColorClass.lightGrey,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${index + 1}.',
                                  style: TextStyleClass.poppins500TextStyle(
                                      16, ColorClass.darkGrey),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    booking['name']!,
                                    style: TextStyleClass.poppins500TextStyle(
                                        18, ColorClass.black),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              booking['package']!,
                              style: TextStyleClass.poppins300TextStyle(
                                  16, ColorClass.darkGreen),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  size: 16,
                                  color: Colors.orange,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  booking['date']!,
                                  style: TextStyleClass.poppins400TextStyle(
                                      15, ColorClass.darkGrey),
                                ),
                                const SizedBox(width: 16),
                                const Icon(
                                  Icons.group,
                                  size: 16,
                                  color: Colors.orange,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  booking['staff']!,
                                  style: TextStyleClass.poppins400TextStyle(
                                      14, ColorClass.darkGrey),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Divider(
                              color: ColorClass.darkGrey.withOpacity(0.2),
                              thickness: 2.0,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      'View Booking details',
                                      style: TextStyleClass.poppins300TextStyle(
                                          16, ColorClass.black),
                                    ),
                                    const SizedBox(
                                      width: 120,
                                    ),
                                    const SizedBox(
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: ColorClass.darkGreen,
                                        size: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              UiStyles.customisedButton(
                  'Register Now', ColorClass.darkGreen, () {}),
            ],
          ),
        ),
      ),
    );
  }
}
