import 'package:conqr_new/constants/color_constants.dart';
import 'package:conqr_new/utils/text_styles.dart';
import 'package:flutter/material.dart';


Widget commonTextField({
  required TextEditingController controller,
  String? hintText,
  String? labelText,
  Widget? preFixIcon,
  Widget? suffixIcon,
  FocusNode? focusNode,
  TextInputType keyboardType = TextInputType.text,
  int maxLength = 50,
  double elevation = 0.0,
  int maxLines = 1,
  bool enabled = true,
  bool obscure = false,
  bool isShowElevation = true,
  bool readOnly = false,
  TextInputAction textInputAction = TextInputAction.none,
  Color filledColor = kColorWhite,
  Color textFieldBorderColor = kColorGrey,
  Function? validator,
  Function? onChanged,
  TextStyle? hintTextStyle,
  TextStyle? labelTextStyle,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    onChanged: (v) => onChanged != null ? onChanged(v) : print(''),
    textInputAction: textInputAction,
    maxLength: maxLength,
    maxLines: maxLines,
    enabled: enabled,
    obscureText: obscure,
    readOnly: readOnly,
    //autofocus: true,
    focusNode: focusNode,
    validator: (v) => validator!(v),
    cursorColor: kColorPrimary,
    decoration: InputDecoration(
      fillColor: filledColor,
      filled: true,
      hintText: hintText ?? "",
      hintStyle: hintTextStyle??TextStyles.kPrimaryBoldPoppins(),
      // labelText: labelText ?? "",
      // labelStyle: labelTextStyle ?? TextStyles.kPrimaryBoldPoppins(),
      prefixIcon: preFixIcon,
      suffixIcon: suffixIcon,
      counterText: '',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: textFieldBorderColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: textFieldBorderColor, width: 1)),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: textFieldBorderColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: textFieldBorderColor, width: 1),
      ),
    ),
  );
}
