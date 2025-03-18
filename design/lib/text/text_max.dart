part of 'text_interface.dart';

class IndexTextMax extends _TextInterface {
  const IndexTextMax(
    super.data, {
    super.key,
    super.color,
    super.overFlowFade,
    super.maxLines,
    super.height,
    super.textAlign,
    super.defaultScale,
    super.decoration,
    super.fontWeight,
    super.softWrap,
  });

  @override
  double Function(BuildContext context) get fontSize =>
      (BuildContext context) => _getFontSize(context, 0.055, 18);
}
