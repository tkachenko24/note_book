part of 'bloc.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object?> get props => [];
}

class FetchNotes extends NotesEvent {
  const FetchNotes();

  @override
  List<Object?> get props => [];
}

class DeleteNote extends NotesEvent {
  final int index;
  const DeleteNote(this.index);

  @override
  List<Object?> get props => [index];
}

class EditNote extends NotesEvent {
  final int index;
  const EditNote(this.index);

  @override
  List<Object?> get props => [index];
}

class AddNote extends NotesEvent {
  const AddNote();

  @override
  List<Object?> get props => [];
}

class Search extends NotesEvent {
  final String value;
  const Search(this.value);

  @override
  List<Object?> get props => [value];
}

class SwitchBool extends NotesEvent {
  const SwitchBool();

  @override
  List<Object?> get props => [];
}

class TitleChanged extends NotesEvent {
  final TextEditingController value;
  const TitleChanged(this.value);

  @override
  List<Object?> get props => [value];
}

class ContentChanged extends NotesEvent {
  final TextEditingController value;
  const ContentChanged(this.value);

  @override
  List<Object?> get props => [value];
}
