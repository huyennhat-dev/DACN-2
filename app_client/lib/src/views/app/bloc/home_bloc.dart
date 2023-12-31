import '/src/model/product.dart';
import '/src/repo/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class HomeListProductEvent {}

class GetRecommendProduct extends HomeListProductEvent {}

class HomeListProductState {
  final List<Product> products;
  final bool isLoading;

  HomeListProductState({
    List<Product>? products,
    bool? isLoading,
  })  : products = products ?? [],
        isLoading = isLoading ?? false;

  HomeListProductState copyWith({
    List<Product>? products,
    bool? isLoading,
  }) {
    return HomeListProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class HomeListProductBloc
    extends Bloc<HomeListProductEvent, HomeListProductState> {
  HomeListProductBloc() : super(HomeListProductState()) {
    on<GetRecommendProduct>((event, emit) => _getRecommendProduct(emit));
  }
  Future<void> _getRecommendProduct(Emitter<HomeListProductState> emit) async {
    try {
      emit(HomeListProductState(isLoading: true));

      final rs = await HomeRepo.getRecommendProduct();
      final data = rs.data["products"];

      final List<Product> products = data.map<Product>((item) {
        final sale = item['sale'].toDouble();
        final star = item['star'].toDouble();

        return Product.fromJson({
          "_id": item['_id'],
          "name": item['name'],
          "photos": item['photos'],
          "author": item['author'],
          "price": item['price'],
          "quantity": item['quantity'],
          "purchases": item['purchases'],
          "sale": sale,
          "star": star,
          "description": item['description']
        });
      }).toList();
      emit(HomeListProductState(products: products, isLoading: false));
    } catch (e) {
      throw Exception(e);
    }
  }
}
