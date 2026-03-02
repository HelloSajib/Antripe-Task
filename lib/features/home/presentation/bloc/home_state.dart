
part of 'home_bloc.dart';

class HomeState extends Equatable{

  final String? message;
  final Status status;
  final List<Contact>? contacts;
  final List<Category>? categories;
  final ContactsEntity? contactsEntity;

  const HomeState({
    required this.message,
    required this.status,
    required this.contacts,
    required this.categories,
    required this.contactsEntity
  });

  /// Creates the initial state for the home screen.
  factory HomeState.initial() => const HomeState(
    message: null,
    status: Status.initial,
    contacts: null,
    categories: null,
    contactsEntity: null
  );

  /// Creates a copy of the current state with updated values.
  HomeState copyWith({
    String? message,
    Status? status,
    List<Contact>? contacts,
    List<Category>? categories,
    ContactsEntity? contactsEntity
  }) => HomeState(
    message: message ?? this.message,
    status: status ?? this.status,
    contacts: contacts ?? this.contacts,
    categories: categories ?? this.categories,
    contactsEntity: contactsEntity ?? this.contactsEntity
  );

  @override
  List<Object?> get props => [
    message,
    status,
    contacts,
    categories,
    contactsEntity
  ];

}
