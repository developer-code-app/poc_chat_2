import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  const ShimmerLoadingWidget({
    this.width = double.maxFinite,
    this.height = double.maxFinite,
    this.enable = true,
    this.borderRadius = 16,
    super.key,
  });

  final double width;
  final double height;
  final bool enable;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade100,
      highlightColor: Colors.grey.shade200,
      period: const Duration(seconds: 1),
      enabled: enable,
      child: Container(
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        width: width,
        height: height,
      ),
    );
  }
}
