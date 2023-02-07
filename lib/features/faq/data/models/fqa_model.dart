import 'package:be_to_be/features/faq/domain/entity/fqa_entity.dart';

class FQAModel extends FQAEntity {
  FQAModel({required String questionEn, required String answerEn})
      : super(questionEn: questionEn, answerEn: answerEn);
  factory FQAModel.fromJson(Map<String,dynamic>json){
    final questionEn=json['questionEn'];
    final answerEn=json['answerEn'];
    return FQAModel(questionEn: questionEn, answerEn: answerEn);



  }
}
