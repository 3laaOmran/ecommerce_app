import 'package:ecommerce_app/domain/use_cases/get_all_products_use_case.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductTabCubit extends Cubit<ProductTabStates> {
  GetAllProductsUseCase getAllProductsUseCase;

  ProductTabCubit({required this.getAllProductsUseCase})
      : super(GetAllProductsLoadingState());

  void getAllProducts() async {
    emit(GetAllProductsLoadingState());
    var either = await getAllProductsUseCase.invoke();
    either.fold((error) {
      emit(GetAllProductsErrorState(errors: error));
    }, (response) {
      emit(GetAllProductsSuccessState(productResponseEntity: response));
    });
  }
}
