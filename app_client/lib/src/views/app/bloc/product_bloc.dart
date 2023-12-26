import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lovepet/src/model/rate.dart';

import '../../../model/product.dart';
import '../../../model/user.dart';
import '../../../repo/product.dart';

abstract class ProductEvent {}

class GetProduct extends ProductEvent {
  final String pId;

  GetProduct({required this.pId});
}

class ProductState {
  final Product product;
  ProductState({required this.product});
}

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState(product: Product())) {
    on<GetProduct>((event, emit) => _getProduct(emit, event));
  }

  Future<void> _getProduct(Emitter<ProductState> emit, GetProduct event) async {
    try {
      final rs = await ProductRepo.getProduct(event.pId);
      final data = rs.data["product"];
      final sale = data['sale'].toDouble();
      final star = data['star'].toDouble();
      final photos = List<String>.from(
          data['photos']?.map((photo) => photo.toString()) ?? []);
      List<Rate> rates = [];
      if (data['rates'] is List<dynamic>) {
        rates = (data['rates'] as List<dynamic>).map((rateData) {
          return Rate(
            sId: rateData['_id'],
            user: User(
              name: rateData['user']['name'],
              photo: rateData['user']['photo'],
            ),
            product: rateData['product'],
            star: rateData['star'],
            content: rateData['content'],
            createdAt: rateData['createdAt'],
            updatedAt: rateData['updatedAt'],
          );
        }).toList();
      }
      final Map<String, dynamic>? categoriesData = data['categories'];

      emit(ProductState(
          product: Product(
              sId: data['_id'],
              name: data['name'],
              photos: photos,
              author: data['author'],
              price: data['price'],
              quantity: data['quantity'],
              purchases: data['purchases'],
              categories: Categories(
                sId: categoriesData!['_id'],
                name: categoriesData['name'],
                slug: categoriesData['slug'],
              ),
              sale: sale,
              star: star,
              rates: rates,
              description: data['description'])));
    } catch (e) {
      throw Exception(e);
    }
  }
}
