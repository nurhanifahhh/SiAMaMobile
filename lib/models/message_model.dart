part of '../ui/pages/pages.dart';

class Message {
  final User sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.unread,
  });
}

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: admin,
    time: '5:30 PM',
    text: 'Hey dude! Even dead I\'m the hero. Love you 3000 guys.',
    unread: true,
  ),
];

List<Message> messages = [
  Message(
    sender: admin,
    time: '5:30 PM',
    text: 'Hey dude! Event dead I\'m the hero. Love you 3000 guys.',
    unread: true,
  ),
];
