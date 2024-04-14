import 'package:flutter/material.dart';
import 'dart:math' as math;

class DefaultRoute extends MaterialPageRoute {
  final Widget to;
  DefaultRoute({required this.to}) : super(builder: (context) => to);
}

class ScaleRoute extends PageRouteBuilder {
  final Widget to;
  ScaleRoute({required this.to})
      : super(
            pageBuilder: (
              context,
              animation,
              secondaryAnimation,
            ) =>
                to,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    ScaleTransition(
                      scale: Tween<double>(
                        begin: 0.0,
                        end: 1.0,
                      ).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.fastOutSlowIn,
                        ),
                      ),
                      child: child,
                    ),
            transitionDuration: Duration(milliseconds: 500));
}

class SlideRoute extends PageRouteBuilder {
  final Widget to;
  SlideRoute({required this.to})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              to,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class PageSlideRoute extends PageRouteBuilder {
  final Widget to;
  final Widget from;
  PageSlideRoute({required this.to, required this.from})
      : super(
            transitionDuration: Duration(milliseconds: 600),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return to;
            },
            transitionsBuilder:
                (BuildContext context, animation, secondaryAnimation, child) {
              return Stack(
                children: <Widget>[
                  SlideTransition(
                      position: new Tween<Offset>(
                        begin: const Offset(0.0, 0.0),
                        end: const Offset(-1.0, 0.0),
                      ).animate(CurvedAnimation(
                          parent: animation, curve: Curves.fastOutSlowIn)),
                      child: from),
                  SlideTransition(
                      position: new Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(CurvedAnimation(
                          parent: animation, curve: Curves.fastOutSlowIn)),
                      child: to)
                ],
              );
            });
}

class RotateRoute extends PageRouteBuilder {
  static late AnimationController animationController;
  final Widget from;
  final Widget to;
  RotateRoute({required this.from, required this.to})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return to;
        }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return Stack(children: <Widget>[
            Transform(
              transform: Matrix4.identity()
                ..rotateY(math.pi / 4 * animationController.value),
              alignment: Alignment.centerLeft,
              child: from,
            )
          ]);
        });
}
