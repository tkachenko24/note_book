import 'package:get_it/get_it.dart';
import 'package:note_book/dashboard/export.dart';
import 'package:note_book/dashboard/infrastructure/sources/notes_database/export.dart';
import 'injectable.dart';

class DashboardInjectable extends Injectable {
  @override
  Future<void> register(GetIt it) async {
    it.registerLazySingleton<NotesDatabase>(
      () => NotesDatabaseHiveImplementation(
        storage: it.get(),
        convert: NoteConverter(),
      ),
    );

    it.registerLazySingleton<NotesRepository>(
      () => NotesRepositoryImplementation(
        source: it.get(),
        convert: NoteConverter(),
      ),
    );
  }
}
