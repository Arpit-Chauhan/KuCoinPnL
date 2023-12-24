import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/colorConstants.dart';
import '../utils/scaling.dart';



class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    this.height = 15.0,
    this.width = 80,
    this.decoration = const BoxDecoration(color: Colors.white),
    this.child = const SizedBox(height: 0, width: 0),
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
    this.borderRadius,
  });

  final double height;
  final double width;
  final BoxDecoration decoration;
  final Widget child;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade100,
        highlightColor: Colors.grey.shade300,
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          child: Container(
            decoration: decoration,
            width: width,
            height: height,
            child: child,
          ),
        ),
      ),
    );
  }
}

class DarkShimmerContainer extends StatelessWidget {
  const DarkShimmerContainer({
    super.key,
    this.height = 15.0,
    this.width = 80,
    this.decoration = const BoxDecoration(color: LightTheme.blueGray800),
    this.child = const SizedBox(height: 0, width: 0),
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
    this.borderRadius,
  });
  final double height;
  final double width;
  final BoxDecoration decoration;
  final Widget child;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  @override
  Widget build(BuildContext context) {
    Scaling scale = Scaling(context: context)..setCurrentDeviceSize();
    return Container(
      margin: margin,
      padding: padding,
      child: Shimmer.fromColors(
        baseColor: LightTheme.blueGray800,
        highlightColor: LightTheme.bluegray900,
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(8)),
          child: Container(
            decoration: decoration,
            width: width,
            height: height,
            child: child,
          ),
        ),
      ),
    );
  }
}
