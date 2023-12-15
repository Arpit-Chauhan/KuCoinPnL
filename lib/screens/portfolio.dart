import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mvp_draft_4/core/app_export.dart';
import 'package:mvp_draft_4/presentation/Cash/GlobalSearch/widgets/noResultsfound.dart';
import 'package:mvp_draft_4/presentation/Holdings/holding_main_screen/holding_main_screen.dart';
import 'package:mvp_draft_4/presentation/MF/mf_portfolio_screen/widgets/infoBottomsheet.dart';
import 'package:mvp_draft_4/presentation/MF/mf_portfolio_screen/widgets/knowMoreBottomsheet.dart';
import 'package:mvp_draft_4/presentation/MF/mf_portfolio_screen/widgets/mf_sort_bottom_sheet.dart';
import 'package:mvp_draft_4/presentation/Orders/orders_main_screen/controller/orders_main_controller.dart';
import 'package:mvp_draft_4/presentation/Orders/orders_main_screen/screen/orders_main_app.dart';
import 'package:mvp_draft_4/presentation/Orders/orders_main_screen/screen/orders_main_web.dart';
import 'package:mvp_draft_4/presentation/Positions/positions_main_screen/positions_main_screen.dart';
import 'package:mvp_draft_4/widgets/nominee_custom_button.dart';
import 'package:mvp_draft_4/widgets/shimmer_container.dart';
import 'package:path/path.dart';

import '../../../widgets/NseBseSwitcher.dart';
import '../../../widgets/common_image_view.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../../../widgets/custom_bottom_bar_new.dart';
import '../../../widgets/custom_drawer_button_new.dart';
import '../../../widgets/faded_container.dart';
import '../../../widgets/fancy_number.dart';
import '../../../widgets/mf_widgets/app_bar/image_button.dart';
import '../../Holdings/holding_main_screen/controller/holding_main_controller.dart';
import '../../IPO/controller/ipo_controller.dart';
import '../../Positions/positions_main_screen/controller/positions_main_controller.dart';
import '../../dashboard/controller/global_nav_controller.dart';
import '../mf_dashboard/controller/mf_dashboard_controller.dart';
import '../mf_global_controller.dart';
import '../mf_my_investments_screen/bottom_sheets/topup_or_switch_bottom_sheet.dart';
import '../mf_portfolio_screen-orders/mf_orders_screen.dart';
import '../mf_sip_landing_screen/controller/sip_landing_controller.dart';
import '../mf_sip_landing_screen/widgets/active_sip_summary.dart';
import '../mf_sip_landing_screen/widgets/missed_sip_container.dart';
import '../mf_sip_landing_screen/widgets/upcoming_sip_container.dart';
import '../mf_sip_transaction_history_screen/sip_transaction_history_screen.dart';
import 'controller/mf_portfolio_controller.dart';

class MFPortfolioScreen extends GetView<MFPortfolioController> {
  late ScalingUtility scale;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final int activeIndex = 0;

  var dashboardController = Get.find<MFDashboardController>();

  @override
  Widget build(BuildContext context) {
    scale = ScalingUtility(context: context)..setCurrentDeviceSize();
    var globalNavController = Get.find<GlobalNavigationController>();

    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      resizeToAvoidBottomInset: false,
      // this is new
      backgroundColor: LightTheme.whiteA700,
      body: SizedBox(
          height: scale.fh,
          child: SafeArea(
              bottom: false,
              child: Obx(() => Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          pageHeader(),
                          SizedBox(height: scale.getScaledHeight(8)),
                          Expanded(
                            child: DefaultTabController(
                              length: 3,
                              initialIndex: controller.tabIndex.value,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: scale.getMargin(top: 0),
                                    height: kToolbarHeight - 9,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: getVerticalSize(1),
                                                color: LightTheme.gray300))),
                                    child: TabBar(
                                      controller: controller.tabController,
                                      labelStyle: AppStyle.txtSoraSemiBold14Bluegray900,
                                      labelColor: LightTheme.bluegray900,
                                      labelPadding: getPadding(left: 20, right: 20),
                                      unselectedLabelColor: LightTheme.gray600,
                                      unselectedLabelStyle: AppStyle.txtSoraRegular14,
                                      indicator: TabIndicator(),
                                      isScrollable: false,
                                      tabs: [
                                        Tab(text: "Holdings"),
                                        Tab(text: "Orders"),
                                        Obx(() => Tab(
                                            text: dashboardController
                                                        .selectedWatchlistSection.value ==
                                                    0
                                                ? "SIP book"
                                                : "Positions"))
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: controller.tabController,
                                      children: <Widget>[
                                        Obx(() =>
                                            dashboardController.selectedWatchlistSection.value == 0
                                                ? holdingsTab(context)
                                                : GetBuilder<HoldingMainController>(
                                                    init: HoldingMainController(),
                                                    builder: (value) => HoldingMainScreen(),
                                                  )),
                                        Obx(() =>
                                            dashboardController.selectedWatchlistSection.value == 0
                                                ? MFPOrdersTab()
                                                : GetBuilder<OrdersMainController>(
                                                    init: OrdersMainController(),
                                                    builder: (value) => OrdersMainApp(),
                                                  )
                                        ),
                                        Obx(() =>
                                            dashboardController.selectedWatchlistSection.value == 0
                                                ? sipBookTab(context)
                                                : GetBuilder<PositionsMainController>(
                                                    init: PositionsMainController(),
                                                    builder: (value) => PositionsMainScreen(),
                                                  )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 50,
                        right: 10,
                        child: Visibility(
                          visible: globalNavController.showQcMenu.value,
                          child: ClipRRect(
                            borderRadius: BorderRadiusStyle.roundedBorder6,
                            child: SizedBox(
                              height: scale.getScaledHeight(210),
                              width: scale.getScaledWidth(145),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: scale.getScaledHeight(210),
                                    width: scale.getScaledWidth(170),
                                    child: Container(
                                      padding: scale.getPadding(horizontal: 10, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: LightTheme.whiteA700,
                                        boxShadow: [
                                          BoxShadow(
                                              color: LightTheme.quickTradeShadow, //New
                                              blurRadius: 20.0,
                                              spreadRadius: 20.0,
                                              blurStyle: BlurStyle.outer)
                                        ],
                                        border: Border.all(color: LightTheme.gray, width: 2.5),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(14),
                                          topLeft: Radius.circular(14),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Create an Order",
                                            style: AppStyle.textstylesoraregular24.copyWith(
                                              fontSize: scale.getScaledFont(14),
                                              fontWeight: FontWeight.w600,
                                              color: LightTheme.deepOrange400,
                                            ),
                                          ),
                                          SizedBox(height: scale.getScaledHeight(15)),
                                          InkWell(
                                            onTap: () => globalNavController.onSelectSimple(),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                SizedBox(width: scale.getScaledWidth(25)),
                                                CommonNetworkImageView(
                                                  url: ImageConstant.qcSimple,
                                                  width: scale.getScaledWidth(25),
                                                  height: scale.getScaledHeight(25),
                                                  color: LightTheme.bluegray900,
                                                ),
                                                SizedBox(width: scale.getScaledWidth(10)),
                                                Text(
                                                  "Regular",
                                                  style: AppStyle.textstylesoraregular24.copyWith(
                                                    fontSize: scale.getScaledFont(12),
                                                    fontWeight: FontWeight.w600,
                                                    color: LightTheme.bluegray900,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.5,
                                          ),
                                          SizedBox(height: scale.getScaledHeight(15)),
                                          InkWell(
                                            onTap: () => globalNavController.onSelectGTT(),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                SizedBox(width: scale.getScaledWidth(25)),
                                                CommonNetworkImageView(
                                                  url: ImageConstant.qcGTT,
                                                  width: scale.getScaledWidth(25),
                                                  height: scale.getScaledHeight(25),
                                                  color: LightTheme.bluegray900,
                                                ),
                                                SizedBox(width: scale.getScaledWidth(10)),
                                                Text(
                                                  "GTT",
                                                  style: AppStyle.textstylesoraregular24.copyWith(
                                                    fontSize: scale.getScaledFont(12),
                                                    fontWeight: FontWeight.w600,
                                                    color: LightTheme.bluegray900,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.5,
                                          ),
                                          SizedBox(height: scale.getScaledHeight(15)),
                                          InkWell(
                                            onTap: () {
                                              globalNavController.onSelectBasket();
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                SizedBox(width: scale.getScaledWidth(25)),
                                                CommonNetworkImageView(
                                                  url: ImageConstant.qcBasket,
                                                  width: scale.getScaledWidth(25),
                                                  height: scale.getScaledHeight(25),
                                                  color: LightTheme.bluegray900,
                                                ),
                                                SizedBox(width: scale.getScaledWidth(10)),
                                                Text(
                                                  "Basket",
                                                  style: AppStyle.textstylesoraregular24.copyWith(
                                                    fontSize: scale.getScaledFont(12),
                                                    fontWeight: FontWeight.w600,
                                                    color: LightTheme.bluegray900,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )))),
    );
  }

  Future<bool> navigateToDashboard() async {
    Get.toNamed(AppRoutes.dashboard);
    return true;
  }

  Widget pageHeader() {
    return Padding(
      padding: scale.getPadding(left: 20, right: 20.0),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                decoration: AppDecoration.fillWhiteA700,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GlobalDrawerButton(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: scale.getPadding(left: 16),
                            child: Row(
                              children: [
                                Obx(
                                  () => Text(
                                    dashboardController.selectedWatchlistSection.value == 1
                                        ? "Equity"
                                        : "Mutual Fund",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSoraSemiBold16.copyWith(
                                      color: LightTheme.bluegray900,
                                    ),
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
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtSoraRegular12Gray600),
                              ),
                              Obx(
                                () => dashboardController.selectedWatchlistSection.value == 0
                                    ? Padding(
                                        padding: scale.getPadding(horizontal: 8.0),
                                        child: InkWell(
                                          onTap: () {
                                            Get.bottomSheet(KnowMoreBottomSheet(),
                                                isScrollControlled: true);
                                          },
                                          child: CommonNetworkImageView(
                                            height: scale.getScaledHeight(18.00),
                                            width: scale.getScaledWidth(18.00),
                                            url: ImageConstant.imgInfo,
                                            color: LightTheme.bluegray900,
                                          ),
                                        ),
                                      )
                                    : SizedBox.shrink(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Obx(
                        () => Switcher(
                          selected: dashboardController.selectedWatchlistSection.value==1?0:1,
                          onTapLeftButton: () {
                            dashboardController.selectedWatchlistSection.value = 1;
                          },
                          onTapRightButton: () {
                            dashboardController.selectedWatchlistSection.value = 0;
                          },
                          leftTitle: "EQ",
                          rightTitle: "MF",
                        ),
                      ),
                    ])),
          ]),
    );
  }

  Widget holdingsTab(BuildContext context) {
    NumberFormat numberFormat = NumberFormat.decimalPattern('hi');
    return Obx(() => ListView(
          shrinkWrap: true,
          controller: controller.scrollController,
          children: [
            Container(
              padding: scale.getPadding(left: scale.fw * 0.05, right: scale.fw * 0.05, top: 20),
              height: getVerticalSize(scale.fullHeight * 0.30),
              child: Column(
                children: [
                  SizedBox(
                      height: getVerticalSize(scale.fullHeight * 0.14 * 0.65),
                      child: Container(
                        padding: scale.getPadding(top: 16, left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: LightTheme.blueGray800,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Current value",
                                  style: AppStyle.textstylesoraregular11
                                      .copyWith(color: LightTheme.gray201),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                (controller.holdingSummaryResponse.value.currentValue == null)
                                    ? ShimmerContainer(
                                        width: scale.getScaledWidth(85),
                                        height: scale.getScaledHeight(20),
                                      )
                                    : FancyTextMFP(
                                        number: (controller
                                                .holdingSummaryResponse.value.currentValue
                                                ?.roundToDouble() ??
                                            0),
                                        positiveChange: true,
                                        positiveIntegerStyle: AppStyle.txtSoraSemiBold14WhiteA700,
                                        positiveDecimalStyle: AppStyle.txtSoraSemiBold12WhiteA700,
                                        negativeIntegerStyle: AppStyle.txtSoraSemiBold14WhiteA700,
                                        negativeDecimalStyle: AppStyle.txtSoraSemiBold12WhiteA700,
                                        showRupeeIcon: true,
                                      ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Amount invested",
                                  style: AppStyle.textstylesoraregular11
                                      .copyWith(color: LightTheme.gray201),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                (controller.holdingSummaryResponse.value.amountInvested == null)
                                    ? ShimmerContainer(
                                        width: scale.getScaledWidth(85),
                                        height: scale.getScaledHeight(20),
                                      )
                                    : FancyTextMFP(
                                        number: controller
                                                .holdingSummaryResponse.value.amountInvested
                                                ?.roundToDouble() ??
                                            0,
                                        positiveChange: true,
                                        positiveIntegerStyle: AppStyle.txtSoraSemiBold14WhiteA700,
                                        positiveDecimalStyle: AppStyle.txtSoraSemiBold12WhiteA700,
                                        negativeIntegerStyle: AppStyle.txtSoraSemiBold14WhiteA700,
                                        negativeDecimalStyle: AppStyle.txtSoraSemiBold12WhiteA700,
                                        showRupeeIcon: true,
                                      ),
                              ],
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                      height: getVerticalSize(scale.fullHeight * 0.15),
                      child: Container(
                        padding: scale.getPadding(top: 16, left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: LightTheme.darkBlue,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12))),
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
                                      "Previous day’s P&L",
                                      style: AppStyle.textstylesoraregular11
                                          .copyWith(color: LightTheme.gray201),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    (controller.holdingSummaryResponse.value.dayPl == null)
                                        ? ShimmerContainer(
                                            width: scale.getScaledWidth(75),
                                            height: scale.getScaledHeight(20),
                                          )
                                        : FancyTextMFP(
                                            number:
                                                (controller.holdingSummaryResponse.value.dayPl ??
                                                        0.0)
                                                    .roundToDouble(),
                                            positivePrefix:
                                                controller.holdingSummaryResponse.value.dayPl == 0
                                                    ? ""
                                                    : "+",
                                            negativePrefix: "-",
                                            positiveChange: controller
                                                        .holdingSummaryResponse.value.dayPl !=
                                                    null &&
                                                controller.holdingSummaryResponse.value.dayPl! >= 0,
                                            positiveIntegerStyle:
                                                controller.holdingSummaryResponse.value.dayPl == 0
                                                    ? AppStyle.txtSoraSemiBold14WhiteA700
                                                    : AppStyle.txtSoraSemiBold14WhiteA700
                                                        .copyWith(color: LightTheme.green700),
                                            positiveDecimalStyle:
                                                controller.holdingSummaryResponse.value.dayPl == 0
                                                    ? AppStyle.txtSoraSemiBold14WhiteA700
                                                    : AppStyle.txtSoraSemiBold12WhiteA700
                                                        .copyWith(color: LightTheme.green700),
                                            negativeIntegerStyle:
                                                controller.holdingSummaryResponse.value.dayPl == 0
                                                    ? AppStyle.txtSoraSemiBold14WhiteA700
                                                    : AppStyle.txtSoraSemiBold14WhiteA700
                                                        .copyWith(color: LightTheme.red700),
                                            negativeDecimalStyle:
                                                controller.holdingSummaryResponse.value.dayPl == 0
                                                    ? AppStyle.txtSoraSemiBold14WhiteA700
                                                    : AppStyle.txtSoraSemiBold12WhiteA700
                                                        .copyWith(color: LightTheme.red700),
                                            showRupeeIcon: true,
                                          ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Total P&L",
                                      style: AppStyle.textstylesoraregular11
                                          .copyWith(color: LightTheme.gray201),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    (controller.holdingSummaryResponse.value.totalPl == null)
                                        ? ShimmerContainer(
                                            width: scale.getScaledWidth(75),
                                            height: scale.getScaledHeight(20),
                                          )
                                        : FancyTextMFP(
                                            number: controller.holdingSummaryResponse.value.totalPl
                                                    ?.roundToDouble() ??
                                                0.0,
                                            positivePrefix:
                                                controller.holdingSummaryResponse.value.totalPl == 0
                                                    ? ""
                                                    : "+",
                                            negativePrefix: "-",
                                            positiveChange: controller
                                                        .holdingSummaryResponse.value.totalPl !=
                                                    null &&
                                                controller.holdingSummaryResponse.value.totalPl! >=
                                                    0,
                                            positiveIntegerStyle:
                                                controller.holdingSummaryResponse.value.totalPl == 0
                                                    ? AppStyle.txtSoraSemiBold14WhiteA700
                                                    : AppStyle.txtSoraSemiBold14WhiteA700
                                                        .copyWith(color: LightTheme.green700),
                                            positiveDecimalStyle:
                                                controller.holdingSummaryResponse.value.totalPl == 0
                                                    ? AppStyle.txtSoraSemiBold14WhiteA700
                                                    : AppStyle.txtSoraSemiBold12WhiteA700
                                                        .copyWith(color: LightTheme.green700),
                                            negativeIntegerStyle:
                                                controller.holdingSummaryResponse.value.totalPl == 0
                                                    ? AppStyle.txtSoraSemiBold14WhiteA700
                                                    : AppStyle.txtSoraSemiBold14WhiteA700
                                                        .copyWith(color: LightTheme.red700),
                                            negativeDecimalStyle:
                                                controller.holdingSummaryResponse.value.totalPl == 0
                                                    ? AppStyle.txtSoraSemiBold14WhiteA700
                                                    : AppStyle.txtSoraSemiBold12WhiteA700
                                                        .copyWith(color: LightTheme.red700),
                                            showRupeeIcon: true,
                                          ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Absolute returns",
                                      style: AppStyle.textstylesoraregular11
                                          .copyWith(color: LightTheme.gray201),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    (controller.holdingSummaryResponse.value.absReturn == null)
                                        ? ShimmerContainer(
                                            width: scale.getScaledWidth(75),
                                            height: scale.getScaledHeight(20),
                                          )
                                        : FancyTextMFP(
                                            isPer: true,
                                            number:
                                                controller.holdingSummaryResponse.value.absReturn ??
                                                    0.0,
                                            positivePrefix:
                                                controller.holdingSummaryResponse.value.absReturn ==
                                                        0.0
                                                    ? ""
                                                    : "+",
                                            negativePrefix: "-",
                                            positiveSuffix: "%",
                                            negativeSuffix: "%",
                                            positiveChange:
                                                controller.holdingSummaryResponse.value.absReturn !=
                                                        null &&
                                                    controller.holdingSummaryResponse.value
                                                            .absReturn! >=
                                                        0.0,
                                            positiveIntegerStyle:
                                                controller.holdingSummaryResponse.value.absReturn ==
                                                        0.0
                                                    ? AppStyle.txtSoraSemiBold14WhiteA700
                                                    : AppStyle.txtSoraSemiBold14WhiteA700
                                                        .copyWith(color: LightTheme.green700),
                                            positiveDecimalStyle:
                                                controller.holdingSummaryResponse.value.absReturn ==
                                                        0.0
                                                    ? AppStyle.txtSoraSemiBold14WhiteA700
                                                    : AppStyle.txtSoraSemiBold12WhiteA700
                                                        .copyWith(color: LightTheme.green700),
                                            negativeIntegerStyle:
                                                controller.holdingSummaryResponse.value.absReturn ==
                                                        0.0
                                                    ? AppStyle.txtSoraSemiBold14WhiteA700
                                                    : AppStyle.txtSoraSemiBold14WhiteA700
                                                        .copyWith(color: LightTheme.red700),
                                            negativeDecimalStyle:
                                                controller.holdingSummaryResponse.value.absReturn ==
                                                        0.0
                                                    ? AppStyle.txtSoraSemiBold14WhiteA700
                                                    : AppStyle.txtSoraSemiBold12WhiteA700
                                                        .copyWith(color: LightTheme.red700),
                                          ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "XIRR",
                                      style: AppStyle.textstylesoraregular11
                                          .copyWith(color: LightTheme.gray201),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    (controller.holdingSummaryResponse.value.xirrReturns == null)
                                        ? ShimmerContainer(
                                            width: scale.getScaledWidth(75),
                                            height: scale.getScaledHeight(20),
                                          )
                                        : FancyTextMFP(
                                            isPer: true,
                                            number: controller
                                                    .holdingSummaryResponse.value.xirrReturns ??
                                                0.0,
                                            positivePrefix: controller
                                                        .holdingSummaryResponse.value.xirrReturns ==
                                                    0.0
                                                ? ""
                                                : "+",
                                            negativePrefix: "-",
                                            positiveSuffix: "%",
                                            negativeSuffix: "%",
                                            positiveChange: controller
                                                        .holdingSummaryResponse.value.xirrReturns !=
                                                    null &&
                                                controller.holdingSummaryResponse.value
                                                        .xirrReturns! >=
                                                    0.0,
                                            positiveIntegerStyle: controller
                                                        .holdingSummaryResponse.value.xirrReturns ==
                                                    0.0
                                                ? AppStyle.txtSoraSemiBold14WhiteA700
                                                : AppStyle.txtSoraSemiBold14WhiteA700
                                                    .copyWith(color: LightTheme.green700),
                                            positiveDecimalStyle: controller
                                                        .holdingSummaryResponse.value.xirrReturns ==
                                                    0.0
                                                ? AppStyle.txtSoraSemiBold14WhiteA700
                                                : AppStyle.txtSoraSemiBold12WhiteA700
                                                    .copyWith(color: LightTheme.green700),
                                            negativeIntegerStyle: controller
                                                        .holdingSummaryResponse.value.xirrReturns ==
                                                    0.0
                                                ? AppStyle.txtSoraSemiBold14WhiteA700
                                                : AppStyle.txtSoraSemiBold14WhiteA700
                                                    .copyWith(color: LightTheme.red700),
                                            negativeDecimalStyle: controller
                                                        .holdingSummaryResponse.value.xirrReturns ==
                                                    0.0
                                                ? AppStyle.txtSoraSemiBold14WhiteA700
                                                : AppStyle.txtSoraSemiBold12WhiteA700
                                                    .copyWith(color: LightTheme.red700),
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
                                  "My investments (${controller.myInvestmentsResponse.value.data?.length ?? 0})",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSoraSemiBold16.copyWith(
                                    color: LightTheme.gray600,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Semantics(
                                label: "FILTER-LABEL",
                                value: "FILTER-VALUE",
                                child: ImageButton(
                                    height: scale.getScaledHeight(20.00),
                                    width: scale.getScaledWidth(20.00),
                                    svgPath: ImageConstant.imgSearch,
                                    svgColor: LightTheme.bluegray900,
                                    margin: scale.getMargin(left: 16),
                                    onTap: () {
                                      controller.showSearchBar.value = true;
                                    }),
                              ),
                              Semantics(
                                label: "SORT-LABEL",
                                value: "SORT-VALUE",
                                child: ImageButton(
                                    height: scale.getScaledHeight(24.00),
                                    width: scale.getScaledWidth(24.00),
                                    svgPath: ImageConstant.imgFilter,
                                    margin: scale.getMargin(left: 16),
                                    onTap: () {
                                      Get.bottomSheet(Wrap(children: [MFSortBottomSheet()]),
                                          isScrollControlled: true);
                                    }),
                              ),
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
                                  controller.showFilteredHoldings(text);
                                } else {
                                  controller.getMyInvestmentsFunction();
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
                                    controller.getMyInvestmentsFunction();
                                    controller.showFab.value = true;
                                  },
                                  child: Padding(
                                    padding: scale.getPadding(right: 24),
                                    child: CommonNetworkImageView(
                                      height: scale.getScaledHeight(24),
                                      url: ImageConstant.imgClose,
                                      color: LightTheme.bluegray201,
                                    ),
                                  ),
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
            Obx(() => ((controller.myInvestmentsResponse.value.data?.length ?? 0) == 0)
                ? Container(
                    margin: scale.getMargin(all: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: LightTheme.gray201),
                    ),
                    child: Padding(
                      padding: scale.getPadding(all: 20),
                      child: NoResultsFound(
                          textWidget: Text(
                        "No holdings found",
                        style: AppStyle.txtSoraSemiBold14BlueGray900,
                      )),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.myInvestmentsResponse.value.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.mfPortfolioDetailScreen, arguments: {
                                'schemeCode':
                                    controller.myInvestmentsResponse.value.data?[index].schemeCode,
                                'folio_no':
                                    controller.myInvestmentsResponse.value.data?[index].folioNo,
                                'bseSchemeCode': controller
                                    .myInvestmentsResponse.value.data?[index].bseSchemeCode,
                              });
                            },
                            child: Container(
                              padding: scale.getPadding(
                                  left: scale.fw * 0.05, right: scale.fw * 0.05, top: 20),
                              height: getVerticalSize((controller
                                              .myInvestmentsResponse.value.data?[index].nextSipdate
                                              .toString() ??
                                          '') !=
                                      ''
                                  ? scale.fullHeight * 0.31
                                  : scale.fullHeight * 0.26),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: getVerticalSize(scale.fullHeight * 0.09),
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
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12))),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                      margin: scale.getMargin(bottom: 6, top: 5),
                                                      child: RichText(
                                                        maxLines: 3,
                                                        textAlign: TextAlign.left,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              style: AppStyle
                                                                  .txtSoraSemiBold14BlueGray900,
                                                              text: controller
                                                                      .myInvestmentsResponse
                                                                      .value
                                                                      .data?[index]
                                                                      .schemeName ??
                                                                  "",
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                                ),
                                                SizedBox(width: scale.getScaledWidth(5.0)),
                                                Visibility(
                                                  visible: controller.myInvestmentsResponse.value
                                                          .data?[index].mode
                                                          .toString() ==
                                                      "Demat",
                                                  child: InkWell(
                                                    onTap: () {
                                                      Get.bottomSheet(
                                                          TopUpOrSwitchBottomSheet(
                                                            schemeCode: controller
                                                                .myInvestmentsResponse
                                                                .value
                                                                .data?[index]
                                                                .schemeCode
                                                                .toString(),
                                                            assetType: controller
                                                                .myInvestmentsResponse
                                                                .value
                                                                .data?[index]
                                                                .assetType,
                                                            subCat: controller.myInvestmentsResponse
                                                                .value.data?[index].subCategory,
                                                            folioNo: controller
                                                                .myInvestmentsResponse
                                                                .value
                                                                .data?[index]
                                                                .folioNo,
                                                          ),
                                                          isScrollControlled: true);
                                                    },
                                                    child: Padding(
                                                      padding: scale.getPadding(
                                                          horizontal: 8, vertical: 5),
                                                      child: CommonNetworkImageView(
                                                          url: ImageConstant.iconThreeMenuDots,
                                                          width: scale.getScaledWidth(24),
                                                          height: scale.getScaledHeight(24)),
                                                    ),
                                                  ),
                                                )
                                              ]),
                                          Container(
                                            width: scale.fullWidth,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              physics: BouncingScrollPhysics(),
                                              primary: false,
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                        controller.myInvestmentsResponse.value
                                                                    .data?[index].rating
                                                                    .toString() ==
                                                                "0"
                                                            ? "Not rated"
                                                            : controller.myInvestmentsResponse.value
                                                                    .data?[index].rating
                                                                    .toString() ??
                                                                "",
                                                        overflow: TextOverflow.ellipsis,
                                                        textAlign: TextAlign.left,
                                                        style: AppStyle.txtSoraRegular11Gray600
                                                            .copyWith(height: 1.27)),
                                                    Visibility(
                                                      visible: controller.myInvestmentsResponse
                                                              .value.data?[index].rating
                                                              .toString() !=
                                                          "0",
                                                      child: CommonImageView(
                                                          svgPath: ImageConstant.imgStar,
                                                          height: scale.getScaledHeight(16.00),
                                                          width: scale.getScaledWidth(16.00)),
                                                    ),
                                                    SizedBox(width: scale.getScaledWidth(10.0)),
                                                    Container(
                                                      width: scale.getScaledWidth(5.0),
                                                      height: scale.getScaledHeight(5.0),
                                                      decoration: BoxDecoration(
                                                          color: LightTheme.lightgrey100,
                                                          borderRadius: BorderRadius.circular(3)),
                                                    ),
                                                    SizedBox(width: scale.getScaledWidth(10.0)),
                                                    Text(
                                                      controller.myInvestmentsResponse.value
                                                              .data?[index].assetType ??
                                                          "",
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.center,
                                                      style: AppStyle.txtSoraRegular11Gray600,
                                                    ),
                                                    SizedBox(width: scale.getScaledWidth(10.0)),
                                                    Container(
                                                      width: scale.getScaledWidth(5.0),
                                                      height: scale.getScaledHeight(5.0),
                                                      decoration: BoxDecoration(
                                                          color: LightTheme.lightgrey100,
                                                          borderRadius: BorderRadius.circular(3)),
                                                    ),
                                                    SizedBox(width: scale.getScaledWidth(10.0)),
                                                    Text(
                                                      controller.myInvestmentsResponse.value
                                                              .data?[index].subCategory ??
                                                          "",
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.center,
                                                      style: AppStyle.txtSoraRegular11Gray600,
                                                    ),
                                                    SizedBox(width: scale.getScaledWidth(10.0)),
                                                  ]),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height: getVerticalSize(scale.fullHeight * 0.14),
                                      child: Container(
                                        padding: scale.getPadding(top: 5, left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: LightTheme.lightgrey200,
                                            width: 1,
                                          ),
                                          color: LightTheme.whiteA700,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: (controller.myInvestmentsResponse.value
                                                              .data?[index].nextSipdate
                                                              .toString() ??
                                                          '') !=
                                                      ''
                                                  ? Radius.circular(0)
                                                  : Radius.circular(12),
                                              bottomRight: (controller.myInvestmentsResponse.value
                                                              .data?[index].nextSipdate
                                                              .toString() ??
                                                          '') !=
                                                      ''
                                                  ? Radius.circular(0)
                                                  : Radius.circular(12)),
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
                                                    style: AppStyle.txtSoraRegular12
                                                        .copyWith(color: LightTheme.gray600),
                                                  ),
                                                  FancyTextMFP(
                                                    number: (controller.myInvestmentsResponse.value
                                                            .data![index].investedAmt
                                                            ?.roundToDouble() ??
                                                        0),
                                                    positiveChange: true,
                                                    positiveIntegerStyle:
                                                        AppStyle.txtSoraSemiBold12Bluegray900,
                                                    positiveDecimalStyle:
                                                        AppStyle.txtSoraSemiBold12Bluegray900,
                                                    negativeIntegerStyle:
                                                        AppStyle.txtSoraSemiBold14Bluegray900,
                                                    negativeDecimalStyle:
                                                        AppStyle.txtSoraSemiBold12Bluegray900,
                                                    showRupeeIcon: true,
                                                  ),
                                                ])),
                                                Container(
                                                    child: Row(children: [
                                                  Text(
                                                    'Current: ',
                                                    style: AppStyle.txtSoraRegular12
                                                        .copyWith(color: LightTheme.gray600),
                                                  ),
                                                  FancyTextMFP(
                                                    number: (controller.myInvestmentsResponse.value
                                                            .data![index].currentValue
                                                            ?.roundToDouble() ??
                                                        0),
                                                    positiveChange: true,
                                                    positiveIntegerStyle:
                                                        AppStyle.txtSoraSemiBold12Bluegray900,
                                                    positiveDecimalStyle:
                                                        AppStyle.txtSoraSemiBold12Bluegray900,
                                                    negativeIntegerStyle:
                                                        AppStyle.txtSoraSemiBold14Bluegray900,
                                                    negativeDecimalStyle:
                                                        AppStyle.txtSoraSemiBold12Bluegray900,
                                                    showRupeeIcon: true,
                                                  ),
                                                ])),
                                              ],
                                            ),
                                            Container(
                                              padding: scale.getPadding(
                                                  top: 5, bottom: 5, left: 10, right: 10),
                                              decoration: BoxDecoration(
                                                  color: LightTheme.whiteA700,
                                                  border: Border.all(
                                                    color: LightTheme.lightgrey200,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(Radius.circular(12))),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Overall P&L",
                                                        style: AppStyle.textstylesoraregular11
                                                            .copyWith(color: LightTheme.gray201),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      FancyTextMFP(
                                                        number: (controller.myInvestmentsResponse
                                                                    .value.data![index].pl ??
                                                                0.0)
                                                            .roundToDouble(),
                                                        positivePrefix: "+",
                                                        negativePrefix: "",
                                                        positiveChange: controller
                                                                    .myInvestmentsResponse
                                                                    .value
                                                                    .data![index]
                                                                    .pl !=
                                                                null &&
                                                            controller.myInvestmentsResponse.value
                                                                    .data![index].pl! >=
                                                                0,
                                                        positiveIntegerStyle: controller
                                                                    .myInvestmentsResponse
                                                                    .value
                                                                    .data![index]
                                                                    .pl ==
                                                                0
                                                            ? AppStyle.txtSoraSemiBold14BlueGray900
                                                            : AppStyle.txtSoraSemiBold14WhiteA700
                                                                .copyWith(
                                                                    color: LightTheme.green700),
                                                        positiveDecimalStyle: controller
                                                                    .myInvestmentsResponse
                                                                    .value
                                                                    .data![index]
                                                                    .pl ==
                                                                0
                                                            ? AppStyle.txtSoraSemiBold12Bluegray900
                                                            : AppStyle.txtSoraSemiBold12WhiteA700
                                                                .copyWith(
                                                                    color: LightTheme.green700),
                                                        negativeIntegerStyle: controller
                                                                    .myInvestmentsResponse
                                                                    .value
                                                                    .data![index]
                                                                    .pl ==
                                                                0
                                                            ? AppStyle.txtSoraSemiBold14BlueGray900
                                                            : AppStyle.txtSoraSemiBold14WhiteA700
                                                                .copyWith(color: LightTheme.red700),
                                                        negativeDecimalStyle: controller
                                                                    .myInvestmentsResponse
                                                                    .value
                                                                    .data![index]
                                                                    .pl ==
                                                                0
                                                            ? AppStyle.txtSoraSemiBold12Bluegray900
                                                            : AppStyle.txtSoraSemiBold12WhiteA700
                                                                .copyWith(color: LightTheme.red700),
                                                        showRupeeIcon: true,
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "Absolute",
                                                        style: AppStyle.textstylesoraregular11
                                                            .copyWith(color: LightTheme.gray201),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      FancyTextMFP(
                                                        isPer: true,
                                                        number: controller.myInvestmentsResponse
                                                                .value.data![index].absReturn ??
                                                            0.0,
                                                        positivePrefix: "+",
                                                        negativePrefix: "",
                                                        positiveSuffix: "%",
                                                        negativeSuffix: "%",
                                                        positiveChange: controller
                                                                    .myInvestmentsResponse
                                                                    .value
                                                                    .data![index]
                                                                    .absReturn !=
                                                                null &&
                                                            controller.myInvestmentsResponse.value
                                                                    .data![index].absReturn! >=
                                                                0,
                                                        positiveIntegerStyle: controller
                                                                    .myInvestmentsResponse
                                                                    .value
                                                                    .data![index]
                                                                    .absReturn ==
                                                                0.0
                                                            ? AppStyle.txtSoraSemiBold14BlueGray900
                                                            : AppStyle.txtSoraSemiBold14WhiteA700
                                                                .copyWith(
                                                                    color: LightTheme.green700),
                                                        positiveDecimalStyle: controller
                                                                    .myInvestmentsResponse
                                                                    .value
                                                                    .data![index]
                                                                    .absReturn ==
                                                                0.0
                                                            ? AppStyle.txtSoraSemiBold12Bluegray900
                                                            : AppStyle.txtSoraSemiBold12WhiteA700
                                                                .copyWith(
                                                                    color: LightTheme.green700),
                                                        negativeIntegerStyle: controller
                                                                    .myInvestmentsResponse
                                                                    .value
                                                                    .data![index]
                                                                    .absReturn ==
                                                                0.0
                                                            ? AppStyle.txtSoraSemiBold14BlueGray900
                                                            : AppStyle.txtSoraSemiBold14WhiteA700
                                                                .copyWith(color: LightTheme.red700),
                                                        negativeDecimalStyle: controller
                                                                    .myInvestmentsResponse
                                                                    .value
                                                                    .data![index]
                                                                    .absReturn ==
                                                                0.0
                                                            ? AppStyle.txtSoraSemiBold12Bluegray900
                                                            : AppStyle.txtSoraSemiBold12WhiteA700
                                                                .copyWith(color: LightTheme.red700),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "XIRR",
                                                        style: AppStyle.textstylesoraregular11
                                                            .copyWith(color: LightTheme.gray201),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      FancyTextMFP(
                                                        isPer: true,
                                                        number: controller.myInvestmentsResponse
                                                                .value.data![index].xirr ??
                                                            0.0,
                                                        positivePrefix: "+",
                                                        negativePrefix: "-",
                                                        positiveSuffix: "%",
                                                        negativeSuffix: "%",
                                                        positiveChange: controller
                                                                    .myInvestmentsResponse
                                                                    .value
                                                                    .data![index]
                                                                    .xirr !=
                                                                null &&
                                                            controller.myInvestmentsResponse.value
                                                                    .data![index].xirr! >=
                                                                0,
                                                        positiveIntegerStyle: controller
                                                                    .myInvestmentsResponse
                                                                    .value
                                                                    .data![index]
                                                                    .xirr ==
                                                                0.0
                                                            ? AppStyle.txtSoraSemiBold14BlueGray900
                                                            : AppStyle.txtSoraSemiBold14WhiteA700
                                                                .copyWith(
                                                                    color: LightTheme.green700),
                                                        positiveDecimalStyle: controller
                                                                    .myInvestmentsResponse
                                                                    .value
                                                                    .data![index]
                                                                    .xirr ==
                                                                0.0
                                                            ? AppStyle.txtSoraSemiBold12Bluegray900
                                                            : AppStyle.txtSoraSemiBold12WhiteA700
                                                                .copyWith(
                                                                    color: LightTheme.green700),
                                                        negativeIntegerStyle: controller
                                                                    .myInvestmentsResponse
                                                                    .value
                                                                    .data![index]
                                                                    .xirr ==
                                                                0.0
                                                            ? AppStyle.txtSoraSemiBold14BlueGray900
                                                            : AppStyle.txtSoraSemiBold14WhiteA700
                                                                .copyWith(color: LightTheme.red700),
                                                        negativeDecimalStyle: controller
                                                                    .myInvestmentsResponse
                                                                    .value
                                                                    .data![index]
                                                                    .xirr ==
                                                                0.0
                                                            ? AppStyle.txtSoraSemiBold12Bluegray900
                                                            : AppStyle.txtSoraSemiBold12WhiteA700
                                                                .copyWith(color: LightTheme.red700),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  Visibility(
                                    visible: (controller.myInvestmentsResponse.value.data?[index]
                                                .nextSipdate
                                                .toString() ??
                                            '') !=
                                        '',
                                    child: SizedBox(
                                      height: getVerticalSize(scale.fullHeight * 0.14 * 0.35),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: LightTheme.gray100,
                                            border: Border.all(
                                              color: LightTheme.lightgrey200,
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight: Radius.circular(12))),
                                        child: Row(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  padding: scale.getPadding(left: 10),
                                                  child: InkWell(
                                                    child: Text(
                                                        "Next SIP: ${getFormattedDate(controller.myInvestmentsResponse.value.data?[index].nextSipdate.toString() ?? '')}",
                                                        style: AppStyle.txtSoraRegular12
                                                            .copyWith(color: LightTheme.gray600)),
                                                    onTap: () {},
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Visibility(
                                              visible: (controller.myInvestmentsResponse.value
                                                      .data![index].dividend!
                                                      .ceil() !=
                                                  0),
                                              child: Container(
                                                padding: scale.getPadding(left: 20),
                                                child: Row(
                                                  children: [
                                                    Text('Dividend: ',
                                                        style: AppStyle.txtSoraSemiBold12Red700
                                                            .copyWith(color: LightTheme.gray600)),
                                                    FancyTextMFP(
                                                      number: (controller.myInvestmentsResponse
                                                              .value.data![index].dividend
                                                              ?.roundToDouble() ??
                                                          0),
                                                      positiveChange: true,
                                                      positiveIntegerStyle:
                                                          AppStyle.txtSoraSemiBold12Bluegray900,
                                                      positiveDecimalStyle:
                                                          AppStyle.txtSoraSemiBold12Bluegray900,
                                                      negativeIntegerStyle:
                                                          AppStyle.txtSoraSemiBold14Bluegray900,
                                                      negativeDecimalStyle:
                                                          AppStyle.txtSoraSemiBold12Bluegray900,
                                                      showRupeeIcon: true,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 15)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Obx(
                            () => Visibility(
                              visible: (controller.mfPledge.value != 0.0 &&
                                      (controller.myInvestmentsResponse.value.data?.length ?? 0) ==
                                          1 &&
                                      index == 0) ||
                                  (controller.mfPledge.value != 0.0 &&
                                      (controller.myInvestmentsResponse.value.data?.length ?? 0) >
                                          1 &&
                                      index == 1),
                              child: Padding(
                                padding: scale.getPadding(
                                    left: scale.fw * 0.05, right: scale.fw * 0.05, top: 20),
                                child: Container(
                                    margin: scale.getMargin(all: 0),
                                    decoration: BoxDecoration(
                                      color: LightTheme.orange100,
                                      borderRadius: BorderRadiusStyle.roundedBorder12,
                                    ),
                                    child: Container(
                                        child: Stack(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: scale.getPadding(all: 16),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(
                                                      scale.getScaledFont(
                                                        8.00,
                                                      ),
                                                    ),
                                                    child: CommonNetworkImageView(
                                                      url: ImageConstant.imgVenturalogomar,
                                                      height: scale.getScaledHeight(30),
                                                      width: scale.getScaledWidth(30),
                                                    ),
                                                  ),
                                                ),
                                                Center(
                                                  child: Container(
                                                    margin: scale.getMargin(
                                                        top: 16, bottom: 16, right: 16),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Pledge this mutual fund",
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style:
                                                              AppStyle.txtSoraSemiBold14Bluegray900,
                                                        ),
                                                        Container(
                                                          margin: scale.getMargin(top: 4),
                                                          child: Text(
                                                            "Get upto ₹${numberFormat.format(controller.mfPledge.value ?? 0.0)} by pledging.",
                                                            maxLines: 2,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle.txtSoraRegular12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: LightTheme.deepOrange400,
                                            ),
                                            Padding(
                                              padding: scale.getPadding(top: 0, right: 16),
                                              child: TextButton(
                                                onPressed: () {
                                                  Get.toNamed(AppRoutes.marginPledgeScreen);
                                                },
                                                child: Text(
                                                  'Pledge now',
                                                  style: AppStyle.txtSoraSemiBold14Deeporange400,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: scale.getPadding(
                                              right: 8,
                                              top: 8,
                                              bottom: 8,
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(
                                                scale.getScaledFont(
                                                  8.00,
                                                ),
                                              ),
                                              child: CommonNetworkImageView(
                                                url: ImageConstant.imgShineOrange,
                                                showPlaceHolder: false,
                                                height: scale.getScaledHeight(
                                                  70.00,
                                                ),
                                                width: scale.fullWidth * 0.5,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ))),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  )),
            SizedBox(
              height: 20,
            ),
            Padding(
                // this is new
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
          ],
        ));
  }

  String getFormattedDate(String date) {
    if (date == '') {
      return "";
    }
    DateTime newDate = DateFormat('dd/MM/yy').parse(date);
    String formattedDate = DateFormat('dd MMM yyyy').format(newDate);

    return formattedDate;
  }

  Widget sipBookTab(BuildContext context) {
    var controller = Get.put(SipLandingController());
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          SizedBox(
            child: Container(
              margin: scale.getMargin(top: 0),
              height: kToolbarHeight - 12.5,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: getVerticalSize(1), color: LightTheme.gray300))),
              child: TabBar(
                labelStyle: AppStyle.txtSoraSemiBold14Bluegray900,
                labelColor: LightTheme.bluegray900,
                labelPadding: scale.getPadding(left: 20, right: 20),
                unselectedLabelColor: LightTheme.gray600,
                unselectedLabelStyle: AppStyle.txtSoraRegular14,
                indicator: TabIndicator(),
                isScrollable: false,
                tabs: [Tab(text: "Upcoming SIPs"), Tab(text: "Missed SIPs")],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: scale.getPadding(left: 0, right: 0, top: 10, bottom: 0),
              child: TabBarView(
                children: <Widget>[
                  //! Upcoming SIPs Listview
                  Container(
                    padding: scale.getPadding(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ActiveSipSummary(
                          context: context,
                          activeSip: controller.sipSummary.value.sips ?? 0,
                          sipAmount: controller.sipSummary.value.sipAmount,
                          pendingAutoPay: controller.sipSummary.value.autopayPending ?? 0,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "MY SIPs",
                          style: AppStyle.txtSoraBold12Gray600,
                        ),
                        SizedBox(height: 16),
                        if (controller.sipList.value.data != null &&
                            controller.sipList.value.data!.isNotEmpty)
                          Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              primary: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) => InkWell(
                                  child: UpcomingSipContainer(
                                    sipName: controller.sipList.value.data?[index].schemeName ?? "",
                                    sipAmount:
                                        controller.sipList.value.data?[index].amount.toString() ??
                                            "",
                                    nextSipDate: controller.dateConverter(
                                        controller.sipList.value.data?[index].nextSipDate ?? ""),
                                    sipDaysLeft:
                                        controller.sipList.value.data?[index].daysLeft.toString() ??
                                            "",
                                    sipStatus: controller.sipList.value.data?[index].sipStatus,
                                  ),
                                  onTap: () => Get.toNamed(AppRoutes.sipTransactionHistoryScreen,
                                          arguments: [
                                            controller.sipList.value.data?[index].sipId,
                                          ])),
                              separatorBuilder: (context, index) => SizedBox(height: 12),
                              itemCount: controller.sipList.value.data?.length ?? 0,
                            ),
                          ),
                        if (controller.sipList.value.data == null ||
                            controller.sipList.value.data!.isEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              NoResultsFound(
                                textWidget: Text(
                                  'No SIPs found',
                                  style: AppStyle.txtSoraRegular14.copyWith(
                                      fontWeight: FontWeight.w600, color: LightTheme.gray800),
                                ),
                              ),
                              SizedBox(
                                width: scale.getScaledWidth(200),
                                child: Text(
                                  "Start your investment journey with Ventura.",
                                  style: AppStyle.txtSoraRegular14.copyWith(
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        if (controller.sipList.value.data == null ||
                            controller.sipList.value.data!.isEmpty)
                          Spacer(),
                        if (controller.sipList.value.data == null ||
                            controller.sipList.value.data!.isEmpty)
                          exploreButton()
                      ],
                    ),
                  ),

                  //! Missed SIPs Listview
                  Container(
                    padding: scale.getPadding(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (controller.sipMissed.value.data != null)
                            ? Expanded(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) => InkWell(
                                    child: MissedSipContainer(
                                      sipName: controller.sipMissed.value
                                              .data?[index].schemeName ??
                                          "",
                                      sipAmount: controller.sipMissed.value
                                              .data?[index].amount
                                              .toString() ??
                                          "",
                                      nextSipDate: controller.dateConverter(
                                          controller.sipMissed.value
                                                  .data?[index].missedDate ??
                                              ""),
                                      sipLeft: 0,
                                      sipTotal: controller
                                              .sipMissed.value.data?.length ??
                                          0,
                                    ),
                                    onTap: () {
                                      Get.toNamed(
                                          AppRoutes.sipTransactionHistoryScreen,
                                          arguments: [
                                            controller.sipMissed.value
                                                .data?[index].sipId,
                                          ]);
                                    },
                                  ),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 12),
                                  itemCount:
                                      controller.sipMissed.value.data?.length ??
                                          0,
                                ),
                              )
                            : Padding(
                                padding: scale.getPadding(top: 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    NoResultsFound(
                                      textWidget: Text(
                                        'No missed SIPs found',
                                        style: AppStyle.txtSoraRegular14.copyWith(
                                            fontWeight: FontWeight.w600, color: LightTheme.gray800),
                                      ),
                                    ),
                                    SizedBox(
                                      width: scale.getScaledWidth(200),
                                      child: Text(
                                        "Start your investment journey with Ventura.",
                                        style: AppStyle.txtSoraRegular14.copyWith(
                                          fontSize: 13,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        if (controller.sipMissed.value.data == null || controller.sipMissed.value.data!.isEmpty)
                        Spacer(),
                        if (controller.sipMissed.value.data == null || controller.sipMissed.value.data!.isEmpty)
                          exploreButton(),
                        if (controller.sipMissed.value.data != null)
                          SizedBox(height: scale.getScaledHeight(80))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  InkWell exploreButton() {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.mfDirectoryScreen);
      },
      child: Container(
        margin: scale.getMargin(bottom: 85),
        height: scale.getScaledHeight(50),
        alignment: Alignment.center,
        width: double.infinity,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), color: LightTheme.bluegray900),
        child: Text(
          "Explore all funds",
          style: AppStyle.txtSoraSemiBold14.copyWith(color: LightTheme.whiteA700),
        ),
      ),
    );
  }
}