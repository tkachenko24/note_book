import 'package:note_book/common/presentation/export.dart';
import 'package:note_book/dashboard/presentation/export.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    required this.bloc,
    required this.index,
    required this.back,
    required this.theme,
  });

  final NotesBloc bloc;
  final int index;
  final void Function() back;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return PlatformIconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        showPlatformDialog(
          context: context,
          builder: (context) => PlatformAlertDialog(
            title: Text(
              'Are you sure you want to delete this note? The action is irreversible.',
              style: Fonts.labelLarge,
            ),
            actions: [
              PlatformTextButton(
                child: Text(
                  'Yes',
                  style: Fonts.titleMedium,
                ),
                onPressed: () async {
                  bloc.add(
                    DeleteNote(index),
                  );
                  await for (var event in bloc.stream) {
                    if (event.status.isSuccess()) {
                      back.call();
                    }
                  }
                },
              ),
              PlatformTextButton(
                child: Text(
                  'No',
                  style: Fonts.titleMedium
                      .copyWith(color: theme.colorScheme.error),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
      icon: Icon(
        PlatformIcons(context).delete,
        color: theme.scaffoldBackgroundColor,
      ),
    );
  }
}
