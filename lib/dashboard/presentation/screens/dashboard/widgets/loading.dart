import 'package:note_book/common/presentation/export.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PlatformCircularProgressIndicator(
        material: (context, platform) => MaterialProgressIndicatorData(
          color: theme.primaryColor,
        ),
        cupertino: (context, platform) => CupertinoProgressIndicatorData(
            radius: 40, color: theme.primaryColor),
      ),
    );
  }
}
