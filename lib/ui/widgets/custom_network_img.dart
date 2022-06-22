import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNetworkImg extends StatelessWidget {
  final String url;
  double? h;
  double? w;
  Color? progressIndicatorClr;
  double? progressIndicatorStrokeW;
  Color? errorImgClr;
  double? errorImgH;
  CustomNetworkImg({
    Key? key,
    required this.url,
    this.h,
    this.w,
    this.progressIndicatorClr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      height: h,
      width: w,
      loadingBuilder: (context, child, progress) => progress == null
          ? child
          : Center(
              child: CircularProgressIndicator(
                color: progressIndicatorClr ?? Colors.blue,
                strokeWidth: progressIndicatorStrokeW ?? 4.w,
                value: progress.expectedTotalBytes != null
                    ? progress.cumulativeBytesLoaded /
                        progress.expectedTotalBytes!
                    : null,
              ),
            ),
      errorBuilder: ((context, error, stackTrace) {
        return Icon(
          Icons.image,
          size: errorImgH ?? 24.h,
          color: errorImgClr ?? Colors.grey,
        );
      }),
    );
  }
}
