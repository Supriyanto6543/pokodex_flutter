import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pokemon/features/domain/entities/home_entities.dart';
import 'package:pokemon/features/domain/usecase/get_home.dart';
import 'package:pokemon/injection.dart' as di;
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../common/status_enum.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static final load = RefreshController();

  HomeBloc() : super(HomeInitial()) {
    final GetHome getHome = GetHome(di.locator());

    on<HomeEventList>((event, emit) async {
      // TODO: implement event handler
      final result = await getHome.execute(event.offset);
      result.fold((l) {
        emit(HomeError(StatusEnum.loaded, l.toString()));
      }, (r) {
        emit(HomeLoaded(r, StatusEnum.loaded));
      });
    });
  }
}
