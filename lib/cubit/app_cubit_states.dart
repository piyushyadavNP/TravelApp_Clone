import 'package:equatable/equatable.dart';
import 'package:travel_app/models/data_model.dart';

abstract class CubitStates extends Equatable {}

// Initial State
class InitialState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

// Display Welcome Page After Initialization
class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

// Initial State
class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

// Display Home Page After Initialization
class LoadedState extends CubitStates {
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  // TODO: implement props
  List<Object?> get props => [places];
}

// Display Details Page After Initialization
class DetailState extends CubitStates {
  DetailState(this.place);
  final DataModel place;
  @override
  // TODO: implement props
  List<Object?> get props => [place];
}
