import 'package:flutter/widgets.dart';

class VerticalSplitText extends StatelessWidget {
  const VerticalSplitText({
    super.key,
    required this.text,
    this.style,
    this.spacing = 12,
    this.upperCase = false,
  });

  final String text;
  final TextStyle? style;
  final double spacing;
  final bool upperCase;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: spacing,
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: _splitTextInLines().map((line) => _textLine(context, line)).toList(),
    );
  }

  Widget _textLine(BuildContext context, String line) {
    return Text(
      line,
      textAlign: TextAlign.center,
      style: style ?? DefaultTextStyle.of(context).style,
    );
  }

  List<String> _splitTextInLines() {
    final newText = upperCase ? text.toUpperCase() : text;
    return newText.split('');
  }
}
