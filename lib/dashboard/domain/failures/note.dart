import 'package:note_book/common/helpers/failure.dart';

class NoteFailure extends Failure {
  final Object error;
  const NoteFailure(this.error);
}
