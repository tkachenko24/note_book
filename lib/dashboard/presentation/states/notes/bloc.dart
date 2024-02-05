import 'package:equatable/equatable.dart';
import 'package:note_book/common/export.dart';
import 'package:note_book/dashboard/export.dart';

part 'event.dart';
part 'state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NotesRepository repo;

  NotesBloc({required this.repo}) : super(NotesState.empty()) {
    on<FetchNotes>(_onNotesFetch);
    on<EditNote>(_onEdit);
    on<DeleteNote>(_onDelete);
    on<AddNote>(_onAdd);
    on<Search>(_onSearch);
    on<SwitchBool>(_onBool);
    on<TitleChanged>(_onTitle);
    on<ContentChanged>(_onContent);
  }

  void _onNotesFetch(
    FetchNotes event,
    Emitter<NotesState> emit,
  ) async {
    emit(state.copyWith(
      status: Status.loading(),
    ));
    final Try<NoteFailure, List<Note>> response = await repo.fetch();

    response.fold(
      (failed) => emit(
        state.copyWith(
          status: Status.failed(failed),
        ),
      ),
      (success) => emit(
        state.copyWith(
          status: Status.success(success),
          notes: success,
        ),
      ),
    );
  }

  void _onDelete(
    DeleteNote event,
    Emitter<NotesState> emit,
  ) async {
    emit(state.copyWith(
      status: Status.loading(),
    ));
    final Try<NoteFailure, List<Note>> response =
        await repo.delete(index: event.index);
    response.fold(
      (failed) => emit(
        state.copyWith(
          status: Status.failed(failed),
        ),
      ),
      (success) => emit(
        state.copyWith(
          status: Status.success(success),
        ),
      ),
    );
  }

  void _onEdit(
    EditNote event,
    Emitter<NotesState> emit,
  ) async {
    emit(state.copyWith(
      status: Status.loading(),
    ));
    final Try<NoteFailure, List<Note>> response = await repo.edit(
      editNote: Note(
        id: state.notes[event.index].id,
        title: state.titleController.text,
        content: state.contentController.text,
      ),
      index: event.index,
    );
    response.fold(
      (failed) => emit(
        state.copyWith(
          status: Status.failed(failed),
        ),
      ),
      (success) => emit(
        state.copyWith(
          status: Status.success(success),
        ),
      ),
    );
  }

  void _onAdd(
    AddNote event,
    Emitter<NotesState> emit,
  ) async {
    emit(state.copyWith(
      status: Status.loading(),
    ));
    final List<Note> list = (await repo.fetch()).getOrElse(() => []);
    final Try<NoteFailure, List<Note>> response = await repo.add(
        newNote: Note(
      id: list.isEmpty ? 0 : list.last.id + 1,
      title: state.titleController.text,
      content: state.contentController.text,
    ));
    response.fold(
      (failed) => emit(
        state.copyWith(
          status: Status.failed(failed),
        ),
      ),
      (success) => emit(
        state.copyWith(
          status: Status.success(success),
        ),
      ),
    );
  }

  void _onSearch(
    Search event,
    Emitter<NotesState> emit,
  ) async {
    emit(state.copyWith(
      status: Status.loading(),
    ));

    final String searchValue = event.value.toLowerCase();

    final List<Note> searchList = state.notes
        .where(
          (element) =>
              element.content.toLowerCase().contains(searchValue) ||
              element.title.toLowerCase().contains(searchValue),
        )
        .toList();
    emit(
      state.copyWith(
        searchResult: searchList,
        status: Status.success([]),
      ),
    );
  }

  void _onBool(
    SwitchBool event,
    Emitter<NotesState> emit,
  ) async {
    emit(state.copyWith(
      status: Status.loading(),
    ));
    emit(state.copyWith(
      someBool: !state.someBool,
      status: Status.success([]),
    ));
  }

  void _onTitle(
    TitleChanged event,
    Emitter<NotesState> emit,
  ) async {
    emit(
      state.copyWith(
        titleController: TextEditingController(text: event.value.text),
        status: Status.success([]),
      ),
    );
  }

  void _onContent(
    ContentChanged event,
    Emitter<NotesState> emit,
  ) async {
    emit(
      state.copyWith(
        contentController: TextEditingController(text: event.value.text),
        status: Status.success([]),
      ),
    );
  }
}
