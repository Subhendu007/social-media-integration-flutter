import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final ButtonStyle style;
  final EdgeInsetsGeometry margin;

  const SignInButton({
    Key key,
    this.child,
    this.onPressed,
    this.height,
    this.width,
    this.style,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: child,
      ),
    );
  }
}
