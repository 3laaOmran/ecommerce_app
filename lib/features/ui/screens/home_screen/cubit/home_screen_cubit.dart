import 'package:ecommerce_app/features/ui/screens/home_screen/cubit/home_screen_states.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/tabs/favorite_tab/favorite_tab.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/tabs/product_tab/products_tab.dart';
import 'package:ecommerce_app/features/ui/screens/home_screen/tabs/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../tabs/home_tab/home_tab.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  int selectedIndex = 0;
  List<Widget> screens = [
    HomeTab(),
    ProductsTab(),
    FavoriteTab(),
    ProfileTab(),
  ];
  void changeSelectedIndex(int index) {
    selectedIndex = index;
    emit(HomeChangeSelectedIndexState());
  }
}
