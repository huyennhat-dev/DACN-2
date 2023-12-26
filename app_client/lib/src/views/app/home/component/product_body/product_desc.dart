import 'package:flutter_html/flutter_html.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants.dart';

class ProductDetailDesc extends StatelessWidget {
  const ProductDetailDesc({super.key, this.desc});

  final String? desc;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width - kDefaultPadding,
      padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding / 1, horizontal: kDefaultPadding * 1),
      margin: const EdgeInsets.only(
        bottom: kDefaultPadding / 1,
        left: kDefaultPadding / 2,
        right: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kDefaultPadding / 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Giới thiệu về sản phẩm",
            style: GoogleFonts.openSans(
                fontSize: 20, fontWeight: FontWeight.w600, color: textColor),
          ),
          Html(
            data: desc,
            style: {
              "body": Style(
                  fontSize: const FontSize(14.0),
                  fontWeight: FontWeight.w300,
                  fontFamily: 'OpenSans',
                  color: textColor,
                  wordSpacing: 2)
            },
          ),
        ],
      ),
    );
  }
}
