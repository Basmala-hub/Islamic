import '../models/surah.dart';
import '../models/timing.dart';
import '../models/whole sursh.dart';

abstract class AppState {}

class LoadingState extends AppState {}

class initialState extends AppState {}

class LoadedState extends AppState {
  final Timing time;

  LoadedState({required this.time});
}

class SurahLoadedState extends AppState {
  final List<Surah> surah;

  SurahLoadedState({required this.surah});
}

class ErrorState extends AppState {
  final String error;

  ErrorState({required this.error});
}

class WholeSurahLoaded extends AppState {
  final List<WholeSurah> wholeSurah;

  WholeSurahLoaded({required this.wholeSurah});
}
