import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class DateAndTime extends StatelessWidget {
  const DateAndTime(
      {super.key,
      required this.titleText,
      required this.iconSection,
      required this.valueText,
      required this.onTap});
  final String titleText;
  final String valueText;
  final IconData iconSection;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
        ),
        Gap(6),
        Material(
          child: Ink(
            decoration: BoxDecoration(
                color: Color(0xffCDCDF8),
                borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => onTap(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child:
                    Row(children: [Icon(iconSection), Gap(6), Text(valueText)]),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        )
      ],
    );
  }
}
