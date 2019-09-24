

import 'web_index.dart';
import 'package:bloc/bloc.dart';

class WebBloc extends Bloc<WebEvent,WebState>{


  WebBloc();

  @override
  WebState get initialState => WebLoadingState();

  @override
  Stream<WebState> mapEventToState(WebEvent event) async*{

    try{
      if (event is WebPageFinishEvent){
        yield WebLoadingFinishState();
      }
    }catch(e){
      yield WebErrorState(e);
    }

  }


}