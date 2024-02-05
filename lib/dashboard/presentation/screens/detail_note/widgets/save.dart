import 'package:note_book/common/presentation/export.dart';
import 'package:note_book/dashboard/presentation/export.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.back,
    required this.bloc,
    required this.index,
    required this.theme,
  });

  final void Function() back;
  final NotesBloc bloc;
  final int index;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return PlatformIconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        if (bloc.state.someBool) {
          bloc.state.titleController.text.isNotEmpty &&
                  bloc.state.contentController.text.isNotEmpty
              ? {
                  back.call(),
                  bloc.add(
                    EditNote(index),
                  )
                }
              : showPlatformDialog(
                  context: context,
                  builder: (context) => PlatformAlertDialog(
                    title: Text(
                      'Fields must be not empty',
                      style: Fonts.labelLarge,
                    ),
                    actions: [
                      PlatformTextButton(
                        child: Text(
                          'Ok',
                          style: Fonts.titleMedium,
                        ),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  ),
                );
        }
        bloc.add(const SwitchBool());
      },
      icon: Icon(
        bloc.state.someBool
            ? PlatformIcons(context).checkMark
            : PlatformIcons(context).edit,
        color: theme.scaffoldBackgroundColor,
      ),
    );
  }
}
