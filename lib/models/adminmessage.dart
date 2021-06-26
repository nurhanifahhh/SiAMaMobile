part of '../ui/pages/pages.dart';

class User {
  final int id;
  final String name;
  final bool isOnline;

  User({
    this.id,
    this.name,
    this.isOnline,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'User',
  isOnline: true,
);

// USERS
final User admin = User(
  id: 1,
  name: 'Admin',
  isOnline: true,
);
