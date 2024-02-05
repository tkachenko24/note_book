import 'package:flutter/material.dart';
import 'package:note_book/dashboard/export.dart';
import 'package:note_book/dashboard/presentation/screens/dashboard/widgets/export.dart';

class NoteList extends StatelessWidget {
  final List<Note> list;
  final void Function(int index) toDetail;
  final ThemeData theme;

  const NoteList({
    super.key,
    required this.list,
    required this.toDetail,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: list.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: InkWell(
              onTap: () => toDetail(index),
              child: NoteCard(
                list: list,
                index: index,
                theme: theme,
              ),
            ),
          );
        },
      ),
    );
  }
}
