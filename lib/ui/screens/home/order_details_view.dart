import 'package:flutter/material.dart';
import 'package:nearexpiryshopdriver/states/models/order_details/order_details.dart';
import 'package:nearexpiryshopdriver/ui/screens/home/row_item.dart';
import 'package:nearexpiryshopdriver/ui/widgets/custom_network_img.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nearexpiryshopdriver/ui/widgets/helper_widgets.dart';

class OrderDetailsView extends StatelessWidget {
  final OrderDetailsModel oDetailsModel;
  const OrderDetailsView({
    Key? key,
    required this.oDetailsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 63.h,
            width: 63.w,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                width: 1,
                color: Colors.grey.shade300,
              ),
            ),
            // product image
            child: CustomNetworkImg(
              url: oDetailsModel.productImage,
            ),
          ),
          addW(20),
          SizedBox(
            width: 260.w,
            child: Column(
              children: [
                RowItem(
                  prefixTxt: 'Invoice Id:',
                  suffixTxt: oDetailsModel.invoiceId.toString(),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                RowItem(
                  prefixTxt: 'To:',
                  suffixTxt: oDetailsModel.customerViewModel.firstLastName,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                RowItem(
                  prefixTxt: 'Location:',
                  suffixTxt: oDetailsModel
                      .customerViewModel.customerAddressViewModel.address,
                  suffixIcon: 'assets/svg/location.svg',
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                RowItem(
                  prefixTxt: 'Product:',
                  suffixTxt: oDetailsModel.productName,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                RowItem(
                  prefixTxt: 'Schedule Data:',
                  suffixTxt: oDetailsModel.deliveryDate,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                RowItem(
                  prefixTxt: 'Schedule Time:',
                  suffixTxt: oDetailsModel.deliveryDate,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                RowItem(
                  prefixTxt: 'Payment Status:',
                  suffixTxt: oDetailsModel.statusName,
                  suffixTxtClr: Colors.green,
                  suffixIcon: oDetailsModel.paymentStatus == 0
                      ? 'assets/svg/tick.svg'
                      : null,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
