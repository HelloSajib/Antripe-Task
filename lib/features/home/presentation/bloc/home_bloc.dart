import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/config/service_locator/service_locator.dart';
import 'package:flutter_task/core/utils/enums/enums.dart';
import 'package:flutter_task/features/home/domain/entities/product_entity.dart';
import 'package:flutter_task/features/home/domain/usecases/get_products_usecase.dart';
import 'package:flutter_task/features/home/presentation/bloc/home_event.dart';



part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{

  /// Initializes the BLoC and registers event handlers.
  HomeBloc(): super(HomeState.initial()){
    on<GetProducts>(_onGetProducts);
  }

  /// Get Products Event Manager
  Future<void> _onGetProducts(GetProducts event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<GetProductsUseCase>().call();
    result.fold(
        (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
        (data)=> emit(state.copyWith(status: Status.success, products: data))
    );
  }


}