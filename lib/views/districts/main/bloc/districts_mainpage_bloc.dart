import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'districts_mainpage_event.dart';
part 'districts_mainpage_state.dart';

class DistrictsMainpageBloc extends Bloc<DistrictsMainpageEvent, DistrictsMainpageState> {
  DistrictsMainpageBloc() : super(DistrictsMainpageInitial()) {
    on<DistrictsMainpageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
