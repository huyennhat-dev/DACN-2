import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '/src/model/rate.dart';
import '/src/views/constants.dart';

class ProductEvaluate extends StatefulWidget {
  const ProductEvaluate({super.key, this.data});

  final List<Rate>? data;

  @override
  State<ProductEvaluate> createState() => _ProductEvaluateState();
}

class _ProductEvaluateState extends State<ProductEvaluate> {
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
            "Đánh giá của khách hàng",
            style: GoogleFonts.openSans(
                fontSize: 20, fontWeight: FontWeight.w600, color: textColor),
          ),
          Container(
              padding: const EdgeInsets.only(top: kDefaultPadding / 2),
              child: Column(
                children: widget.data
                        ?.map((item) => evaluateItem(size, item))
                        .toList() ??
                    [],
              ))
        ],
      ),
    );
  }

  Widget evaluateItem(Size size, Rate data) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(kDefaultPadding / 4),
            child: CachedNetworkImage(
              imageUrl: data.user!.photo!,
              height: size.width / 10,
              width: size.width / 10,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Container(
                alignment: Alignment.center,
                child: const Icon(Icons.error, color: kErrorColor),
              ),
            ),
          ),
          const SizedBox(width: kDefaultPadding / 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width: size.width - kDefaultPadding * 3.5 - (size.width / 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        data.user!.name!,
                        style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: textColor),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.check_circle,
                        color: kSuccessColor,
                        size: 14,
                      ),
                      Text(
                        "Đã mua hàng",
                        style: GoogleFonts.openSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: kSuccessColor),
                      ),
                    ],
                  )),
              const SizedBox(height: 2),
              RatingBarIndicator(
                  rating: data.star!.toDouble(),
                  itemBuilder: (context, index) =>
                      const Icon(Icons.star, color: Colors.amber),
                  itemCount: 5,
                  itemSize: 14,
                  itemPadding: const EdgeInsets.only(right: 2),
                  direction: Axis.horizontal),
              const SizedBox(height: 2),
              SizedBox(
                width: size.width - kDefaultPadding * 3.5 - (size.width / 10),
                child: Text(
                  data.content!,
                  style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: textColor.withOpacity(0.9)),
                ),
              ),
              const SizedBox(height: 2),
              Container(
                alignment: Alignment.bottomRight,
                width: size.width - kDefaultPadding * 3.5 - (size.width / 10),
                child: Text(
                  "Đánh giá vào ${DateFormat('MM-dd-yyyy').format(DateTime.parse(data.createdAt!))}",
                  style: GoogleFonts.openSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: textColor.withOpacity(0.7)),
                ),
              ),
            ],
          )
        ],
      );
}
