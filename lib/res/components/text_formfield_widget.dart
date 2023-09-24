import 'package:news_app/res/fonts/fonts.dart';
import 'package:news_app/view/view_barrel_file.dart';

class TextFormFieldWidget extends StatelessWidget {
  String hintText;
  Widget suffixIconWidget;
  bool showSuffixIcon;
  bool obscureText;
  TextEditingController controller;
  FocusNode focusNode;
  TextInputType keyboardType;
  final FormFieldSetter onFiledSubmittedValue;
  TextFormFieldWidget({
    super.key,
    required this.hintText,
    this.suffixIconWidget = const SizedBox(),
    this.keyboardType = TextInputType.text,
    this.showSuffixIcon = false,
    this.obscureText = false,
    required this.controller,
    required this.focusNode,
    required this.onFiledSubmittedValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onFiledSubmittedValue,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: AppColors.textfieldFilledColor,
        hintText: hintText,
        suffixIcon: showSuffixIcon ? suffixIconWidget : SizedBox(),
        hintStyle: TextStyle(
            fontSize: 14,
            fontFamily: AppFonts.pangramSansCompactRegular,
            color: AppColors.secondaryTextdarkColor,
            fontWeight: FontWeight.w700,
            height: 0),
        contentPadding: EdgeInsets.all(12),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide:
                BorderSide(color: AppColors.textfieldFilledColor, width: 0)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide:
                BorderSide(color: AppColors.textfieldFilledColor, width: 0)),
      ),
    );
  }
}
