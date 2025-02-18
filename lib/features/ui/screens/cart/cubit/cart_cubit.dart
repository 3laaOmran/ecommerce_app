import 'package:ecommerce_app/domain/use_cases/get_cart_use_case.dart';
import 'package:ecommerce_app/features/ui/screens/cart/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartCubit extends Cubit<CartStates> {
  GetCartUseCase getCartUseCase;

  CartCubit({required this.getCartUseCase})
      : super(GetCartProductsLoadingState());

  static CartCubit get(context) => BlocProvider.of(context);

  void getCartProducts() async {
    emit(GetCartProductsLoadingState());
    var either = await getCartUseCase.invoke();
    either.fold((error) {
      emit(GetCartProductsErrorState(errors: error));
    }, (response) {
      emit(GetCartProductsSuccessState(getCartResponseEntity: response));
    });
  }
}
