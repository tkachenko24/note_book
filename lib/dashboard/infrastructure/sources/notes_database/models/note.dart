class NoteModel {
  final int id;
  final String title;
  final String content;

  const NoteModel({
    required this.id,
    required this.title,
    required this.content,
  });

  factory NoteModel.empty() {
    return const NoteModel(
      id: 0,
      title: '',
      content: '',
    );
  }
}
