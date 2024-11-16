import 'package:equatable/equatable.dart';

abstract class CommentsEvents extends Equatable {
  const CommentsEvents();

  @override
  List<Object> get props => [];
}

class FetchComments extends CommentsEvents {}
