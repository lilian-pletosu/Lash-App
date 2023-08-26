import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lash_app/pages/application/bloc/app_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<TriggerSettings>(_triggerSettings);
  }

  void _triggerSettings(SettingsEvent event, Emitter<SettingsState> emit) {
    emit(SettingsState());
  }
}
