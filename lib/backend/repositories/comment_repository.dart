import '../models/comment.dart';

abstract class CommentRepository {
  //add
  //update
  //remove
  //find

  Future<Comment> add(Comment newComment);
  Future<Comment> update(Comment commentToUpdate);
  Future<bool> remove(int commentId);
  Future<List<Comment>> findAll();
  Future<List<Comment>> findByPostId(int postId);
}
