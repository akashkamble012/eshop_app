import 'package:flutter/material.dart';



class RouteSlideTransitionAnimation extends MaterialPageRoute {
  Widget widget;
  Offset beginOffset;
  Offset endOffset;

  @override
  RouteSettings settings;
  RouteSlideTransitionAnimation({
    required this.widget,
    this.beginOffset = const Offset(1.0, 0.0),
    this.endOffset = Offset.zero,
    required this.settings,
  }) : super(builder: (BuildContext context) => widget, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        ),
      ),
      child: SlideTransition(
        position: Tween<Offset>(begin: beginOffset, end: endOffset)
            .animate(animation),
        child: child,
      ),
    );
  }
}



class CustomeRoute extends MaterialPageRoute {
  Widget widget;
  CustomeRoute({required this.widget})
      : super(
          builder: (BuildContext context) {
            return widget;
          },
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        ),
      ),
      child: ScaleTransition(
          scale: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
          ),
          child: child),
    );
  }
}

//////////////////////////////////

class CustomeRouteThree extends PopupRoute {
  Widget widget;
  CustomeRouteThree({required this.widget}) : super();

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset.zero)
          .animate(animation),
      child: child,
    );
  }

  @override
  Color? get barrierColor => Colors.black45;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Hello';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.linear,
        ),
      ),
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.linear,
          ),
        ),
        child: widget,
      ),
    );
  }

  @override
  Duration get transitionDuration => Duration(
        milliseconds: 450,
      );
}

//////////////////////////////////

class CustomeRouteTwo extends PageRouteBuilder {
  final Widget widget;

  CustomeRouteTwo({required this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
        );

  @override
  RouteTransitionsBuilder get transitionsBuilder => (BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
          child: child,
        );
      };
}

/*

Matrix4 getAnchorToNavigatorTransform(
    RenderObject? anchor, RenderObject? navigator) {
  Matrix4 anchorTransform = anchor!.getTransformTo(null);
  Matrix4 navigatorTransform = navigator!.getTransformTo(null);
  // .tryInvert(navigatorTransform)
  return anchorTransform..multiply(Matrix4.inverted(navigatorTransform));
}

Rect getAnchorRectInNavigator(RenderObject? anchor, RenderObject? navigator) {
  Matrix4 transform = getAnchorToNavigatorTransform(anchor, navigator);
  Rect anchorRect = Offset.zero & (anchor as RenderBox).size;
  return MatrixUtils.transformRect(transform, anchorRect);
}

class OverlayRouteS<T> extends PopupRoute<T> with WidgetsBindingObserver {
  OverlayRouteS({
    required this.anchor,
    required this.overlay,
  });

  /// The context which contains the [RenderBox] which [overlay] will be
  /// positioned on top of.
  final BuildContext anchor;

  /// The builder which builds the overlaid [Widget].
  final WidgetBuilder overlay;

  /// We return false here to ensure that the source route, which contains
  /// [anchor], is kept around. Otherwise [anchor] becomes unusable once this
  /// route is pushed.
  @override
  bool get opaque => false;

  /// The color of the barrier displayed between the source route and this
  /// route. The barrier occupies the whole screen.
  @override
  Color get barrierColor => Colors.black26;

  /// Returning `true` allows the user to pop this route by tapping on the
  /// barrier.
  @override
  bool get barrierDismissible => true;

  /// The semantics label for the barrier. This is necessary since the user
  /// can interact with the barrier to pop the route.
  @override
  String get barrierLabel => 'Dismiss route';

  /// We don't animate the transition of this simple route.
  @override
  Duration get transitionDuration => Duration.zero;

  /// This is the bounding [Rect] of the anchor in the coordinate space of
  /// this route.
  late Rect _anchorRect;

  void _updateAnchorRect() {
    // [setState] is necessary to trigger a rebuild of [buildTransitions],
    // where [_anchorRect] is used.
    // [setState] and [buildTransitions] are analogous to [State.setState]
    // and [State.build].
    setState(() {
      _anchorRect = getAnchorRectInNavigator(
        anchor.findRenderObject(),
        navigator!.context.findRenderObject(),
      );
    });
  }

  /// This method comes from mixing in [WidgetsBindingObserver] and is
  /// overridden to handle changes of the screen size, since these changes
  /// can affect the layout of [anchor]. Try it out by resizing the window or
  /// rotating the screen.
  @override
  void didChangeMetrics() {
    _updateAnchorRect();
  }

  @override
  TickerFuture didPush() {
    // This starts notifications of [didChangeMetrics].
    WidgetsBinding.instance?.addObserver(this);
    // This ensures that [_anchorRect] is up to date when this route is pushed.
    _updateAnchorRect();
    return super.didPush();
  }

//   @override
//   bool didPop(T? result) {
//  WidgetsBinding.instance?.removeObserver(this);
//     return super.didPop(result);
//   }

  @override
  bool didPop(T? result) {
    // This stops notifications of [didChangeMetrics].
    WidgetsBinding.instance?.removeObserver(this);
    // A route which does not need to react to screen size changes could
    // update [_anchorRect] here, just before the pop transition, and avoid
    // dealing with WidgetsBindingObserver.
    // _updateAnchorRect();
    return super.didPop(result);
  }

  /// This method is only used to build the route content, in this case
  /// [overlay].
  /// [_anchorRect] cannot be used here because this method is not triggered
  /// by [setState].
  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return overlay(context);
  }

  /// This method is the right place to do all the complex stuff, like
  /// positioning the route content, decorating it or implementing
  /// transition effects.
  /// [Navigator] stacks all its routes in an [Overlay].
  /// We use a [Stack] to position [overlay] in the [OverlayEntry] of this
  /// route.
  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return Stack(
      children: [
        Positioned.fromRect(
          rect: _anchorRect,
          child: child,
        ),
      ],
    );
  }
}

*/
