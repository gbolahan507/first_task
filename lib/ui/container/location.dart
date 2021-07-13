import 'package:flutter/material.dart';
import 'package:task/core/model/country_model.dart';
import 'package:task/widgets/export.dart';





class Location extends StatelessWidget {
  final String countryName;
  final String stateName;
  final Country country;

  Location({this.countryName, this.country, this.stateName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                decoration: BoxDecoration(
                    border: Border.all(color: Styles.colorGrey),
                    borderRadius: BorderRadius.circular(8)),
                child: CustomIcon(
                  icon: Icons.location_on_outlined,
                  color: Styles.red,
                ),
              ),
              horizontalSpaceSmall,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    '$countryName',
                    fontSize: 12,
                    color: Styles.colorBlack,
                    fontWeight: FontWeight.bold,
                  ),
                  // verticalSpaceTiny,
                  CustomText(
                    '$stateName',
                    fontSize: 10,
                    color: Styles.colorBlack,
                  ),
                ],
              )
            ],
          ),
          verticalSpaceSmall,
        ],
      ),
    );
  }
}