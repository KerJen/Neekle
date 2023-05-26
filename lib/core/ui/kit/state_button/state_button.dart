import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../colors.dart';
import '../../../const.dart';
import '../bouncing_gesture_detector.dart';
import '../loading_indicator.dart';

part 'state_button.freezed.dart';


@freezed
class StateButtonState with _$StateButtonState {
  const factory StateButtonState.base({required Widget child}) = _BaseStateButtonState;
  const factory StateButtonState.loading() = _LoadingStateButtonState;
  const factory StateButtonState.success({@Default(Icon(Icons.done, color: Colors.white)) Widget child}) =
      _SuccessStateButtonState;
  const factory StateButtonState.failed({required String message}) = _FailedStateButtonState;
}

class StateButton extends StatelessWidget {
  final double? width;
  final double height;
  final Color? color;
  final Border? border;

  final VoidCallback onPressed;
  final EdgeInsets? margin;
  final StateButtonState state;

  const StateButton({
    super.key,
    this.width,
    this.height = kButtonHeight,
    this.color,
    this.border,
    required this.onPressed,
    this.margin,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return BouncingGestureDetector(
      onTap: state.maybeMap(base: (_) => onPressed, orElse: () => null),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
        margin: margin,
        height: height,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(52 / 2),
          border: border,
          color: state.maybeMap(
            success: (_) => currentColorScheme(context).secondaryContainer,
            failed: (_) => redColor,
            orElse: () => color ?? currentColorScheme(context).primary.withOpacity(0.7),
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: state.map(
            base: (state) => state.child,
            loading: (_) {
              return LoadingIndicator(height: height / 2, width: height / 2);
            },
            success: (state) {
              return state.child;
            },
            failed: (state) {
              return Text(
                state.message,
                style: TextStyle(color: currentColorScheme(context).onBackground),
              );
            },
          ),
        ),
      ),
    );
  }
}
