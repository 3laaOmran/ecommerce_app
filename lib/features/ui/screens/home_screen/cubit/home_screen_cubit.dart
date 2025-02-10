import 'package:ecommerce_app/features/ui/screens/home_screen/cubit/home_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  int selectedIndex = 0;

  void changeSelectedIndex(int index) {
    selectedIndex = index;
    emit(HomeChangeSelectedIndexState());
  }
}
