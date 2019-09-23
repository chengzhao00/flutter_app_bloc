

import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable{
  HomeEvent([List props = const []]) : super(props);
}


class LoginEvent extends HomeEvent{
  @override
  String toString() {
    return 'LoginEvent';
  }
}


class HomeLoadingEvent extends HomeEvent{
  @override
  String toString() => 'HomeLoading';
}