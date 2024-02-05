import 'package:flutter/material.dart';
import 'package:note_book/dashboard/export.dart';
import 'package:note_book/dashboard/presentation/screens/dashboard/widgets/export.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.list,
    required this.index,
    required this.theme,
  });
  final ThemeData theme;
  final List<Note> list;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NoteSpan(
                    theme: theme,
                    title: 'Title',
                    content: list[index].title,
                  ),
                  const SizedBox(height: 15),
                  NoteSpan(
                    theme: theme,
                    title: 'Content',
                    content: list[index].content,
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
