import 'package:ecommerce_app/core/cashe/shared_preferences_utils.dart';
import 'package:ecommerce_app/domain/use_cases/add_to_cart_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/get_all_products_use_case.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductTabCubit extends Cubit<ProductTabStates> {
  GetAllProductsUseCase getAllProductsUseCase;
  AddToCartUseCase addToCartUseCase;

  ProductTabCubit(
      {required this.getAllProductsUseCase, required this.addToCartUseCase})
      : super(GetAllProductsLoadingState());

  static ProductTabCubit get(context) => BlocProvider.of(context);
  int numOfCartItems = 0;

  void getAllProducts() async {
    emit(GetAllProductsLoadingState());
    var either = await getAllProductsUseCase.invoke();
    either.fold((error) {
      emit(GetAllProductsErrorState(errors: error));
    }, (response) {
      emit(GetAllProductsSuccessState(productResponseEntity: response));
    });
  }

  void addToCart({required String productId}) async {
    emit(AddToCartLoadingState());
    var either = await addToCartUseCase.invoke(productId);
    either.fold((error) {
      emit(AddToCartErrorState(errors: error));
    }, (response) {
      numOfCartItems = response.numOfCartItems!.toInt();
      SharedPreferencesUtils.saveData(key: 'numItems', value: numOfCartItems);
      print('Num Of Cart Items: $numOfCartItems');
      emit(AddToCartSuccessState(addToCartResponseEntity: response));
    });
  }
}
