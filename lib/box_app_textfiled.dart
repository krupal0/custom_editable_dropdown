import 'package:custom_editable_dropdown_menu/app_colors.dart';
import 'package:custom_editable_dropdown_menu/app_dimens.dart';
import 'package:custom_editable_dropdown_menu/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BoxAppTextFiled extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FocusNode? focusNode;
  bool? obscureText;
  final bool? isPassword;
  final bool? isEnable;
  FloatingLabelBehavior? floatingLabelBehavior;
  final TextStyle? labelStyle;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChange;
  final String? initialValue;
  final int maxLine;
  final bool? changeBackGroundDisable;
  final bool? labelVisible;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final Function()? onTap;
  final bool? interactionEnabled;
  final bool isDropDown;
  final bool isSearchBox;
  final bool isReadOnly;
  final int? minLine;
  final List<FilteringTextInputFormatter>? textInputFormatter;
  final InputBorder? focusBorder;
  final Color focusBorderColor;
  final Function()? onEditingComplete;
  final MouseCursor? mouseCursor;
  final bool canRequestFocus;

  BoxAppTextFiled({
    Key? key,
    this.labelText,
    this.hintText,
    this.controller,
    this.validator,
    this.onFieldSubmitted,
    this.onSaved,
    this.focusNode,
    this.obscureText,
    this.isPassword = false,
    this.isEnable = true,
    this.labelVisible = true,
    this.floatingLabelBehavior,
    this.labelStyle,
    this.keyboardType,
    this.onChange,
    this.initialValue,
    this.maxLine = 1,
    this.minLine = 1,
    this.changeBackGroundDisable = true,
    this.contentPadding,
    this.textInputAction,
    this.onTap,
    this.interactionEnabled,
    this.textInputFormatter,
    this.isDropDown = false,
    this.isSearchBox = false,
    this.isReadOnly = false,
    this.focusBorder,
    this.focusBorderColor = AppColors.primaryColor,
    this.onEditingComplete,
    this.mouseCursor,
    this.canRequestFocus = true,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => BoxAppTextFiledState();
}

class BoxAppTextFiledState extends State<BoxAppTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.labelVisible ?? true,
          child: Text(
            widget.labelText ?? "",
            style: textStyleAsapRegular(),
          ),
        ),
        Visibility(
          visible: widget.labelVisible ?? true,
          child: const SizedBox(
            height: AppDimens.spacingXSmall,
          ),
        ),
        TextFormField(
          controller: widget.controller,
          initialValue: widget.initialValue,
          enabled: widget.isEnable,
          inputFormatters: widget.textInputFormatter ?? [],
          textCapitalization: TextCapitalization.sentences,
          style: textStyleAsapRegular(
            fontSize: AppDimens.fontMedium1sp,
          ),
          keyboardType: widget.keyboardType ?? TextInputType.text,
          maxLines: widget.maxLine,
          minLines: widget.minLine,
          textInputAction: widget.textInputAction ?? TextInputAction.done,
          onTap: widget.onTap ?? () {},
          enableInteractiveSelection: widget.interactionEnabled ?? true,
          decoration: InputDecoration(
              fillColor: (widget.changeBackGroundDisable ?? true)
                  ? AppColors.whiteColor
                  : Colors.transparent,
              filled: !(widget.isEnable ?? true),
              contentPadding: widget.contentPadding ??
                  EdgeInsets.symmetric(
                      horizontal: AppDimens.widthSpacingSmall,
                      vertical: AppDimens.heightSpacingMedium),
              floatingLabelBehavior:
                  widget.floatingLabelBehavior ?? FloatingLabelBehavior.auto,
              hintText: widget.hintText,
              hintStyle: textStyleAsapRegular(
                  fontSize: AppDimens.fontMedium1sp,
                  color: AppColors.greyColor),
              labelStyle: widget.labelStyle ??
                  textStyleAsapSemiBold(
                      color: AppColors.primaryColor,
                      fontSize: AppDimens.fontMedium1sp),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.lightGreyColor),
              ),
              focusedBorder: widget.focusBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: widget.focusBorderColor),
                  ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.blackColor),
              ),
              suffixIcon: widget.isPassword == true
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          if (widget.obscureText == true) {
                            widget.obscureText = false;
                          } else {
                            widget.obscureText = true;
                          }
                        });
                      },
                      child: widget.obscureText == true
                          ? Image.asset(
                              "assets/images/password_hide.png",
                              scale: 3,
                            )
                          : Image.asset(
                              "assets/images/show_password.png",
                            ),
                    )
                  : widget.isDropDown
                      ? Image.asset(
                          "assets/images/arrow_down.png",
                          scale: 3,
                        )
                      : widget.isSearchBox
                          ? Image.asset(
                              "assets/images/search.png",
                              scale: 3,
                            )
                          : const SizedBox()),
          obscureText: widget.obscureText ?? false,
          onFieldSubmitted: widget.onFieldSubmitted,
          onSaved: widget.onSaved,
          focusNode: widget.focusNode,
          onChanged: widget.onChange,
          validator: widget.validator,
          readOnly: widget.isReadOnly,
          onEditingComplete: widget.onEditingComplete,
          mouseCursor: widget.mouseCursor,
          canRequestFocus: widget.canRequestFocus,
        ),
      ],
    );
  }
}
