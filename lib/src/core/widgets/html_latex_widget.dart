import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HtmlLatexWidget extends StatelessWidget {
  final String htmlContent;
  final TextStyle? style;
  final TextAlign? textAlign;

  const HtmlLatexWidget({
    super.key,
    required this.htmlContent,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      htmlContent,
      textStyle: style,
      customStylesBuilder: (element) {
        if (element.classes.contains('math-tex')) {
          return {
            'color': '#FF6B35', 
            'font-weight': 'bold',
            'font-family': 'monospace',
            'background-color': '#FFF3E0',
            'padding': '2px 4px',
            'border-radius': '4px',
            'border': '1px solid #FFB74D',
          };
        }
        return null;
      },
      customWidgetBuilder: (element) {
        if (element.localName == 'br') {
          return const SizedBox(height: 8);
        }
        return null;
      },
      onTapUrl: (url) {
        // Обработка ссылок
        return true;
      },
      renderMode: RenderMode.column,
    );
  }
} 