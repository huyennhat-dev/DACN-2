import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lovepet/src/views/app/order/order_tab_bloc.dart';

import '../../../util/behavior.dart';
import '../bloc/home_bloc.dart';
import 'component/carousel/carousel.dart';
import '../component/header.dart';
import 'component/list_products/list_products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeListProductBloc homeListProductBloc = HomeListProductBloc();
  final OrderTabBloc orderTabBloc = OrderTabBloc();

  @override
  void initState() {
    getRecommendProduct();
    super.initState();
  }

  Future<void> getRecommendProduct() async {
    homeListProductBloc.add(GetRecommendProduct());
  }

  Future<void> getOrderData() async {
    orderTabBloc.add(LoadOrderTabEvent());
  }

  Future<void> _onRefresh() async {
    await getRecommendProduct();
    await getOrderData();
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
      child: BlocProvider(
        create: (context) => homeListProductBloc,
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: Colors.white,
                  flexibleSpace: AppHeader(
                      actionLeft: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo_2.png'),
                          fit: BoxFit.fitWidth),
                    ),
                  )),
                  automaticallyImplyLeading: false,
                  actions: [Container()],
                ),
                const SliverPadding(
                  padding: EdgeInsets.only(top: 10),
                  sliver: SliverToBoxAdapter(
                    child: AppCarousel(),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  sliver: SliverToBoxAdapter(
                    child:
                        BlocBuilder<HomeListProductBloc, HomeListProductState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.width,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else {
                          return Products(
                            title: "Sản phẩm bán chạy",
                            products: state.products,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
