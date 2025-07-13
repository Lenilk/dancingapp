import 'package:danceteaching/components/general_text.dart';
import 'package:danceteaching/utils/navitor_utils.dart';
import 'package:flutter/material.dart';

Widget goBackButton(VoidCallback? fn, String text, BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      if (fn != null) {
        fn();
      }
      goBack(context);
    },
    child: GeneralText(data: text),
  );
}
