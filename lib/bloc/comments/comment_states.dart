import 'package:counter_bloc/model/comments_model.dart';
import 'package:counter_bloc/utils/post_status.dart';
import 'package:equatable/equatable.dart';

class CommentsState extends Equatable {
  final Status status;
  final List<CommentsModel> commentsList;
  final String message;

  const CommentsState({this.status = Status.loading, this.commentsList = const <CommentsModel>[], this.message = ''});

  CommentsState copyWith({Status? status, List<CommentsModel>? commentsList, String? message}) {
    return CommentsState(
        status: status ?? this.status,
        commentsList: commentsList ?? this.commentsList,
        message: message ?? this.message);
  }

  @override
  List<Object?> get props => [];
}
