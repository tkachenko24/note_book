import 'package:note_book/common/export.dart';

class Note extends Entity {
  final int id;
  final String title;
  final String content;

  const Note({
    required this.id,
    required this.title,
    required this.content,
  });

  Note copyWith({
    int? id,
    String? title,
    String? content,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  factory Note.empty() {
    return const Note(
      id: 0,
      title: '',
      content: '',
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        content,
      ];
}
