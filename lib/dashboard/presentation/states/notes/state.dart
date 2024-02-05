part of 'bloc.dart';

class NotesState extends Equatable {
  final Status<NoteFailure, List<Note>> status;
  final List<Note> notes;
  final List<Note> searchResult;
  final bool someBool;
  final TextEditingController titleController;
  final TextEditingController contentController;

  const NotesState({
    required this.status,
    required this.notes,
    required this.searchResult,
    required this.someBool,
    required this.titleController,
    required this.contentController,
  });

  factory NotesState.empty() => NotesState(
        status: Status.empty(),
        notes: const [],
        searchResult: const [],
        someBool: false,
        titleController: TextEditingController(),
        contentController: TextEditingController(),
      );

  NotesState copyWith({
    Status<NoteFailure, List<Note>>? status,
    List<Note>? notes,
    List<Note>? searchResult,
    bool? someBool,
    TextEditingController? titleController,
    TextEditingController? contentController,
  }) {
    return NotesState(
      status: status ?? this.status,
      notes: notes ?? this.notes,
      searchResult: searchResult ?? this.searchResult,
      someBool: someBool ?? this.someBool,
      titleController: titleController ?? this.titleController,
      contentController: contentController ?? this.contentController,
    );
  }

  @override
  List<Object?> get props => [
        notes,
        searchResult,
        status,
        someBool,
        titleController,
        contentController,
      ];
}
