import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovepet/src/views/app/order/order_tab_bloc.dart';
import '../../../util/button.dart';
import '/src/views/constants.dart';

class CheckoutErrorScreen extends StatefulWidget {
  const CheckoutErrorScreen({super.key});

  @override
  State<CheckoutErrorScreen> createState() => _CheckoutErrorScreenState();
}

class _CheckoutErrorScreenState extends State<CheckoutErrorScreen> {
  final OrderTabBloc orderTabBloc = OrderTabBloc();

  @override
  Widget build(BuildContext context) {
    const String kDefaultText =
        "Đã có lỗi xảy ra trong quá trình thanh toán, vui lòng liên hệ quản trị viên để được hỗ trợ!";
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(kDefaultPadding / 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: kErrorColor,
              size: 120,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width - kDefaultPadding * 2,
              child: Text(
                kDefaultText,
                textAlign: TextAlign.center,
                style: GoogleFonts.mulish(
                  fontWeight: FontWeight.w400,
                  color: textColor,
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 15),
            CustomButton(
              onPressed: () => {
                orderTabBloc.add(LoadOrderTabEvent()),
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false)
              },
              width: 200,
              height: 35,
              iconSize: 18,
              icon: CupertinoIcons.home,
              text: "Quay về trang chủ",
              textSize: 13,
            ),
          ],
        ),
      ),
    );
  }
}
