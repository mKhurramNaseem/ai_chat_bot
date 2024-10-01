import 'package:ai_chat_bot/core/core.dart';

class HpNavigatorObserver extends NavigatorObserver{

  final Set<RouteAware> listeners = <RouteAware>{};

  void subscribe(RouteAware routeAware){
    listeners.add(routeAware);

  }

  void unsubscribe(RouteAware routeAware){
    listeners.remove(routeAware);
  }

  @override
  void didPop(Route route, Route? previousRoute) {    
    for(var listener in listeners){
      listener.didPop();
    }
    super.didPop(route, previousRoute);    
  }
}