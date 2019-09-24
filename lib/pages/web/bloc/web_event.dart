
import 'package:equatable/equatable.dart';


class WebEvent extends Equatable{


  WebEvent([List props = const []]) :super(props);


}


class WebPageFinishEvent extends WebEvent{

  @override
  String toString()  => 'WebPageFinishEvent';
}