import 'package:flutter_task/features/home/data/models/contacts_model.dart';

class ContactsEntity {
  final List<Category>? categories;
  final List<Contact>? contacts;

  ContactsEntity({
    this.categories,
    this.contacts,
  });
}