import 'package:flutter/material.dart';
import '/src/views/app/order/order_tab_bloc.dart';

import '../component/header.dart';
import 'order_body.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final OrderTabBloc orderTabBloc = OrderTabBloc();
  @override
  void initState() {
    getTabOrderData();
    super.initState();
  }

  Future<void> getTabOrderData() async {
    orderTabBloc.add(LoadOrderTabEvent());
  }

  @override
  void dispose() {
    super.dispose();
    orderTabBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          AppHeader(
              actionLeft: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/logo_2.png'),
                  fit: BoxFit.cover),
            ),
          )),
          const SizedBox(height: 10),
          const OrderBody()
        ],
      ),
    );
  }
}
