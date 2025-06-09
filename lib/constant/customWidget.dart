import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomWidgets {
  ///TextFeild Widget

  static Widget customTextFeild({
    required BuildContext context, // Pass BuildContext as a parameter
    String? name,
    String? hint,
    TextEditingController? controller,
    FocusNode? focusNode,
    Widget? icon,
    double? width,
    AutovalidateMode? autovalidateMode,
    int? maxLines,
    int? maxLength,
    Color? color,
    double? height,
    TextInputType? keyboardtype,
    Function? onTap,
    var validate,
    bool isPassword = false,
    Color? iconColor,
    Widget? suffIcons,
    TextInputAction? action,
  }) {
    return Column(
      children: [
        Card(
          color: Colors.white,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          elevation: 5,
          child: TextFormField(
            focusNode: focusNode,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: keyboardtype,
            validator: validate,

            maxLength: maxLength,
            maxLines: maxLines ?? 1,
            controller: controller ?? TextEditingController(),
            textAlignVertical: TextAlignVertical.center,
            textInputAction: action,

            onTap: () {
              if (onTap != null) {
                onTap();
              }
            },
            obscureText: isPassword,
            decoration: InputDecoration(
              suffixIcon: suffIcons,

              prefixIcon: icon,
              prefixIconColor: iconColor,

              hintText: hint,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueAccent.withOpacity(0.5),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // custom dropdown widget
  static Widget customDropdownField<T>({
    required BuildContext context,
    required List<T> items,
    required T? selectedItem,
    required ValueChanged<T?> onChanged,

    String? hint,
    Color? color,
    Widget? icon,
    Color? iconColor,
    Widget? suffixIcon,
    double? width,
    FocusNode? focusNode,
    AutovalidateMode? autovalidateMode,
    var validate,
  }) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      elevation: 5,
      child: DropdownButtonFormField<T>(
        value: selectedItem,
        isExpanded: true,
        focusNode: focusNode,
        validator: validate,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        icon: suffixIcon,
        decoration: InputDecoration(
          prefixIcon: icon,
          prefixIconColor: iconColor,
          constraints: BoxConstraints(
            maxHeight: 60,

            maxWidth: width ?? MediaQuery.of(context).size.width,
          ),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent.withOpacity(0.5)),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        items:
            items.map((T value) {
              return DropdownMenuItem<T>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  ///Button Widget

  static Widget customButton({
    required BuildContext context, // Pass BuildContext as a parameter
    String? buttonName,
    Function? onPressed,
  }) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: () {
        onPressed!();
      },
      child: Text(buttonName!, style: TextStyle(fontSize: 20)),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(w, h * 0.07), // Width: 200, Height: 50
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Set border radius
        ), // Button color
      ),
    );
  }
}
