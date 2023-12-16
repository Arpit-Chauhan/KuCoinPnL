import 'package:flutter/material.dart';

import '../../../../theme/app_style.dart';
import '../../../utils/colorConstants.dart';
import '../../../utils/scaling.dart';

class InfoBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Scaling scale = Scaling(context: context)..setCurrentDeviceSize();
    return Container(
      decoration: BoxDecoration(
        color: LightTheme.whiteA700,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: scale.getPadding(top: 12),
              child: Text(
                "Short & long-term taxes",
                style: AppStyle.txtSoraSemiBold16Bluegray900.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(height: 24),
            Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Row(
                  children: [
                    orangeDot(),
                    Text("Short-term taxes", style: AppStyle.txtSoraSemiBold14Bluegray900),
                  ],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 15),
                    child: Text(
                      "Short-term capital gains in equity funds are taxed at 15% if sold within one year.",
                      style: AppStyle.txtSoraRegular14Gray600,
                    ),
                  ),
                ],
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Row(
                  children: [
                    orangeDot(),
                    Text(
                      "Long-term taxes",
                      style: AppStyle.txtSoraSemiBold14Bluegray900,
                      softWrap: true,
                    ),
                  ],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 15),
                    child: Text(
                      "Long-term capital gains in equity funds are taxed at 15% if sold within one year.",
                      style: AppStyle.txtSoraRegular14Gray600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget orangeDot() {
    return Container(
      height: 7.5,
      width: 7.5,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(color: LightTheme.deepOrange400, borderRadius: BorderRadius.circular(10)),
    );
  }
}
