import 'package:flutter/material.dart';
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

  /// required Function validate,
  required String? Function(String?) validate,
///////  Function ? onsubmit,
  required String label,
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
        labelText: label,
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
        prefixIcon: Icon(
          prefix,
          color: Colors.green,
        ),
        // fillColor: Colors.grey[100],
        //    filled: true,
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
      'Error',
      text,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      colorText: Colors.lightGreenAccent,
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

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );