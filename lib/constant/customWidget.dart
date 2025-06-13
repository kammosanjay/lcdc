import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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
                borderSide: BorderSide(color: Colors.transparent),
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
            borderSide: BorderSide(color: Colors.transparent),
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

  // static Widget customDropdownField<T>({
  //   required BuildContext context,
  //   required List<T> items,
  //   required T? selectedItem,
  //   required ValueChanged<T?> onChanged,
  //   String? hint,
  //   Widget? icon,
  //   Color? iconColor,
  //   Widget? suffixIcon,
  //   double? width,
  //   FocusNode? focusNode,
  //   AutovalidateMode? autovalidateMode,
  //   String? Function(T?)? validate,
  // }) {
  //   return DropdownButtonFormField2<T>(
  //     value: selectedItem,
  //     isExpanded: true,
  //     focusNode: focusNode,
  //     validator: validate,
  //     autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
  //     decoration: InputDecoration(
  //       contentPadding: EdgeInsets.zero,
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(10),
  //         borderSide: BorderSide.none,
  //       ),
  //     ),
  //     buttonStyleData: ButtonStyleData(
  //       height: 60,
  //       padding: const EdgeInsets.symmetric(horizontal: 10),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(color: Colors.transparent),
  //       ),
  //     ),
  //     iconStyleData: IconStyleData(
  //       icon: suffixIcon ?? const Icon(Icons.keyboard_arrow_down),
  //       iconEnabledColor: iconColor ?? Colors.black,
  //     ),
  //     dropdownStyleData: DropdownStyleData(
  //       maxHeight: 200,
  //       width: width ?? MediaQuery.of(context).size.width * 0.9,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         color: Colors.white,
  //       ),
  //     ),
  //     hint: Row(
  //       children: [
  //         if (icon != null) ...[icon, const SizedBox(width: 8)],
  //         Text(hint ?? '', style: const TextStyle(fontSize: 14)),
  //       ],
  //     ),

  //     // 🔥 This ensures icon is shown even when value is selected
  //     selectedItemBuilder: (BuildContext context) {
  //       return items.map((T item) {
  //         return Row(
  //           children: [
  //             if (icon != null) ...[
  //               const SizedBox(width: 0),
  //               icon,
  //               SizedBox(width: 10),
  //               Text(item.toString(), style: const TextStyle(fontSize: 14)),
  //             ],
  //           ],
  //         );
  //       }).toList();
  //     },

  //     items:
  //         items.map((T value) {
  //           return DropdownMenuItem<T>(
  //             value: value,
  //             child: Text(value.toString()),
  //           );
  //         }).toList(),

  //     onChanged: onChanged,
  //   );
  // }

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

  ///
  ///
  static Widget customTextFieldupdate({
    required BuildContext context,
    required String? errorText,
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
    bool isPassword = false,
    Color? iconColor,
    Widget? suffIcons,
    TextInputAction? action,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            keyboardType: keyboardtype,
            maxLength: maxLength,
            maxLines: maxLines ?? 1,
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            textInputAction: action,
            onTap: () {
              if (onTap != null) {
                onTap();
              }
            },
            obscureText: isPassword,
            decoration: InputDecoration(
              counterText: '',
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
              border: InputBorder.none,
            ),
          ),
        ),

        // 🛑 Custom error message outside card
        if (errorText != null && errorText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 8),
            child: Text(
              errorText,
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}
