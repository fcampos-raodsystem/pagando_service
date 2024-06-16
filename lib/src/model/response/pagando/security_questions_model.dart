/// Model for response
class SecurityQuestionsModel {
  /// Constructor for SecurityQuestionsModel
  SecurityQuestionsModel({required this.message, required this.data});

  factory SecurityQuestionsModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Question> questionList = list.map((i) => Question.fromJson(i as Map<String, dynamic>)).toList();

    return SecurityQuestionsModel(
      message: json['message'].toString(),
      data: questionList,
    );
  }

  /// [message] is a string
  final String message;

  /// [data] is a List of [Question]
  final List<Question> data;
}

/// Model for Question
class Question {
  /// Constructor for Question
  Question({required this.id, required this.question});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['_id'].toString(),
      question: json['question'].toString(),
    );
  }

  /// [id] is a string
  final String id;

  /// [question] is a string
  final String question;
}
