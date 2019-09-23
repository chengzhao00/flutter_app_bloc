import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/res/colors.dart';

/// 文字style

class TextStyles {
  static TextStyle listTitle = TextStyle(
      fontSize: 16, color: BlocColors.text_dark, fontWeight: FontWeight.bold);

  static TextStyle listContent =
      TextStyle(fontSize: 14, color: BlocColors.text_normal);

  static TextStyle listAuthor =
      TextStyle(fontSize: 14, color: BlocColors.text_normal);
}

/// 间距 垂直间距和水平间距
class Gaps {
  static Widget heightSpace = SizedBox(
    height: 10,
  );

  static Widget widthSpace = SizedBox(
    width: 10,
  );
}
