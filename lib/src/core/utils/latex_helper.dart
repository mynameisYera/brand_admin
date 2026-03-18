class LatexHelper {
  /// Извлекает LaTeX формулы из HTML контента
  static String extractLatexFromHtml(String htmlContent) {
    // Удаляем HTML теги, но сохраняем LaTeX формулы
    String cleanedContent = htmlContent;
    
    // Заменяем HTML теги на обычный текст
    cleanedContent = cleanedContent.replaceAll('<br />', '\n');
    cleanedContent = cleanedContent.replaceAll('<br>', '\n');
    cleanedContent = cleanedContent.replaceAll('&nbsp;', ' ');
    
    // Удаляем span теги с math-tex классом, но сохраняем содержимое
    cleanedContent = cleanedContent.replaceAllMapped(
      RegExp(r'<span class="math-tex">(.*?)</span>', dotAll: true),
      (match) => match.group(1) ?? '',
    );
    
    // Удаляем остальные HTML теги
    cleanedContent = cleanedContent.replaceAll(RegExp(r'<[^>]*>'), '');
    
    // Декодируем HTML сущности
    cleanedContent = _decodeHtmlEntities(cleanedContent);
    
    return cleanedContent.trim();
  }
  
  /// Декодирует HTML сущности
  static String _decodeHtmlEntities(String text) {
    return text
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll('&nbsp;', ' ');
  }
  
  /// Проверяет, содержит ли текст LaTeX формулы
  static bool containsLatex(String text) {
    return text.contains('\\(') && text.contains('\\)') ||
           text.contains('\\[') && text.contains('\\]') ||
           text.contains('\\') && text.contains('{') && text.contains('}');
  }
  
  /// Очищает текст от HTML тегов, сохраняя LaTeX
  static String cleanHtmlKeepLatex(String htmlContent) {
    String cleaned = htmlContent;
    
    // Удаляем все HTML теги, кроме содержимого
    cleaned = cleaned.replaceAll(RegExp(r'<[^>]*>'), '');
    
    // Декодируем HTML сущности
    cleaned = _decodeHtmlEntities(cleaned);
    
    return cleaned.trim();
  }
} 