import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/config/service_locator/service_locator.dart';
import 'package:flutter_task/core/utils/enums/enums.dart';
import 'package:flutter_task/features/home/data/models/contacts_model.dart';
import 'package:flutter_task/features/home/domain/entities/contact_entity.dart';
import 'package:flutter_task/features/home/domain/usecases/get_contacts_usecase.dart';
import 'package:flutter_task/features/home/presentation/bloc/home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{

  /// Initializes the BLoC and registers event handlers.
  HomeBloc(): super(HomeState.initial()){
    on<GetContacts>(_onGetContacts);
    on<SearchContacts>(_onSearchContacts);
    on<CategoryBaseFilter>(_onCategoryBaseFilter);
  }

  /// Get Contacts Event Manager
  Future<void> _onGetContacts(GetContacts event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: Status.loading));
    var result = await sl<GetContactsUseCase>().call();
    result.fold(
        (error)=> emit(state.copyWith(status: Status.error, message: error.message)),
        (data)=> emit(state.copyWith(
          status: Status.success,
          contacts: data?.contacts,
          categories: data?.categories,
          contactsEntity: data
        ))
    );
  }

  /// Search Contacts Event Manager
  Future<void> _onSearchContacts(SearchContacts event, Emitter<HomeState> emit) async {
    final searchContacts = (state.contactsEntity?.contacts ?? []).where((contact){
      return state.selectedCtg == contact.categoryId &&
          ((contact.name ?? "").toLowerCase().contains(event.searchText.toLowerCase()) ||
          (contact.phone ?? "").toLowerCase().contains(event.searchText.toLowerCase()));
    }).toList();

    emit(state.copyWith(
        status: Status.success,
        contacts: searchContacts
    ));
  }

  /// Search Contacts Event Manager
  Future<void> _onCategoryBaseFilter(CategoryBaseFilter event, Emitter<HomeState> emit) async {
    final categoryBaseContacts = (state.contactsEntity?.contacts ?? []).where((contact){
      return contact.categoryId == event.category;
    }).toList();
    emit(state.copyWith(
        status: Status.success,
        selectedCtg: event.category,
        contacts: categoryBaseContacts,
    ));
  }


}