import 'package:equatable/equatable.dart';

class FQAEntity extends Equatable {
  final String questionEn;
  final String answerEn;

  FQAEntity({required this.questionEn,required this.answerEn});

  @override
  // TODO: implement props
  List<Object?> get props => [answerEn,questionEn];

}
