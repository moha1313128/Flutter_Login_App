import '../pages/wishlist_page.dart';
import '../pages/account_page.dart';
import '../pages/settings_page.dart';
import '../pages/home_page.dart';
import '../pages/order_page.dart';
import 'package:bloc/bloc.dart';


enum NavigvationEvents {
  HomePageClickedEvent,
  AccountPageClickedEvent,
  OrderPageClickedEvent,
  SettingPageClickedEvent,
  WishListPageClickedEvent,
}

abstract class NavigationStates{}

class NavigationBloc extends Bloc<NavigvationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigvationEvents event) async* {
    switch (event) {
      case NavigvationEvents.HomePageClickedEvent: 
        yield HomePage();
        break;
      case NavigvationEvents.AccountPageClickedEvent: 
        yield AccountPage();
        break;
      case NavigvationEvents.OrderPageClickedEvent: 
        yield OrderPage();
        break;
      case NavigvationEvents.SettingPageClickedEvent: 
        yield SettingPage();
        break;
      case NavigvationEvents.WishListPageClickedEvent: 
        yield WishListPage();
        break;       
    }
  }

}