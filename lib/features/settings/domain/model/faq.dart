// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Faq {
  String question;
  String answer;
  bool isLiked;
  Faq({
    required this.question,
    required this.answer,
    required this.isLiked,
  });

  Faq copyWith({
    String? question,
    String? answer,
    bool? isLiked,
  }) {
    return Faq(
      question: question ?? this.question,
      answer: answer ?? this.answer,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'answer': answer,
      'isLiked': isLiked,
    };
  }

  factory Faq.fromMap(Map<String, dynamic> map) {
    return Faq(
      question: map['question'] as String,
      answer: map['answer'] as String,
      isLiked: map['isLiked'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Faq.fromJson(String source) => Faq.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Faq(question: $question, answer: $answer, isLiked: $isLiked)';

  @override
  bool operator ==(covariant Faq other) {
    if (identical(this, other)) return true;
  
    return 
      other.question == question &&
      other.answer == answer &&
      other.isLiked == isLiked;
  }

  @override
  int get hashCode => question.hashCode ^ answer.hashCode ^ isLiked.hashCode;
}
