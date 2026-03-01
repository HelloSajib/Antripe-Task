import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable{}

class GetProducts extends HomeEvent{
  @override
  List<Object?> get props => [];
}