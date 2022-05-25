import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Widget defaultButton({
  required double width,
  required Color background,
  required Function function,
  required String text,
  double radius = 25,
}) =>
    Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Widget? suffix,

  /// required Function validate,
  required String? Function(String?) validate,
///////  Function ? onsubmit,
  required String label,
  required IconData prefix,
  bool isPassword = false,
  IconData? suffixIcon,
  Function? suffixPressed,
  List<TextInputFormatter>? inputFormatters,
}) =>
    TextFormField(
      controller: controller,
      inputFormatters: inputFormatters != null ? inputFormatters : null,
//////onFieldSubmitted: (s){onsubmit!(s);},
//validator: (s){validate();},
      validator: validate,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
// hintText: 'Email Adress',
        filled: true,
        fillColor: Colors.white.withOpacity(.3),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.black87.withOpacity(0.2),
                width: 2),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            )),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.black87.withOpacity(0.2), width: 2),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),

        labelText: label,
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        prefixIcon: Icon(
          prefix,
          color: Colors.green,
        ),
        // fillColor: Colors.grey[100],
        //    filled: true,
        suffix: suffix != null ? suffix : null,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: () {
                  suffixPressed!();
                },
                color: Colors.green,
              )
            : null,
      ),
    );

Widget defaultFormField2({
  required TextEditingController controller,
  required TextInputType type,

  /// required Function validate,
  required String? Function(String?) validate,
///////  Function ? onsubmit,
  required String hint,
  required IconData prefix,
  bool isPassword = false,
  IconData? suffix,
  Function? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
//////onFieldSubmitted: (s){onsubmit!(s);},
//validator: (s){validate();},
      validator: validate,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
// hintText: 'Email Adress',
        hintText: hint,
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        prefixIcon: Icon(
          prefix,
          color: Colors.green,
        ),
        fillColor: Colors.grey[200],
        filled: true,
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: () {
                  suffixPressed!();
                },
                color: Colors.green,
              )
            : null,
      ),
    );

void showToast({required String text, required ToastStates state}) => Get.snackbar(
      chooseToastTitle(state),
      text,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      colorText: Colors.white,
      overlayColor: chooseToastColor(state),
    );
// Fluttertoast.showToast(
// msg: text,
// toastLength: Toast.LENGTH_LONG,
// gravity: ToastGravity.BOTTOM,
// timeInSecForIosWeb: 5,
// backgroundColor: chooseToastColor(state),
// textColor: Colors.white,
// fontSize: 16.0,
//
// );

enum ToastStates { success, error, warning }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
  }
  return color;
}

chooseToastTitle(ToastStates state) {
  String title;
  switch (state) {
    case ToastStates.success:
      title = 'Success!';
      break;
    case ToastStates.error:
      title = 'Error!';
      break;
    case ToastStates.warning:
      title = 'Warning!';
      break;
  }
  return title;
}

void navigateAndFinish(context, widget) => Get.offAll(widget);

Widget defaultTextButton({
  required Function function,
  required String text,
}) =>
    TextButton(
      onPressed: () {
        function();
      },
      child: Text(text.toUpperCase()),
    );
