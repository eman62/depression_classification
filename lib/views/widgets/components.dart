import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

showYesNoDialog({
  String headerString = 'Header Message',
  String message = 'Body Message?',
  Color headerTextColor = Colors.blue,
  Color messageTextColor = Colors.grey,
  Color yesButtonFillColor = Colors.green,
  Color noButtonFillColor = Colors.red,
  Color yesTextColor = Colors.white,
  Color noTextColor = Colors.white,
  BoxBorder? yesButtonBorder,
  BoxBorder? noButtonBorder,
  Function()? yesFunction,
  Function()? noFunction,
}) {
  return Get.dialog(
    /// Dark Grey Background
    Container(
      alignment: Alignment.center,
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6), // dark grey
      ),

      /// Dialog White Container
      child: SizedBox(
        height: 309,
        // height: Get.height,
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Header
                Text(
                  headerString,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: headerTextColor,
                  ),
                ),

                const SizedBox(height: 16),

                /// Message
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'cairo',
                    // fontWeight: FontWeight.bold,
                    color: messageTextColor,
                  ),
                ),

                const SizedBox(height: 24),

                /// Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Yes
                    Expanded(
                      child: GestureDetector(
                        onTap: yesFunction,
                        child: Container(
                          alignment: Alignment.center,
                          height: 48,
                          decoration: BoxDecoration(
                            color: yesButtonFillColor,
                            borderRadius: BorderRadius.circular(7),
                            border: yesButtonBorder,
                          ),
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: yesTextColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 33),

                    /// No
                    Expanded(
                      child: GestureDetector(
                        onTap: noFunction,
                        child: Container(
                          alignment: Alignment.center,
                          height: 48,
                          decoration: BoxDecoration(
                            color: noButtonFillColor,
                            borderRadius: BorderRadius.circular(7),
                            border: noButtonBorder,
                          ),
                          child: Text(
                            'No',
                            style: TextStyle(
                              color: noTextColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

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
