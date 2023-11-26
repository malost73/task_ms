import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_ms/core/constants/constants.dart';
import 'package:task_ms/core/utilities/show_toast.dart';
import 'package:task_ms/features/weather_forecast/presentation/error_bloc/error_event.dart';
import 'package:task_ms/features/weather_forecast/presentation/error_bloc/error_state.dart';

class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  ErrorBloc() : super(const ErrorState()) {
    on<ShowToastEvent>(_showToastEvent);
  }

  _showToastEvent(ShowToastEvent event, Emitter<ErrorState> emit) async {
    ShowToast.showToast(event.message ?? Constants.unexpectedFailureMessage);
  }
}
