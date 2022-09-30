import 'package:flutter/material.dart';

class FancyDrawerController extends ChangeNotifier {
  final TickerProvider? vsync;
  final Duration duration;
  final AnimationController _animationController;
  DrawerState state = DrawerState.closed;

  FancyDrawerController({@required this.vsync, this.duration = const Duration(milliseconds: 250)}) : _animationController = AnimationController(vsync: vsync!, duration: duration) {
    _initController();
  }

  void _initController() {
    _animationController
      ..addListener(() {
        notifyListeners();
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            state = DrawerState.opening;
            break;
          case AnimationStatus.reverse:
            state = DrawerState.closing;
            break;
          case AnimationStatus.completed:
            state = DrawerState.closed;
            break;
          case AnimationStatus.dismissed:
            state = DrawerState.closed;
            break;
          default:
            state = DrawerState.closed;
        }

        notifyListeners();
      });
  }

  get percentOpen => _animationController.value;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void open() {
    _animationController.forward();
  }

  close() {
    _animationController.reverse();
  }

  void toggle() {
    if (state == DrawerState.open) {
      close();
    } else if (state == DrawerState.closed) {
      open();
    }
  }
}

/// Drawer state defines the current drawer state on app
enum DrawerState { open, closed, opening, closing }

class FancyDrawerWrapper extends StatefulWidget {
  final List<Widget>? drawerItems;
  final double itemGap;
  final Color backgroundColor;
  final Widget? child;
  final FancyDrawerController? controller;
  final bool hideOnContentTap;
  final double cornerRadius;

  const FancyDrawerWrapper({
    Key? key,
    @required this.drawerItems,
    this.backgroundColor = Colors.white,
    @required this.child,
    @required this.controller,
    this.itemGap = 10.0,
    this.hideOnContentTap = true,
    this.cornerRadius = 8.0,
  }) : super(key: key);

  @override
  _FancyDrawerWrapperState createState() => _FancyDrawerWrapperState();
}

class _FancyDrawerWrapperState extends State<FancyDrawerWrapper> {
  @override
  void initState() {
    super.initState();
  }

  Widget _renderContent() {
    final slideAmount = 275.0 * widget.controller!.percentOpen;
    final contentScale = 1.0 - (0.2 * widget.controller!.percentOpen);
    final cornerRadius = widget.cornerRadius * widget.controller!.percentOpen;

    return Transform(
      transform: Matrix4.translationValues(slideAmount, 0.0, 0.0)..scale(contentScale, contentScale),
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), offset: Offset(0.0, 4.0), blurRadius: 40.0, spreadRadius: 10.0)]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(cornerRadius),
          child: GestureDetector(
            onTap: () {
              if (widget.hideOnContentTap) {
                widget.controller!.close();
              }
            },
            child: widget.child,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          color: widget.backgroundColor,
          child: Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.drawerItems!.map((item) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: widget.itemGap),
                  child: item,
                );
              }).toList(),
            ),
          ),
        ),
        _renderContent()
      ],
    );
  }
}
