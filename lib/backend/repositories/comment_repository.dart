import '../models/comment.dart';

abstract class CommentRepository {
  //add
  //update
  //remove
  //find

  Comment add(Comment newComment);
  Comment update(Comment commentToUpdate);
  bool remove(int commentId);
  List<Comment> findAll();
  List<Comment> findByPostId(int postId);
}
