import 'package:note_book/common/presentation/export.dart';
import 'package:note_book/dashboard/export.dart';

class NewNoteScreen extends StatelessWidget {
  final void Function() toDashboard;
  final void Function() onSuccessSave;
  final ThemeData theme;

  const NewNoteScreen({
    super.key,
    required this.toDashboard,
    required this.onSuccessSave,
    required this.theme,
  });

  void newNote(
    NotesBloc bloc,
    BuildContext context,
  ) async {
    bloc.state.titleController.text.isNotEmpty &&
            bloc.state.titleController.text.isNotEmpty
        ? {
            bloc.add(const AddNote()),
            await for (var event in bloc.stream)
              {
                if (event.status.isSuccess()) {onSuccessSave.call()}
              }
          }
        : showPlatformDialog(
            context: context,
            builder: (context) => PlatformAlertDialog(
              title: Text(
                'Please fill all fields, to be able to save your new note',
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

  @override
  Widget build(BuildContext context) {
    NotesBloc bloc = context.read<NotesBloc>();
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(
          'New note',
          style:
              Fonts.titleLarge.copyWith(color: theme.scaffoldBackgroundColor),
        ),
        backgroundColor: theme.primaryColor,
        leading: Transform.flip(
          flipX: true,
          child: PlatformIconButton(
            onPressed: toDashboard,
            padding: EdgeInsets.zero,
            icon: Icon(
              PlatformIcons(context).rightChevron,
              color: theme.scaffoldBackgroundColor,
              size: 30,
            ),
          ),
        ),
        trailingActions: [
          PlatformIconButton(
            onPressed: () => newNote(
              bloc,
              context,
            ),
            padding: EdgeInsets.zero,
            icon: Icon(
              PlatformIcons(context).checkMark,
              color: theme.scaffoldBackgroundColor,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Material(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(flex: 3),
                  PlatformTextField(
                    hintText: 'Title',
                    cupertino: (context, platform) =>
                        CupertinoTextFieldData(maxLines: 1),
                    material: (context, platform) => MaterialTextFieldData(
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintStyle: Fonts.bodyLarge
                            .copyWith(color: theme.disabledColor),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    onTapOutside: (_) => FocusScope.of(context).unfocus(),
                    onChanged: (value) => bloc.add(
                      TitleChanged(TextEditingController(text: value)),
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  PlatformTextField(
                    hintText: 'Content',
                    autocorrect: false,
                    cupertino: (context, platform) => CupertinoTextFieldData(
                      maxLines:
                          (MediaQuery.of(context).size.height * 0.038).toInt(),
                    ),
                    material: (context, platform) => MaterialTextFieldData(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintStyle: Fonts.bodyLarge
                            .copyWith(color: theme.disabledColor),
                      ),
                      maxLines:
                          (MediaQuery.of(context).size.height * 0.030).toInt(),
                    ),
                    onTapOutside: (_) => FocusScope.of(context).unfocus(),
                    onEditingComplete: () => newNote(
                      bloc,
                      context,
                    ),
                    onChanged: (value) => bloc.add(
                      ContentChanged(TextEditingController(text: value)),
                    ),
                  ),
                  const Spacer(flex: 9),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
