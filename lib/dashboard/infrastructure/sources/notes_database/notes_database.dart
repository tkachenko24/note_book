import 'package:note_book/dashboard/infrastructure/sources/notes_database/export.dart';

abstract class NotesDatabase {
  Future<List<NoteModel>> fetch();
  Future<List<NoteModel>> add({required NoteModel newNote});
  Future<List<NoteModel>> delete({required int index});
  Future<List<NoteModel>> edit({
    required NoteModel newNote,
    required int index,
  });
}
