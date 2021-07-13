import 'package:flutter/material.dart';
import 'package:task/widgets/export.dart';


class Empty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  color: Styles.colorLightPink, shape: BoxShape.circle),
              child: Image.asset('images/searchs.png')
            ),
            verticalSpaceMedium,
            CustomText(
              'No results found',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              centerText: true,
            ),
            verticalSpaceSmall,
            CustomText(
              'We dont have any startup with that name',
              fontSize: 12,
              color: Styles.colorGrey,
              centerText: true,
            ),
            CustomText(
              'feel free to search again',
              fontSize: 12,
              color: Styles.colorGrey,
              centerText: true,
            )
          ],
        ),
      ),
    );
  }
}
