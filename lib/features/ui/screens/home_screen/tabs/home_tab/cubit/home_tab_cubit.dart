import 'package:ecommerce_app/domain/entities/category_or_brand_response_entity.dart';
import 'package:ecommerce_app/domain/use_cases/get_all_brands_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/get_all_categories_use_case.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabCubit extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeTabCubit(
      {required this.getAllCategoriesUseCase,
      required this.getAllBrandsUseCase})
      : super(HomeTabInitialState());
  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];

  //
  // void getAllCategories()async{
  //   emit(HomeCategoriesLoadingState());
  //   var either =await getAllCategoriesUseCase.invoke();
  //
  //   either.fold((error){
  //     emit(HomeCategoriesErrorState(errors: error));
  //   }, (response){
  //     categoriesList = response.data!;
  //     emit(HomeCategoriesSuccessState(categoryOrBrandResponseEntity: response));
  //   });
  //
  // }
  //
  // void getAllBrands()async{
  //   emit(HomeBrandsLoadingState());
  //   var either =await getAllBrandsUseCase.invoke();
  //
  //   either.fold((error){
  //     emit(HomeBrandsErrorState(errors: error));
  //   }, (response){
  //     brandsList = response.data!;
  //     emit(HomeBrandsSuccessState(categoryOrBrandResponseEntity: response));
  //   });
  //
  // }

  void getAllCategoriesAndBrands() async {
    emit(HomeTabLoadingState());

    final results = await Future.wait([
      getAllCategoriesUseCase.invoke(),
      getAllBrandsUseCase.invoke(),
    ]);

    final categoriesResult = results[0];
    final brandsResult = results[1];

    categoriesResult.fold(
      (error) => emit(HomeTabErrorState(errors: error)),
      (response) {
        categoriesList = response.data!;
        emit(HomeTabSuccessState());
      },
    );

    brandsResult.fold(
      (error) => emit(HomeTabErrorState(errors: error)),
      (response) {
        brandsList = response.data!;
        emit(HomeTabSuccessState());
      },
    );
  }
}
