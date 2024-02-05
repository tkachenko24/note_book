import 'package:note_book/common/presentation/export.dart';
import 'package:note_book/dashboard/export.dart';

import 'widgets/export.dart';

class DashboardScreen extends StatelessWidget {
  final void Function() addNote;
  final void Function(int) toDetail;
  final ThemeData theme;

  const DashboardScreen({
    super.key,
    required this.addNote,
    required this.toDetail,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    context.read<NotesBloc>().add(
          const FetchNotes(),
        );
    return PlatformScaffold(
      appBar: PlatformAppBar(
        backgroundColor: theme.primaryColor,
        title: BlocBuilder<NotesBloc, NotesState>(
          builder: (context, state) {
            return !state.someBool
                ? Text(
                    'Your notes',
                    style: Fonts.titleLarge
                        .copyWith(color: theme.scaffoldBackgroundColor),
                  )
                : PlatformSearchBar(
                    material: (context, platform) => MaterialSearchBarData(
                        constraints:
                            BoxConstraints.tight(const Size.fromHeight(40)),
                        hintStyle: MaterialStateProperty.all(
                          Fonts.bodyLarge.copyWith(color: theme.disabledColor),
                        ),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(horizontal: 10)),
                        hintText: 'Search'),
                    cupertino: (context, platform) => CupertinoSearchBarData(
                        prefixIcon: const SizedBox.shrink(),
                        onChanged: (value) =>
                            context.read<NotesBloc>().add(Search(value)),
                        decoration: BoxDecoration(
                            color: theme.scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(15))),
                  );
          },
        ),
        leading: BlocBuilder<NotesBloc, NotesState>(
          builder: (context, state) {
            return PlatformIconButton(
              padding: EdgeInsets.zero,
              onPressed: () =>
                  context.read<NotesBloc>().add(const SwitchBool()),
              icon: Icon(
                !state.someBool
                    ? PlatformIcons(context).search
                    : PlatformIcons(context).clear,
                size: 30,
                color: theme.scaffoldBackgroundColor,
              ),
            );
          },
        ),
        trailingActions: [
          PlatformIconButton(
            padding: EdgeInsets.zero,
            onPressed: () => addNote.call(),
            icon: Icon(
              PlatformIcons(context).add,
              size: 30,
              color: theme.scaffoldBackgroundColor,
            ),
          )
        ],
        cupertino: (context, platform) => CupertinoNavigationBarData(
            backgroundColor: theme.primaryColor,
            transitionBetweenRoutes: false),
      ),
      body: Material(
        child: BlocBuilder<NotesBloc, NotesState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (
            context,
            state,
          ) {
            return state.status.isLoading()
                ? Loading(theme: theme)
                : state.status.isSuccess()
                    ? state.notes.isNotEmpty
                        ? NoteList(
                            list: state.searchResult.isNotEmpty
                                ? state.searchResult
                                : state.notes,
                            toDetail: toDetail,
                            theme: theme,
                          )
                        : EmptyList(theme: theme)
                    : Failed(theme: theme);
          },
        ),
      ),
    );
  }
}
