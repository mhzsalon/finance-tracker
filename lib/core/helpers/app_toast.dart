import 'package:fluttertoast/fluttertoast.dart';
import 'package:universalexpensetracker/core/theme/app_colors.dart';

void showAppToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: AppColors.inputField,
    textColor: AppColors.white,
    fontSize: 16.0,
  );
}




