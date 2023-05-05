import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/models/history_model.dart';
import 'package:timelines/timelines.dart';

class ProcessTimelinePage extends StatefulWidget {
  final OrderModel currentOrder;

  const ProcessTimelinePage({super.key, required this.currentOrder});

  @override
  _ProcessTimelinePageState createState() => _ProcessTimelinePageState();
}

class _ProcessTimelinePageState extends State<ProcessTimelinePage> {
  final kTileHeight = 54.0;

  final completeColor = ThemeColors.primaryColor;
  final inProgressColor = ThemeColors.textRedColor;
  final todoColor = ThemeColors.menuLightColor;

  final List<HistoryStatus> _processes = [
    HistoryStatus.request,
    HistoryStatus.pending,
    HistoryStatus.delivering,
    HistoryStatus.delivered,
  ];

  int _processIndex = 0;

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    _processIndex = _processes.indexOf(widget.currentOrder.status);
    return Timeline.tileBuilder(
      physics: NeverScrollableScrollPhysics(),
      // padding: EdgeInsets.only(right: 16.0),
      theme: TimelineThemeData(
        direction: Axis.horizontal,
        // connectorTheme: ConnectorThemeData(space: 16.0, thickness: 4.0),
      ),
      builder: TimelineTileBuilder.connected(
        contentsBuilder: (context, index) {
          return AppPadding(
            padding: const AppEdgeInsets.only(top: AppGapSize.medium),
            child: AppText.bodyMedium(
              text: _processes[index].status,
              color: getColor(index),
            ),
          );
        },
        connectionDirection: ConnectionDirection.before,
        itemExtentBuilder: (_, __) =>
            MediaQuery.of(context).size.width / (_processes.length + 0.3),
        oppositeContentsBuilder: (context, index) {
          return AppPadding(
            padding: AppEdgeInsets.only(bottom: AppGapSize.medium),
            child: Lottie.asset(_processes[index].lottieUrl),
          );
        },
        indicatorBuilder: (_, index) {
          var color;
          var child;
          if (index == _processIndex) {
            color = inProgressColor;
            child = Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                  strokeWidth: 3.0,
                  valueColor: AlwaysStoppedAnimation(Colors.white)),
            );
          } else if (index < _processIndex) {
            color = completeColor;
            child = Icon(
              Icons.check,
              color: Colors.white,
              size: 15.0,
            );
          } else {
            color = todoColor;
          }

          if (index <= _processIndex) {
            return Stack(
              children: [
                CustomPaint(
                  size: Size(30.0, 30.0),
                  painter: _BezierPainter(
                      color: color,
                      drawStart: index > 0,
                      drawEnd: index < _processIndex),
                ),
                DotIndicator(size: 30.0, color: color, child: child),
              ],
            );
          } else {
            return Stack(
              children: [
                CustomPaint(
                  size: Size(15.0, 15.0),
                  painter: _BezierPainter(
                      color: color, drawEnd: index < _processes.length - 1),
                ),
                OutlinedDotIndicator(borderWidth: 8.0, color: color),
              ],
            );
          }
        },
        connectorBuilder: (_, index, type) {
          if (index > 0) {
            if (index == _processIndex) {
              final prevColor = getColor(index - 1);
              final color = getColor(index);
              List<Color> gradientColors;
              if (type == ConnectorType.start) {
                gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
              } else {
                gradientColors = [
                  prevColor,
                  Color.lerp(prevColor, color, 0.5)!
                ];
              }
              return DecoratedLineConnector(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: gradientColors),
                ),
              );
            } else {
              return SolidLineConnector(
                color: getColor(index),
              );
            }
          } else {
            return null;
          }
        },
        itemCount: _processes.length,
      ),
    );
  }
}

/// hardcoded bezier painter
/// TODO: Bezier curve into package component
class _BezierPainter extends CustomPainter {
  const _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    var angle;
    var offset1;
    var offset2;

    var path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius,
            radius) // TODO connector start & gradient
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(size.width, size.height / 2, size.width + radius,
            radius) // TODO connector end & gradient
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}
