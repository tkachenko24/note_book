import 'package:note_book/common/presentation/export.dart';

class EmptyList extends StatelessWidget {
  final ThemeData theme;
  const EmptyList({
    super.key,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          const Spacer(flex: 9),
          Center(
            child: Text(
              'No notes available, try add a new one!',
              style: Fonts.headlineMedium.copyWith(color: theme.disabledColor),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(flex: 9),
        ],
      ),
    );
  }
}
