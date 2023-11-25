import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'check_box_event.dart';
part 'check_box_state.dart';

// This bloc is not implmented please note:
class CheckBoxBloc extends Bloc<CheckBoxEvent, CheckBoxState> {
  CheckBoxBloc() : super(CheckBoxState(alive: false, bedridden: false)) {
    on<CheckBoxEvent>((event, emit) {
            final truecase = event.alive;
            emit(CheckBoxState(alive: true, bedridden: false));

    });
  }
}
