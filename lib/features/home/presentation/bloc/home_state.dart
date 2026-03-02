
part of 'home_bloc.dart';

class HomeState extends Equatable{

  final String? message;
  final Status status;
  final String selectedCtg;
  final List<Contact>? contacts;
  final List<Category>? categories;
  final ContactsEntity? contactsEntity;

  const HomeState({
    required this.message,
    required this.status,
    required this.selectedCtg,
    required this.contacts,
    required this.categories,
    required this.contactsEntity
  });

  /// Creates the initial state for the home screen.
  factory HomeState.initial() => const HomeState(
    message: null,
    status: Status.initial,
    selectedCtg: "all",
    contacts: null,
    categories: null,
    contactsEntity: null
  );

  /// Creates a copy of the current state with updated values.
  HomeState copyWith({
    String? message,
    Status? status,
    String? selectedCtg,
    List<Contact>? contacts,
    List<Category>? categories,
    ContactsEntity? contactsEntity
  }) => HomeState(
    message: message ?? this.message,
    status: status ?? this.status,
    selectedCtg: selectedCtg ?? this.selectedCtg,
    contacts: contacts ?? this.contacts,
    categories: categories ?? this.categories,
    contactsEntity: contactsEntity ?? this.contactsEntity
  );

  @override
  List<Object?> get props => [
    message,
    status,
    selectedCtg,
    contacts,
    categories,
    contactsEntity
  ];

}
