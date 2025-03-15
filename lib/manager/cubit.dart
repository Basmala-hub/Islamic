import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/manager/state.dart';

import '../models/whole sursh.dart';
import '../network/api_service.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit():super(initialState());
  ApiService apiService=ApiService();
 fetchTime() async {
   emit(LoadingState());
  try {
    var x=await apiService.getTime();
    emit(LoadedState(time: x));
  }  catch (e) {
    emit(ErrorState(error: e.toString()));
  }

 }
  Future<void> fetchSurah() async {
    emit(LoadingState());
    try {
      var z = await apiService.getSurah();
      emit(SurahLoadedState(surah: z)); // ✅ استخدام `SurahLoadedState`
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
  fetcWholeSurah()async{
   emit(LoadingState());
   try {
     List<WholeSurah> w=await apiService.getWholeSurah();
     emit(WholeSurahLoaded(wholeSurah: w));
   } on Exception catch (e) {
    emit(ErrorState(error: e.toString()));
   }
  }
}