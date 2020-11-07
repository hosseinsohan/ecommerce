import 'package:flutter/material.dart';
import 'package:mercikala/src/utils/math_helper.dart';
import 'package:mercikala/src/utils/matrix.dart';
import 'package:transformer_page_view/transformer_page_view.dart';



class CustomPageTransformer extends PageTransformer {
  @override
  Widget transform(Widget child, TransformInfo info) {
    final transform = Matrix.perspective();
    final position = info.position;
    final pageDt = 1 - position.abs();

    if (position > 0) {
      transform
        ..scale(MathHelper.lerp(0.6, 1.0, pageDt))
        ..rotateY(position * -1.5);
    } else {
      transform
        ..scale(MathHelper.lerp(0.6, 1.0, pageDt))
        ..rotateY(position * 1.5);
    }

    return Transform(
      alignment: Alignment.center,
      transform: transform,
      child: child,
    );
  }
}
