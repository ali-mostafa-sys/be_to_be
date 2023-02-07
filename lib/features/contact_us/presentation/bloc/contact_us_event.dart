part of 'contact_us_bloc.dart';

abstract class ContactUsEvent extends Equatable {
  const ContactUsEvent();
  @override
  List<Object> get props => [];
}

class GetContactUsEvent extends ContactUsEvent{}


