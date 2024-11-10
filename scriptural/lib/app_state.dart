import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _currentChapter = 1;
  int get currentChapter => _currentChapter;
  set currentChapter(int value) {
    _currentChapter = value;
  }

  String _currentBook = 'C6RoHNKnRLt6tNP5gQUG';
  String get currentBook => _currentBook;
  set currentBook(String value) {
    _currentBook = value;
  }

  List<MessagesStruct> _messages = [];
  List<MessagesStruct> get messages => _messages;
  set messages(List<MessagesStruct> value) {
    _messages = value;
  }

  void addToMessages(MessagesStruct value) {
    messages.add(value);
  }

  void removeFromMessages(MessagesStruct value) {
    messages.remove(value);
  }

  void removeAtIndexFromMessages(int index) {
    messages.removeAt(index);
  }

  void updateMessagesAtIndex(
    int index,
    MessagesStruct Function(MessagesStruct) updateFn,
  ) {
    messages[index] = updateFn(_messages[index]);
  }

  void insertAtIndexInMessages(int index, MessagesStruct value) {
    messages.insert(index, value);
  }
}
