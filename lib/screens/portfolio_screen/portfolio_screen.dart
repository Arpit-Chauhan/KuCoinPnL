import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kucoinpnl/routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../utils/colorConstants.dart';
import '../../utils/scaling.dart';
import '../../widgets/fancyNumber.dart';
import '../../widgets/shimmerContainer.dart';
import 'controller/portfolio_controller.dart';

class PortfolioScreen extends GetView<PortfolioController> {
  late Scaling scale;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    scale = Scaling(context: context)..setCurrentDeviceSize();

    return Scaffold(
      key: _scaffoldKey,
      extendBody: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: LightTheme.whiteA700,
      body: SizedBox(
          height: scale.fh,
          child: SafeArea(
              bottom: false,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        pageHeader(),
                        SizedBox(height: scale.getScaledHeight(8)),
                        holdingsTab(context),
                        Padding(
                          padding: scale.getPadding(bottom: 15),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.addCoinScreen);
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: LightTheme.blueGradient),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: LightTheme.whiteSmoke,
                                ),
                                SizedBox(width: scale.getScaledWidth(3)),
                                Text('ADD COIN', style: AppStyle.txtSoraSemiBold14WhiteA700),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }

  Widget pageHeader() {
    return Padding(
      padding: scale.getPadding(left: 20, right: 20.0),
      child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
            decoration: AppDecoration.fillWhiteA700,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: scale.getPadding(left: 16, top: 20),
                        child: Row(
                          children: [
                            Text(
                              "KuCoin",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSoraSemiBold16.copyWith(
                                color: LightTheme.bluegray900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: scale.getPadding(left: 16),
                            child: Text("Portfolio",
                                overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtSoraRegular12Gray600),
                          ),
                          // Obx(
                          //   () => dashboardController.selectedWatchlistSection.value == 0
                          //       ? Padding(
                          //           padding: scale.getPadding(horizontal: 8.0),
                          //           child: InkWell(
                          //             onTap: () {
                          //               Get.bottomSheet(InfoBottomSheet(),
                          //                   isScrollControlled: true);
                          //             },
                          //             child: CommonNetworkImageView(
                          //               height: scale.getScaledHeight(18.00),
                          //               width: scale.getScaledWidth(18.00),
                          //               url: ImageConstant.imgInfo,
                          //               color: LightTheme.bluegray900,
                          //             ),
                          //           ),
                          //         )
                          //       : SizedBox.shrink(),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                ])),
      ]),
    );
  }

  Widget holdingsTab(BuildContext context) {
    NumberFormat numberFormat = NumberFormat.decimalPattern('hi');
    return ListView(
      shrinkWrap: true,
      controller: controller.scrollController,
      children: [
        Container(
          padding: scale.getPadding(left: scale.fw * 0.06, right: scale.fw * 0.06, top: 20),
          height: scale.getScaledHeight(scale.fullHeight * 0.30),
          child: Column(
            children: [
              SizedBox(
                  height: scale.getScaledHeight(scale.fullHeight * 0.18 * 0.65),
                  child: Container(
                    padding: scale.getPadding(top: 20, left: 20, right: 20),
                    decoration: BoxDecoration(
                        color: LightTheme.blueGray800, borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Current value",
                              style: AppStyle.textstylesoraregular12.copyWith(color: LightTheme.gray201),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Obx(
                              () => (controller.totalCurrent.value == 0.0)
                                  ? ShimmerContainer(
                                      width: scale.getScaledWidth(85),
                                      height: scale.getScaledHeight(20),
                                    )
                                  : Text(
                                      '₹${controller.totalCurrent.value.toStringAsFixed(2)}',
                                      style: AppStyle.txtSoraSemiBold16WhiteA700,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Amount invested",
                              style: AppStyle.textstylesoraregular12.copyWith(color: LightTheme.gray201),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Obx(
                              () => (controller.totalInvested.value == 0.0)
                                  ? ShimmerContainer(
                                      width: scale.getScaledWidth(85),
                                      height: scale.getScaledHeight(20),
                                    )
                                  : Text(
                                      '₹${controller.totalInvested.value.toStringAsFixed(2)}',
                                      style: AppStyle.txtSoraSemiBold16WhiteA700,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
              SizedBox(
                  height: scale.getScaledHeight(scale.fullHeight * 0.12),
                  child: Container(
                    padding: scale.getPadding(top: 1, left: 20, right: 20),
                    decoration: BoxDecoration(
                        color: LightTheme.darkBlue,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total P&L",
                                  style: AppStyle.textstylesoraregular12.copyWith(color: LightTheme.gray201),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Obx(
                                  () => (controller.totalPnL.value == 0.0)
                                      ? ShimmerContainer(
                                          width: scale.getScaledWidth(75),
                                          height: scale.getScaledHeight(20),
                                        )
                                      : Text(
                                          '${controller.totalPnL.value >= 0.00 ? "+₹" : "-₹"}${controller.totalPnL.value.abs().toStringAsFixed(2)}',
                                          style: controller.totalPnL.value >= 0.00
                                              ? AppStyle.txtSoraSemiBold16WhiteA700.copyWith(color: LightTheme.green700)
                                              : AppStyle.txtSoraSemiBold16WhiteA700.copyWith(color: LightTheme.red700),
                                        ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Total Returns %",
                                  style: AppStyle.textstylesoraregular12.copyWith(color: LightTheme.gray201),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Obx(
                                  () => (controller.totalReturns.value == 0.0)
                                      ? ShimmerContainer(
                                          width: scale.getScaledWidth(75),
                                          height: scale.getScaledHeight(20),
                                        )
                                      : Text(
                                          '${controller.totalReturns.value >= 0.00 ? "+" : "-"}${controller.totalReturns.value.abs().toStringAsFixed(2)}%',
                                          style: controller.totalReturns.value >= 0.00
                                              ? AppStyle.txtSoraSemiBold16WhiteA700.copyWith(color: LightTheme.green700)
                                              : AppStyle.txtSoraSemiBold16WhiteA700.copyWith(color: LightTheme.red700),
                                        ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
        Obx(() => Container(
              padding: scale.getPadding(left: scale.fw * 0.05, right: scale.fw * 0.05, top: 10),
              child: controller.showSearchBar.value == false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                          Padding(
                            padding: scale.getPadding(left: 16),
                            child: Text(
                              "My investments (${controller.investedCoins.length})",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtSoraSemiBold16.copyWith(
                                color: LightTheme.gray600,
                              ),
                            ),
                          ),
                          Spacer(),
                        ])
                  : Padding(
                      padding: scale.getPadding(top: 8, bottom: 8),
                      child: Container(
                        width: scale.fullWidth * 0.8,
                        child: TextFormField(
                          autofocus: true,
                          maxLength: 20,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9]+[^]*$')),
                            FilteringTextInputFormatter.deny('  '),
                            FilteringTextInputFormatter.deny(RegExp("[^ a-zA-Z0-9&()'-]"))
                          ],
                          controller: controller.searchController,
                          onTap: () {
                            controller.scrollController.jumpTo(280);
                            if (controller.showFab.value == true) {
                              controller.showFab.value = false;
                            }
                          },
                          onChanged: (text) {
                            if (text.length > 0) {
                              // controller.showFilteredHoldings(text);
                            } else {
                              //controller.getMyInvestmentsFunction();
                              controller.showFab.value = true;
                            }
                          },
                          onEditingComplete: () {
                            controller.showSearchBar.value = false;
                          },
                          focusNode: FocusNode(),
                          decoration: InputDecoration(
                            counterText: "",
                            fillColor: LightTheme.gray100,
                            filled: true,
                            suffixIcon: InkWell(
                              onTap: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                controller.showSearchBar.value = false;
                                controller.searchController.clear();
                                //controller.getMyInvestmentsFunction();
                                controller.showFab.value = true;
                              },
                              child: Padding(padding: scale.getPadding(right: 24), child: Container()),
                            ),
                            isDense: true,
                            hintText: 'Search holdings',
                            hintStyle: TextStyle(color: LightTheme.bluegray200),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: LightTheme.gray300,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: LightTheme.gray300,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: LightTheme.gray300,
                                width: 1,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: LightTheme.gray300,
                                width: 1,
                              ),
                            ),
                          ),
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ),
            )),
        (1 == 0)
            ? Container(
                margin: scale.getMargin(all: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: LightTheme.gray201),
                ),
                child: Padding(
                  padding: scale.getPadding(all: 20),
                  child: Container(),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.investedCoins.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Get.toNamed(AppRoutes.mfPortfolioDetailScreen, arguments: {
                          //   'schemeCode':
                          //       controller.myInvestmentsResponse.value.data?[index].schemeCode,
                          //   'folio_no':
                          //       controller.myInvestmentsResponse.value.data?[index].folioNo,
                          //   'bseSchemeCode': controller
                          //       .myInvestmentsResponse.value.data?[index].bseSchemeCode,
                          // });
                        },
                        child: Container(
                          padding: scale.getPadding(left: scale.fw * 0.05, right: scale.fw * 0.05, top: 20),
                          height: scale.getScaledHeight(('') != '' ? scale.fullHeight * 0.31 : scale.fullHeight * 0.26),
                          child: Column(
                            children: [
                              SizedBox(
                                height: scale.getScaledHeight(scale.fullHeight * 0.09),
                                child: Container(
                                  padding: scale.getPadding(
                                    left: 10,
                                  ),
                                  decoration: BoxDecoration(
                                      color: LightTheme.whiteA700,
                                      border: Border.all(
                                        color: LightTheme.lightgrey200,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(controller.investedCoins[index].image),
                                              radius: 18, // Adjust the size as needed
                                            ),
                                            SizedBox(width: 15),
                                            Expanded(
                                              child: Container(
                                                  margin: scale.getMargin(bottom: 6, top: 9),
                                                  child: RichText(
                                                    maxLines: 3,
                                                    textAlign: TextAlign.left,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          style: AppStyle.txtSoraSemiBold16Bluegray900,
                                                          text: controller.investedCoins[index].name,
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                            ),
                                            SizedBox(width: scale.getScaledWidth(5.0)),
                                            Padding(
                                              padding: scale.getPadding(right: 10, top: 7.5),
                                              child: Text(
                                                'Qty. : ${controller.investedCoins[index].quantity}',
                                                style: AppStyle.txtSoraRegular14.copyWith(color: LightTheme.gray600),
                                              ),
                                            ),
                                          ]),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: scale.getScaledHeight(scale.fullHeight * 0.14),
                                  child: Container(
                                    padding: scale.getPadding(top: 5, left: 10, right: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: LightTheme.lightgrey200,
                                        width: 1,
                                      ),
                                      color: LightTheme.whiteA700,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: '' != '' ? Radius.circular(0) : Radius.circular(12),
                                          bottomRight: ('') != '' ? Radius.circular(0) : Radius.circular(12)),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                                child: Row(children: [
                                              Text(
                                                'Invested: ',
                                                style: AppStyle.txtSoraRegular12.copyWith(color: LightTheme.gray600),
                                              ),
                                              Text(
                                                '₹${double.parse(controller.investedCoins[index].invested).toStringAsFixed(2)}',
                                                style: AppStyle.txtSoraSemiBold14Bluegray900,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ])),
                                            Container(
                                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                              Text(
                                                'Current: ',
                                                style: AppStyle.txtSoraRegular12.copyWith(color: LightTheme.gray600),
                                              ),
                                              Obx(
                                                () => Text(
                                                  '₹${double.parse(controller.investedCoins[index].current.value).toStringAsFixed(2)}',
                                                  style: AppStyle.txtSoraSemiBold14Bluegray900,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ])),
                                          ],
                                        ),
                                        Container(
                                          padding: scale.getPadding(top: 5, bottom: 5, left: 10, right: 10),
                                          decoration: BoxDecoration(
                                              color: LightTheme.whiteA700,
                                              border: Border.all(
                                                color: LightTheme.lightgrey200,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(12))),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Overall P&L",
                                                    style: AppStyle.textstylesoraregular11.copyWith(color: LightTheme.gray201),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Obx(
                                                    () => Text(
                                                      '${double.parse(controller.investedCoins[index].pnl.value) >= 0.00 ? "+₹" : "-₹"}${double.parse(controller.investedCoins[index].pnl.value).abs().toStringAsFixed(2)}',
                                                      style: double.parse(controller.investedCoins[index].pnl.value) >= 0.00
                                                          ? AppStyle.txtSoraSemiBold16WhiteA700.copyWith(color: LightTheme.green700)
                                                          : AppStyle.txtSoraSemiBold16WhiteA700.copyWith(color: LightTheme.red700),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "Returns",
                                                    style: AppStyle.textstylesoraregular11.copyWith(color: LightTheme.gray201),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Obx(
                                                    () => Text(
                                                      '${double.parse(controller.investedCoins[index].returns.value) >= 0.00 ? "+" : "-"}${double.parse(controller.investedCoins[index].returns.value).abs().toStringAsFixed(2)}%',
                                                      style: double.parse(controller.investedCoins[index].returns.value) >= 0.00
                                                          ? AppStyle.txtSoraSemiBold16WhiteA700.copyWith(color: LightTheme.green700)
                                                          : AppStyle.txtSoraSemiBold16WhiteA700.copyWith(color: LightTheme.red700),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
        SizedBox(
          height: 20,
        ),
        Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
      ],
    );
  }

  String getFormattedDate(String date) {
    if (date == '') {
      return "";
    }
    DateTime newDate = DateFormat('dd/MM/yy').parse(date);
    String formattedDate = DateFormat('dd MMM yyyy').format(newDate);

    return formattedDate;
  }
}
