import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ListExtension on int {
  toGrid(
          {int? length,
          NullableIndexedWidgetBuilder? builder,
          BuildContext? context}) =>
      GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(4.sp),
        itemCount: length!,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: MediaQuery.of(context!).size.width / 1.7),
        itemBuilder: builder!,
      );
}
