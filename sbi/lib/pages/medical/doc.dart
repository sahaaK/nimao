// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import 'package:sbi/components/date.dart';
import 'package:sbi/components/doctors.dart';
import 'package:sbi/components/provider.dart';
import 'package:sbi/pages/medical/calendar.dart';

class DoctorDetail extends ConsumerWidget {
  final Doctors doctors;

  const DoctorDetail({
    Key? key,
    required this.doctors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateProv = ref.watch(dateProvider);

    var primaryColor = Color(0xff4C4DDC);
    var secondryColor = Color(0xffCDCDF8);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'My Appointment',
          style: TextStyle(
            color: primaryColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 110, 87, 87),
                          blurRadius: 15,
                          offset: Offset(4, 4)),
                    ],
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 90,
                      left: 110,
                      child: Container(
                        width: 300,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        // image
                        Image.asset(
                          doctors.imagePath,
                          height: 187,
                        ),
                        Gap(20),

                        // ratings and name
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              doctors.name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                                Gap(6),
                                Text(
                                  doctors.ratings,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ],
                            ),
                          ],
                        ),
                        Gap(6),
                        Text(
                          doctors.description,
                          style: TextStyle(
                              color: Color.fromARGB(255, 206, 230, 234),
                              fontSize: 20),
                        )
                      ],
                    ),
                  ],
                )),
          ),

          /////////////////////////------DOCTOR DETAIL STARTS HERE-----//////////////////////////
          /////////////////////////------DOCTOR DETAIL STARTS HERE-----//////////////////////////
          /////////////////////////------DOCTOR DETAIL STARTS HERE-----//////////////////////////

          Gap(20),
          Container(
            width: MediaQuery.of(context).size.width * 0.88,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: secondryColor,
            ),
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center the entire Row vertically
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Center items in the Column vertically
                  children: [
                    Icon(
                      Icons.people,
                      color: primaryColor,
                    ),
                    Gap(6),
                    Text('43 Patients')
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Center items in the Column vertically
                  children: [
                    Icon(
                      Icons.graphic_eq,
                      color: primaryColor,
                    ),
                    Gap(6),
                    Text('11 years')
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Center items in the Column vertically
                  children: [
                    Icon(
                      Icons.star,
                      color: primaryColor,
                    ),
                    Gap(6),
                    Text(doctors.ratings)
                  ],
                )
              ],
            ),
          ),

          /////////////////////////------GOOGLE MAPS STARTS HERE-----//////////////////////////
          /////////////////////////------GOOGLE MAPS STARTS HERE-----//////////////////////////
          /////////////////////////------GOOGLE MAPS STARTS HERE-----//////////////////////////

          Gap(20),
          Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width * 0.88,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
                border: Border.all(color: primaryColor),
                borderRadius: BorderRadius.circular(10)),
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(9.9360, 43.1844),
                zoom: 18,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('demo'),
                  position: LatLng(9.9360, 43.1844),
                  draggable: true,
                )
              },
            ),
          ),

          /////////////////////////------DATE AND TIME STARTS HERE-----//////////////////////////
          /////////////////////////------DATE AND TIME STARTS HERE-----//////////////////////////
          /////////////////////////------DATE AND TIME STARTS HERE-----//////////////////////////
          Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DateAndTime(
                titleText: 'date',
                iconSection: CupertinoIcons.calendar,
                valueText: dateProv,
                onTap: () async {
                  final getValue = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2025));
                  if (getValue != null) {
                    final format = DateFormat.yMd();
                    ref
                        .read(dateProvider.notifier)
                        .update((state) => format.format(getValue));
                  }
                },
              ),
              Gap(20),
              DateAndTime(
                titleText: 'time',
                iconSection: CupertinoIcons.clock,
                valueText: ref.watch(timeProvider),
                onTap: () async {
                  final getTime = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());
                  if (getTime != null) {
                    ref
                        .read(timeProvider.notifier)
                        .update((state) => getTime.format(context));
                  }
                },
              )
            ],
          ),

          /////////////////////////------APPOINTMENT BUTTON STARTS HERE-----//////////////////////////
          /////////////////////////------APPOINTMENT BUTTON STARTS HERE-----//////////////////////////
          /////////////////////////------APPOINTMENT BUTTON STARTS HERE-----//////////////////////////

          Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Set your desired border radius
                      ),
                    )),
                onPressed: () {
                  // Create an instance of Doctors with the required information
                  Doctors doctor = Doctors(
                    name: doctors.name,
                    description: doctors.description,
                    ratings: doctors.ratings,
                    imagePath: doctors.imagePath,
                  );
                  // Navigate to the Calendar screen and pass the doctor object
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Calendar(
                        doctor: doctor,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Schedule now',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.schedule,
                        color: Colors.white,
                        size: 30,
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
