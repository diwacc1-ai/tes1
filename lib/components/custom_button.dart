import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
	const CustomButton({
		super.key,
		required this.text,
		required this.onPressed,
		this.width,
		this.height,
		this.backgroundColor,
		this.foregroundColor,
		this.padding,
		this.borderRadius,
		this.textStyle,
	});

	final String text;
	final VoidCallback? onPressed;
	final double? width;
	final double? height;
	final Color? backgroundColor;
	final Color? foregroundColor;
	final EdgeInsetsGeometry? padding;
	final BorderRadius? borderRadius;
	final TextStyle? textStyle;

	@override
	Widget build(BuildContext context) {
		return SizedBox(
			width: width,
			height: height,
			child: ElevatedButton(
				onPressed: onPressed,
				style: ElevatedButton.styleFrom(
					backgroundColor: backgroundColor,
					foregroundColor: foregroundColor,
					padding: padding,
					shape: RoundedRectangleBorder(
						borderRadius: borderRadius ?? BorderRadius.circular(8),
					),
				),
				child: Text(text, style: textStyle),
			),
		);
	}
}