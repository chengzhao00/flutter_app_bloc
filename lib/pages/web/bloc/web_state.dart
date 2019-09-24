
import 'package:equatable/equatable.dart';

class WebState extends Equatable{
  WebState([List props = const[]]):super(props);
}


class WebInit extends WebState{
  @override
  String toString()  => 'webInit';

}


class WebLoadingState extends WebState{


  @override
  String toString() => 'WebLoading';
}


class WebLoadingFinishState extends WebState {

  @override
  String toString()  => "WebLoadingFinish";
}

class WebErrorState extends WebState{
  final Exception exception;


  WebErrorState(this.exception):super([exception]);

  @override
  String toString() => 'error';

}