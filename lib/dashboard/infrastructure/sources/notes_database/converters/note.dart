import 'package:note_book/dashboard/domain/entities/export.dart';
import 'package:note_book/dashboard/infrastructure/sources/notes_database/export.dart';

class NoteConverter {
  NoteModel toModel(Note input) {
    return NoteModel(
      id: input.id,
      title: input.title,
      content: input.content,
    );
  }

  NoteModel fromMap(Map map) {
    return NoteModel(
      id: map['id'],
      title: map['title'],
      content: map['content'],
    );
  }

  Map<dynamic, dynamic> toMap(NoteModel model) {
    return {
      'id': model.id,
      'title': model.title,
      'content': model.content,
    };
  }

  Note toEntity(NoteModel output) {
    return Note(
      id: output.id,
      title: output.title,
      content: output.content,
    );
  }
}
