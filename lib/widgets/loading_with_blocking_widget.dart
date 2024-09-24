import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_chat_2/cubits/ui_blocking_cubit.dart';
import 'package:poc_chat_2/widgets/loading_indicator_widget.dart';

class LoadingWithBlockingWidget extends StatelessWidget {
  const LoadingWithBlockingWidget({
    required this.child,
    this.showLoadingLabel = true,
    this.enable = true,
    super.key,
  });

  final Widget child;
  final bool showLoadingLabel;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UIBlockingCubit, bool>(
      builder: (context, isBlocked) {
        return IgnorePointer(
          ignoring: isBlocked && enable,
          child: Stack(
            children: [
              child,
              Visibility(
                visible: isBlocked && enable,
                child: const LoadingIndicator(),
              ),
            ],
          ),
        );
      },
    );
  }
}
