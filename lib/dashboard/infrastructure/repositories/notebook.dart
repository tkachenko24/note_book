import 'package:note_book/common/helpers/export.dart';
import 'package:note_book/dashboard/domain/export.dart';
import 'package:note_book/dashboard/infrastructure/sources/notes_database/export.dart';

class NotesRepositoryImplementation implements NotesRepository {
  final NotesDatabase source;
  final NoteConverter convert;
  NotesRepositoryImplementation({
    required this.source,
    required this.convert,
  });

  @override
  TryFuture<NoteFailure, List<Note>> fetch() async {
    try {
      List<NoteModel> response = await source.fetch();

      List<Note> unit = response
          .map(
            (model) => convert.toEntity(model),
          )
          .toList();
      return Try.success(unit);
    } catch (err) {
      return Try.failed(
        NoteFailure(err),
      );
    }
  }

  @override
  TryFuture<NoteFailure, List<Note>> delete({required int index}) async {
    try {
      List<NoteModel> response = await source.delete(index: index);
      List<Note> unit = response
          .map(
            (model) => convert.toEntity(model),
          )
          .toList();
      return Try.success(unit);
    } catch (err) {
      return Try.failed(
        NoteFailure(err),
      );
    }
  }

  @override
  TryFuture<NoteFailure, List<Note>> add({required Note newNote}) async {
    try {
      List<NoteModel> response =
          await source.add(newNote: convert.toModel(newNote));
      List<Note> unit = response
          .map(
            (model) => convert.toEntity(model),
          )
          .toList();
      return Try.success(unit);
    } catch (err) {
      return Try.failed(
        NoteFailure(err),
      );
    }
  }

  @override
  TryFuture<NoteFailure, List<Note>> edit({
    required Note editNote,
    required int index,
  }) async {
    try {
      List<NoteModel> response =
          await source.edit(newNote: convert.toModel(editNote), index: index);
      List<Note> unit = response
          .map(
            (model) => convert.toEntity(model),
          )
          .toList();
      return Try.success(unit);
    } catch (err) {
      return Try.failed(
        NoteFailure(err),
      );
    }
  }
}
