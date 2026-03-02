
part of 'home_bloc.dart';

class HomeState extends Equatable{

  final String? message;
  final Status status;
  final List<Contact>? contacts;

  const HomeState({
    required this.message,
    required this.status,
    required this.contacts,
  });

  /// Creates the initial state for the home screen.
  factory HomeState.initial() => const HomeState(
    message: null,
    status: Status.initial,
    contacts: null,
  );

  /// Creates a copy of the current state with updated values.
  HomeState copyWith({
    String? message,
    Status? status,
    List<Contact>? contacts,
  }) => HomeState(
    message: message ?? this.message,
    status: status ?? this.status,
    contacts: contacts ?? this.contacts,
  );

  @override
  List<Object?> get props => [
    message,
    status,
    contacts
  ];

}
