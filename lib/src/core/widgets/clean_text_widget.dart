import 'package:flutter/material.dart';

class CleanTextWidget extends StatelessWidget {
  final String content;
  final TextStyle? style;
  final TextAlign? textAlign;

  const CleanTextWidget({
    super.key,
    required this.content,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    // Очищаем HTML и удаляем LaTeX формулы
    final cleanedContent = _removeLatexFromHtml(content);
    
    return Text(
      cleanedContent,
      style: style,
      textAlign: textAlign,
    );
  }

  String _removeLatexFromHtml(String htmlContent) {
    String cleanedContent = htmlContent;
    
    // Удаляем span теги с math-tex классом полностью
    cleanedContent = cleanedContent.replaceAllMapped(
      RegExp(r'<span class="math-tex">.*?</span>', dotAll: true),
      (match) => '', // Заменяем на пустую строку
    );
    
    // Удаляем LaTeX формулы в скобках \(...\)
    cleanedContent = cleanedContent.replaceAllMapped(
      RegExp(r'\\\([^)]*\\\)'),
      (match) => '',
    );
    
    // Удаляем LaTeX формулы в квадратных скобках \[...\]
    cleanedContent = cleanedContent.replaceAllMapped(
      RegExp(r'\\\[[^\]]*\\\]'),
      (match) => '',
    );
    
    // Заменяем HTML теги на обычный текст
    cleanedContent = cleanedContent.replaceAll('<br />', '\n');
    cleanedContent = cleanedContent.replaceAll('<br>', '\n');
    cleanedContent = cleanedContent.replaceAll('&nbsp;', ' ');
    
    // Удаляем остальные HTML теги
    cleanedContent = cleanedContent.replaceAll(RegExp(r'<[^>]*>'), '');
    
    // Декодируем HTML сущности
    cleanedContent = _decodeHtmlEntities(cleanedContent);
    
    return cleanedContent.trim();
  }
  
  /// Декодирует HTML сущности
  String _decodeHtmlEntities(String text) {
    return text
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll('&nbsp;', ' ');
  }
} 