
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeSuccessState extends HomeState {}
class HomeLoadingState extends HomeState {}
class HomeFailureState extends HomeState {
  final String errorMassage;

  HomeFailureState(this.errorMassage);

}
