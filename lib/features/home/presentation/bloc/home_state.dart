
part of 'home_bloc.dart';

class HomeState extends Equatable{

  final String? message;
  final Status status;
  final List<ProductEntity>? products;

  const HomeState({
    required this.message,
    required this.status,
    required this.products,
  });

  /// Creates the initial state for the home screen.
  factory HomeState.initial() => const HomeState(
    message: null,
    status: Status.initial,
    products: null,
  );

  /// Creates a copy of the current state with updated values.
  HomeState copyWith({
    String? message,
    Status? status,
    List<ProductEntity>? products,
  }) => HomeState(
    message: message ?? this.message,
    status: status ?? this.status,
    products: products ?? this.products,
  );

  @override
  List<Object?> get props => [
    message,
    status,
    products
  ];

}
