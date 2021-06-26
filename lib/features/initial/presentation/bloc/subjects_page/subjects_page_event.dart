part of 'subjects_page_bloc.dart';

@immutable
abstract class SubjectsPageEvent extends Equatable{

  @override
  List<Object> get props =>[];
}

class GetSubject extends SubjectsPageEvent{}