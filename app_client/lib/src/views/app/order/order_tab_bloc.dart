import '/src/model/order.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/cart.dart';
import '../../../model/orderStatus.dart';
import '../../../model/product.dart';
import '../../../repo/cart.dart';

abstract class OrderTabEvent {}

class ChangeTabEvent extends OrderTabEvent {
  final int selectTabIndex;
  ChangeTabEvent({required this.selectTabIndex});
}

class LoadOrderTabEvent extends OrderTabEvent {}

class OrderTabState {
  final List<Order>? orders;
  final List<OrderStatus>? orderStatus;
  final int? selectTabIndex;

  OrderTabState({this.selectTabIndex, this.orders, this.orderStatus});

  OrderTabState copyWith({
    List<Order>? orders,
    List<OrderStatus>? orderStatus,
    int? selectTabIndex,
  }) {
    return OrderTabState(
      orders: orders ?? this.orders,
      orderStatus: orderStatus ?? this.orderStatus,
      selectTabIndex: selectTabIndex ?? this.selectTabIndex,
    );
  }
}

class OrderTabBloc extends Bloc<OrderTabEvent, OrderTabState> {
  OrderTabBloc()
      : super(OrderTabState(selectTabIndex: 0, orders: [], orderStatus: [])) {
    on<LoadOrderTabEvent>((event, emit) => _loadData(emit));
    on<ChangeTabEvent>((event, emit) {
      final OrderTabState currentState = state;
      emit(currentState.copyWith(selectTabIndex: event.selectTabIndex));
    });
  }

  _loadData(Emitter<OrderTabState> emit) async {
    try {
      final response = await CartRepo.getOrderData();
      final data = response.data;
      final List<OrderStatus> orderStatus =
          data['orderStatus'].map<OrderStatus>((item) {
        return OrderStatus(
            sId: item['_id'], name: item['name'], slug: item['slug']);
      }).toList();

      final List<Order> orders = data['orders'].map<Order>((item) {
        final List<Products> products = item['products'].map<Products>((pro) {
          final data = pro['product'];
          final sale = data['sale'].toDouble();
          final star = data['star'].toDouble();
          final photos = List<String>.from(
              data['photos']?.map((photo) => photo.toString()) ?? []);
          final product = Product(
              sId: data['_id'],
              name: data['name'],
              photos: photos,
              author: data['author'],
              price: data['price'],
              quantity: data['quantity'],
              purchases: data['purchases'],
              sale: sale,
              star: star,
              description: data['description']);
          return Products(
              product: product,
              quantity: pro['quantity'],
              price: pro['price'],
              sId: pro['_id']);
        }).toList();
        return Order(
            products: products,
            createdAt: item['createdAt'],
            paymentMethod: item['paymentMethod'],
            sId: item['_id'],
            totalPrice: item['totalPrice'],
            user: item['user'],
            orderStatus: OrderStatus(
              name: item['orderStatus']['name'],
              sId: item['orderStatus']['_id'],
              slug: item['orderStatus']['slug'],
            ));
      }).toList();

      emit(OrderTabState(
        orderStatus: orderStatus,
        orders: orders,
      ));
    } catch (e) {
      throw Exception(e);
    }
  }
}
