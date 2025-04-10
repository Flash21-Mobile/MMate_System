part of 'text_interface.dart';

class IndexTextUltra extends _TextInterface {
  const IndexTextUltra(
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
      (BuildContext context) => _getFontSize(context, 0.065, 27);
}
