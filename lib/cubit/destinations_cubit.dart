
import 'package:air_plane/models/destinations_model.dart';
import 'package:air_plane/services/destinations_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'destinations_state.dart';

class DestinationsCubit extends Cubit<DestinationsState> {
  DestinationsCubit() : super(DestinationsInitial());

  void fetchDestinations() async {
    try {
      emit(DestinationsLoading());

      List<DestinationsModel> destinations =
          await DestinationsService().fetchDestinations();

      emit(DestinationsSuccess(destinations));
    } catch (e) {
      emit(DestinationsFailed(e.toString()));
    }
  }
}
