import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/domain/models/models.dart';
import 'package:imdb/domain/usecases/get_top_250_usecase.dart';
import 'package:imdb/presentation/layout/base_cubit/base_states.dart';
import 'package:imdb/presentation/resources/components_widgets.dart';

import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';

class BaseCubit extends Cubit<BaseStates> {
  BaseCubit() : super(InitialAppState());

  static BaseCubit get(context) => BlocProvider.of(context);

  List<Movie> _allMovies = [];

  List<Movie> gettop250Movie() => _allMovies;

  bool isLoading = false;
  bool isError = false;

  changeLoadingState() {
    isLoading = !isLoading;
    if (isLoading) {
      isError = false;
    }
  }

  Future<void> getTop250Movie(
      context, GetTop250MovieUseCase moviesUseCase) async {
    changeLoadingState();
    emit(GetMoviesLoadingState());

    (await moviesUseCase.start(null)).fold(
      (failure) {
        changeLoadingState();
        isError = true;
        emit(GetMoviesErrorState());
        showSnackBar(context, failure.message, ColorManager.error);
        
      },
      (movies) {
        changeLoadingState();
        _allMovies = movies;
        emit(GetMoviesSuccessState());
      },
    );
  }
}
