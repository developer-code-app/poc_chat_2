import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    this.showLoadingLabel = true,
    this.background,
    super.key,
  });

  final bool showLoadingLabel;
  final BoxDecoration? background;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      decoration: background,
      child: Column(
        children: [
          const Spacer(),
          const Center(
            child: CircularProgressIndicator(),
          ),
          const SizedBox(height: 20),
          if (showLoadingLabel) const Text('Loading'),
          const Spacer(),
        ],
      ),
    );
  }
}
