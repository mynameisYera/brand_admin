import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:brand_admin/src/core/service/storage/flutter_secure_storage.dart';
import 'package:brand_admin/src/core/api/client/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:brand_admin/src/core/widgets/custom_button.dart';
import 'dart:convert';

import 'package:brand_admin/src/features/main/data/models/task_model.dart';

class SendCheckWidget extends StatelessWidget {
  const SendCheckWidget({super.key, required this.question, required this.questionId, required this.choiceId, required this.answer, required this.matchingPairs, required this.type});
  final String question;
  final int questionId;
  final int choiceId;
  final String answer;
  final MatchingPairsModel matchingPairs;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.assignment_turned_in,
                    color: Theme.of(context).primaryColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Проверка задания',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Отправка ответа на проверку',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Question display
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey[200]!,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.help_outline,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Вопрос:',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    question,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[800],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      print("questionId: $questionId");
                      print("choiceId: $choiceId");
                      print("answer: $answer");
                      print("type: $type");

                      if (type == 'matching-pairs') {
                        SendPostRequest(questionId: questionId, choiceId: choiceId, answer: answer, matchingPairs: matchingPairs, context: context).matchesRequest();
                      } else if (type == 'multiple-choice') {
                        SendPostRequest(questionId: questionId, choiceId: choiceId, answer: answer, matchingPairs: matchingPairs, context: context).choiceRequest();
                      } else if (type == 'fill-in-the-blank') {
                        SendPostRequest(questionId: questionId, choiceId: choiceId, answer: answer, matchingPairs: matchingPairs, context: context).answerRequest();
                      }
                    },
                    title: 'Отправить на проверку',
                    isLoading: false,
                    isDisabled: false,
                    width: double.infinity,
                    height: 48,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey[300]!,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Center(
                          child: Text(
                            'Отмена',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.blue[200]!,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 16,
                    color: Colors.blue[600],
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Ваш ответ будет отправлен на проверку.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue[700],
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SendPostRequest{
  final int questionId;
  final int choiceId;
  final String answer;
  final MatchingPairsModel matchingPairs;
  final BuildContext context;

  SendPostRequest({required this.questionId, required this.choiceId, required this.answer, required this.matchingPairs, required this.context});

  Map<String, String> choiceToJson() => {
    'choice_id': choiceId.toString(),
  };
  Map<String, String> answerToJson() => {
    'answer': answer,
  };

  Map<String, List<int>> matchesToJson() => {
    'left_id': matchingPairs.leftItems.map((item) => item.leftId ?? 0).toList(),
    'right_id': matchingPairs.rightItems.map((item) => item.rightId ?? 0).toList(),
  };

  
  Future<String> getToken() async {
    String? token = await FlutterSecureStorageWeb().getToken();
    return token ?? '';
  }

  Future<bool> matchesRequest() async {
    final matches = List.generate(
      matchingPairs.leftItems.length,
      (index) => {
        "left_id": matchingPairs.leftItems[index].leftId ?? 0,
        "right_id": matchingPairs.rightItems[index].rightId ?? 0,
      },
    );

    final response = await http.post(
      Uri.parse('${EndPoints.baseUrl}${EndPoints.qualityTasksCheck(questionId)}'),
      body: jsonEncode({"matches": matches}),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${await getToken()}',
      },
    );

    print(response.body);

    if (response.statusCode == 200) {
      context.pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ответ отправлен на проверку'),
          backgroundColor: Colors.green,
        ),
      );
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ошибка при отправке ответа на проверку'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }


  Future<bool> choiceRequest() async {
    final response = await http.post(
      Uri.parse('${EndPoints.baseUrl}${EndPoints.qualityTasksCheck(questionId)}'), 
      body: jsonEncode(choiceToJson()), 
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${await getToken()}',
      }
    );
    print(response.body);
    if (response.statusCode == 200) {
      context.pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ответ отправлен на проверку'),
          backgroundColor: Colors.green,
        ),
      );
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ошибка при отправке ответа на проверку'),
          backgroundColor: Colors.red,
        ),
      );
        return false;
    }
  }

  Future<bool> answerRequest() async {
    final response = await http.post(
      Uri.parse('${EndPoints.baseUrl}${EndPoints.qualityTasksCheck(questionId)}'),
      body: jsonEncode(answerToJson()),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${await getToken()}',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      context.pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ответ отправлен на проверку'),
          backgroundColor: Colors.green,
        ),
      );
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ошибка при отправке ответа на проверку'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }
}