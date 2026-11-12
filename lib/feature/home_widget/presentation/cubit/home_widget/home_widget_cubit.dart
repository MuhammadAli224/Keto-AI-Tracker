import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/mixin/cubit_lifecycle_mixin.dart';
import '../../../data/widget_snapshot_service.dart';

class HomeWidgetState {
  const HomeWidgetState({
    required this.visible,
    this.busy = false,
    this.failed = false,
  });

  final bool visible;
  final bool busy;
  final bool failed;
}

class HomeWidgetCubit extends Cubit<HomeWidgetState>
    with CubitLifecycleMixin<HomeWidgetState> {
  HomeWidgetCubit(this._settings)
    : super(HomeWidgetState(visible: _settings.visible));

  final WidgetSnapshotService _settings;
  static const _key = 'widget-visibility';

  Future<void> setVisible(bool visible) async {
    if (isClosed || state.busy) return;
    final request = beginRequest(_key);
    emit(HomeWidgetState(visible: state.visible, busy: true));
    try {
      await _settings.setVisible(visible);
      if (isCurrentRequest(_key, request)) {
        emit(HomeWidgetState(visible: _settings.visible));
      }
    } catch (_) {
      if (isCurrentRequest(_key, request)) {
        emit(HomeWidgetState(visible: _settings.visible, failed: true));
      }
    } finally {
      finishRequest(_key, request);
    }
  }
}
