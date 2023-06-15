import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pokemon/common/status_enum.dart';
import 'package:pokemon/features/domain/entities/detail_entities.dart';
import 'package:pokemon/features/domain/usecase/get_detail.dart';
import 'package:pokemon/injection.dart' as di;

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    final GetDetail getDetail = GetDetail(di.locator());
    on<DetailEventData>((event, emit) async {
      // TODO: implement event handler
      final result = await getDetail.execute(event.id);
      result.fold((l) {
        emit(DetailError(StatusEnum.loaded, l.toString()));
      }, (r) {
        emit(DetailLoaded(r!, StatusEnum.loaded));
      });
    });
  }
}
