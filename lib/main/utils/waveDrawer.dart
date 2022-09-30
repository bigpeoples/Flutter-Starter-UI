import 'package:flutter/material.dart';

class WaveDrawer extends StatelessWidget {
  WaveDrawer({
    Key? key,
    this.width,
    this.backgroundColorOpacity = 0.5,
    this.elevation = 16.0,
    this.child,
    @required this.backgroundColor,
    @required this.boundaryColor,
    @required this.boundaryWidth,
    this.semanticLabel,
  })  : assert(elevation >= 0.0 && backgroundColorOpacity >= 0.0),
        super(key: key);

  final double? width;

  final Color? backgroundColor;

  final double backgroundColorOpacity;

  final Color? boundaryColor;

  final double? boundaryWidth;

  final double elevation;

  final Widget? child;

  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    String? label = semanticLabel;
    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
        label = semanticLabel;
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        label = semanticLabel;
        break;
      case TargetPlatform.linux:
        // TODO: Handle this case.
        break;
      case TargetPlatform.macOS:
        // TODO: Handle this case.
        break;
      case TargetPlatform.windows:
        // TODO: Handle this case.
        break;
    }

    return CustomPaint(
      //  painter: WavePathPainter(boundaryColor, boundaryWidth),
      child: ClipPath(
        child: Semantics(
          scopesRoute: true,
          namesRoute: true,
          explicitChildNodes: true,
          label: label,
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(width: width),
            child: Material(
              color: backgroundColor!.withOpacity(backgroundColorOpacity),
              elevation: elevation,
              child: child,
            ),
          ),
        ),
        //  clipper: DrawerWaveClipper(boundaryWidth),
      ),
    );
  }
}
