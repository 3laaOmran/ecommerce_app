import 'package:ecommerce_app/domain/use_cases/delete_cart_product_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/get_cart_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/update_count_cart_product_use_case.dart';
import 'package:ecommerce_app/features/ui/screens/cart/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/get_cart_response_entity.dart';

@injectable
class CartCubit extends Cubit<CartStates> {
  GetCartUseCase getCartUseCase;
  DeleteCartProductUseCase deleteCartProductUseCase;
  UpdateCountCartProductUseCase updateCountCartProductUseCase;

  CartCubit(
      {required this.getCartUseCase,
      required this.deleteCartProductUseCase,
      required this.updateCountCartProductUseCase})
      : super(GetCartProductsLoadingState());

  static CartCubit get(context) => BlocProvider.of(context);
  List<GetCartProductEntity> cartItems = [];
  void getCartProducts() async {
    emit(GetCartProductsLoadingState());
    var either = await getCartUseCase.invoke();
    either.fold((error) {
      emit(GetCartProductsErrorState(errors: error));
    }, (response) {
      cartItems = response.data!.products!;
      emit(GetCartProductsSuccessState(getCartResponseEntity: response));
    });
  }

  void updateCountInCart(String productId, int count) async {
    var either = await updateCountCartProductUseCase.invoke(productId, count);
    either.fold((error) {
      emit(UpdateCountInCartErrorState(errors: error));
    }, (response) {
      cartItems = response.data!.products!;
      emit(UpdateCountInCartSuccessState(getCartResponseEntity: response));
    });
  }

  void deleteCartProduct(String productId) async {
    var either = await deleteCartProductUseCase.invoke(productId);
    either.fold((error) {
      emit(DeleteCartProductErrorState(errors: error));
    }, (response) {
      cartItems = response.data!.products!;
      emit(DeleteCartProductSuccessState(getCartResponseEntity: response));
    });
  }
}
