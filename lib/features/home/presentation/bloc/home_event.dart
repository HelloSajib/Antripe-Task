import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable{}

class GetContacts extends HomeEvent{
  @override
  List<Object?> get props => [];
}

class SearchContacts extends HomeEvent{
  final String searchText;
  SearchContacts(this.searchText);
  @override
  List<Object?> get props => [searchText];
}

class CategoryBaseFilter extends HomeEvent{
  final String category;
  CategoryBaseFilter(this.category);
  @override
  List<Object?> get props => [
    category
  ];
}