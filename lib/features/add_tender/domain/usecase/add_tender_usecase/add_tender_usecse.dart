
import 'package:be_to_be/core/errors/failures.dart';
import 'package:be_to_be/features/add_tender/domain/entity/add_tender_entity/add_tender_entity.dart';
import 'package:be_to_be/features/add_tender/domain/repositories/add_tender_repositories/add_tender_repositories.dart';
import 'package:dartz/dartz.dart';

class AddTenderUseCase {

  final AddTenderRepositories addTenderRepositories;
  const AddTenderUseCase({
    required this.addTenderRepositories
});

  Future<Either<Failure,Unit>>call(AddTenderEntity addTenderEntity)async{
    return await addTenderRepositories.postAddTender(addTenderEntity);
  }

}