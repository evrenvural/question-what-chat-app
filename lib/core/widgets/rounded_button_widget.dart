import 'package:flutter/material.dart';
import 'package:group_6/core/my_colors.dart';

class RoundedButtonWidget extends StatelessWidget {
  const RoundedButtonWidget(
      {Key key,
      this.toolTip = "",
      this.color = MyColors.BLUE,
      this.text = "Button",
      this.padding,
      @required this.onPressed})
      : super(key: key);

  final String toolTip;
  final Color color;
  final String text;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: toolTip,
      child: OutlineButton(
        borderSide: BorderSide(width: 3, color: color),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        padding: padding,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: color, fontWeight: FontWeight.w900),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
