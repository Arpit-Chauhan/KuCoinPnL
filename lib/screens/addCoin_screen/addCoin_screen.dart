import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kucoinpnl/screens/addCoin_screen/controller/addCoinController.dart';
import 'package:kucoinpnl/utils/scaling.dart';

class AddCoinScreen extends GetWidget<AddCoinController> {
  @override
  Widget build(BuildContext context) {
    Scaling scale = Scaling(context: context)..setCurrentDeviceSize();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add your Investment'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: scale.getPadding(all: 20),
              child: Center(
                child: Container(
                  width: scale.fw*0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.grey[200], // Dropdown button fill color
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),
                  padding: scale.getPadding(left: 10,),
                  child: DropdownButton<String>(
                    value: controller.availableCoins[0],
                    onChanged: (String? newValue) {},
                    items: controller.availableCoins.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    underline: Container(), // Remove underline
                    icon: Icon(Icons.arrow_drop_down), // Dropdown icon
                    iconSize: 36.0,
                    isExpanded: true, // Dropdown fills available space
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
