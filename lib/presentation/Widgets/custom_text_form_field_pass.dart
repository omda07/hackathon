import 'package:flutter/material.dart';
import 'package:marathon/presentation/resources/color_manager.dart';

class CustomTextFormFieldsPass extends StatefulWidget {
  TextEditingController controller;
  String myLabelText;
  IconData? prefixIcon;
  bool canObscure = false;
  Function? onPressed;
  TextInputAction? status;
  TextInputType type = TextInputType.text;
  String? Function(String?)? validate;

  CustomTextFormFieldsPass({Key? key,
    required this.controller,
    required this.myLabelText,
    this.prefixIcon,
    this.canObscure = false,
    this.onPressed,
    this.status,
    this.type = TextInputType.text,
    this.validate,
  }) : super(key: key);

  @override
  State<CustomTextFormFieldsPass> createState() =>
      _CustomTextFormFieldsPassState();
}

class _CustomTextFormFieldsPassState extends State<CustomTextFormFieldsPass> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.type,
      controller: widget.controller,
      validator: (value) {
        return widget.validate!(value);
      },
      obscureText: widget.canObscure,
      textInputAction: widget.status ?? TextInputAction.done,
      decoration: InputDecoration(
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
        focusedErrorBorder:
            Theme.of(context).inputDecorationTheme.focusedErrorBorder,
        contentPadding: Theme.of(context).inputDecorationTheme.contentPadding,
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
        errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
        prefixIcon: Icon(
          widget.prefixIcon,
          color: ColorManager.primary,
        ),
        suffixIcon: IconButton(
          splashColor: ColorManager.primary,
          icon: !widget.canObscure
              ? Icon(
                  Icons.remove_red_eye,
                  color: ColorManager.primary,
                )
              : Icon(
                  Icons.visibility_off_rounded,
                  color: ColorManager.grey,
                ),
          onPressed: () {
            setState(() {
              widget.canObscure = !widget.canObscure;
            });
          },
        ),
        labelText: widget.myLabelText,
      ),
    );
  }
}
