import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'air_condition_city_main_page_event.dart';
part 'air_condition_city_main_page_state.dart';

class AirConditionCityMainPageBloc extends Bloc<AirConditionCityMainPageEvent, AirConditionCityMainPageState> {
  AirConditionCityMainPageBloc() : super(AirConditionCityMainPageInitial()) {
    on<AirConditionCityMainPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
