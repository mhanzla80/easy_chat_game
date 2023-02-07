import 'package:easy_chat_game/src/models/chat_level.dart';
import 'package:easy_chat_game/src/models/enums.dart';
import 'package:flutter/material.dart';

typedef PlacementBuilder = Widget Function(BuildContext, PrankCallPlacement);
typedef EventActionCallback = void Function(BuildContext, PrankCallEventAction);

class EasyChatGameController extends InheritedWidget {
  const EasyChatGameController({
    super.key,
    required this.title,
    required this.levels,
    required super.child,
    this.placementBuilder,
    this.onTapEvent,
    required this.context,
  });

  /// This is the main title text
  final String title;

  /// Add All levels here
  final List<ChatLevel> levels;

  /// [placementBuilder] is used to build your custom widget at specific places
  final PlacementBuilder? placementBuilder;

  /// [onTapEvent] will be call on every event preformed by the user
  final EventActionCallback? onTapEvent;

  final BuildContext context;

  static EasyChatGameController? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EasyChatGameController>();
  }

  static EasyChatGameController of(BuildContext context) {
    final EasyChatGameController? result = maybeOf(context);
    assert(result != null, 'No controller found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(EasyChatGameController oldWidget) =>
      title != oldWidget.title;
}
