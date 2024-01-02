import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'dates_provider.g.dart';

@riverpod
class DateState extends _$DateState {
  @override
  bool build() {
    return false;
  }

  void setDate(bool newState) {
    state = newState;
  }
}

@riverpod
class StartTimeState extends _$StartTimeState {
  @override
  bool build() {
    return false;
  }

  void setStartTime(bool newState) {
    state = newState;
  }
}

@riverpod
class EndTimeState extends _$EndTimeState {
  @override
  bool build() {
    return false;
  }

  void setEndTime(bool newState) {
    state = newState;
  }
}
