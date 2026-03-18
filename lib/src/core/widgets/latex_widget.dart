import 'package:flutter/material.dart';
import 'package:brand_admin/src/core/utils/latex_helper.dart';

class LatexWidget extends StatelessWidget {
  final String content;
  final TextStyle? style;
  final TextAlign? textAlign;

  const LatexWidget({
    super.key,
    required this.content,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final cleanedContent = LatexHelper.extractLatexFromHtml(content);
    
    if (LatexHelper.containsLatex(cleanedContent)) {
      return _buildLatexContent(cleanedContent);
    } else {
      return Text(
        cleanedContent,
        style: style,
        textAlign: textAlign,
      );
    }
  }

  Widget _buildLatexContent(String cleanedContent) {
    // Разбиваем текст на части: обычный текст и LaTeX
    final parts = _splitTextAndLatex(cleanedContent);
    
    return RichText(
      text: TextSpan(
        children: parts.map((part) {
          if (part.isLatex) {
            return TextSpan(
              text: part.content,
              style: (style ?? const TextStyle()).copyWith(
                fontFamily: 'monospace',
                backgroundColor: Colors.yellow.withOpacity(0.3),
                fontWeight: FontWeight.bold,
              ),
            );
          } else {
            return TextSpan(
              text: part.content,
              style: style,
            );
          }
        }).toList(),
      ),
    );
  }

  List<_TextPart> _splitTextAndLatex(String text) {
    final List<_TextPart> parts = [];
    final RegExp latexRegex = RegExp(r'\\\(([^)]+)\\\)|\\\[([^\]]+)\\\]');
    
    int lastIndex = 0;
    final matches = latexRegex.allMatches(text);
    
    for (final match in matches) {
      if (match.start > lastIndex) {
        parts.add(_TextPart(
          content: text.substring(lastIndex, match.start),
          isLatex: false,
        ));
      }
      
      final latexContent = match.group(1) ?? match.group(2) ?? '';
      parts.add(_TextPart(
        content: latexContent,
        isLatex: true,
      ));
      
      lastIndex = match.end;
    }
    
    if (lastIndex < text.length) {
      parts.add(_TextPart(
        content: text.substring(lastIndex),
        isLatex: false,
      ));
    }
    
    return parts;
  }
}

class _TextPart {
  final String content;
  final bool isLatex;
  
  _TextPart({
    required this.content,
    required this.isLatex,
  });
} 