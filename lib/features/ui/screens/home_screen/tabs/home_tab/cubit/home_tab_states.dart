import 'package:ecommerce_app/core/errors/failures.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}
// class HomeCategoriesLoadingState extends HomeTabStates{}
// class HomeCategoriesErrorState extends HomeTabStates{
//   Failures errors;
//   HomeCategoriesErrorState({required this.errors});
// }
// class HomeCategoriesSuccessState extends HomeTabStates{
//   CategoryOrBrandResponseEntity categoryOrBrandResponseEntity;
//   HomeCategoriesSuccessState({required this.categoryOrBrandResponseEntity});
// }
// class HomeBrandsLoadingState extends HomeTabStates{}
// class HomeBrandsErrorState extends HomeTabStates{
//   Failures errors;
//   HomeBrandsErrorState({required this.errors});
// }
// class HomeBrandsSuccessState extends HomeTabStates{
//   CategoryOrBrandResponseEntity categoryOrBrandResponseEntity;
//   HomeBrandsSuccessState({required this.categoryOrBrandResponseEntity});
// }

class HomeTabLoadingState extends HomeTabStates {}

class HomeTabSuccessState extends HomeTabStates {}

class HomeTabErrorState extends HomeTabStates {
  final Failures errors;

  HomeTabErrorState({required this.errors});
}
