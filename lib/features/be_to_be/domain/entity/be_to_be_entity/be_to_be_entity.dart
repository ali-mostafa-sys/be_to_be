import 'package:equatable/equatable.dart';

class BeToBeEntity extends Equatable{
  final String firstName;

  const BeToBeEntity({required this.firstName});
  @override
  // TODO: implement props
  List<Object?> get props => [firstName];


}