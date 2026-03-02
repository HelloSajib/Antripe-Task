import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable{}

class GetContacts extends HomeEvent{
  @override
  List<Object?> get props => [];
}