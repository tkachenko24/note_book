import 'package:note_book/common/presentation/export.dart';

class NoteSpan extends StatelessWidget {
  const NoteSpan({
    super.key,
    required this.theme,
    required this.title,
    required this.content,
  });

  final ThemeData theme;
  final String title, content;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '$title: ',
        style: Fonts.titleSmall.copyWith(color: theme.disabledColor),
        children: [
          TextSpan(
            text: content,
            style: Fonts.titleMedium.copyWith(color: theme.shadowColor),
          ),
        ],
      ),
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
