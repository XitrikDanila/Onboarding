import 'package:bloc/bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState(currentIndex: 0, percentage: 0.25));

  void updateIndex(int index, int length) {
    emit(
        OnboardingState(currentIndex: index, percentage: (index + 1) / length));
  }
}

class OnboardingState {
  final int currentIndex;
  final double percentage;

  OnboardingState({required this.currentIndex, required this.percentage});
}
