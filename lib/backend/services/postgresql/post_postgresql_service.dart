import './postgresql_connection_wrapper.dart';
import '../../models/post.dart';
import '../../repositories/post_repository.dart';

class PostPostgreSQLService implements PostRepository {
  PostgreSQLConnectionWrapper _connectionWrapper;

  PostPostgreSQLService(PostgreSQLConnectionWrapper this._connectionWrapper);

  @override
  Future<Post> add(Post newPost) async {
    if (newPost.postDate == null ||
        newPost.description == null ||
        newPost.photoId == null ||
        newPost.id == null ||
        newPost.userId == null) {
      throw new Exception("This post contains null information on it");
    }

    await _connectionWrapper.connection.query(
        "INSERT INTO posts (user_id, description, photo_id, post_date) VALUES (@userId, @description, @photoId, @postDate)",
        substitutionValues: {
          "userId": newPost.userId,
          "description": newPost.description,
          "photoId": newPost.photoId,
          "postDate": newPost.postDate
        });

    var result = await _connectionWrapper.connection.query(
        "SELECT id FROM posts WHERE user_id = @userId AND description = @description AND photo_id = @photoId AND post_date = @postDate",
        substitutionValues: {
          "userId": newPost.userId,
          "description": newPost.description,
          "photoId": newPost.photoId,
          "postDate": newPost.postDate
        });

    int newId = result.first.elementAt(0);
    return Post.fromNewPost(newId, newPost);
  }

  @override
  Future<Post> find(int postId) async {
    var result = await _connectionWrapper.connection.query(
        "SELECT user_id, description, photo_id, post_date FROM posts WHERE user_id = $postId");
    var post = new Post();
    post.id = postId;
    post.userId = result.first.elementAt(0);
    post.description = result.first.elementAt(1);
    post.photoId = result.first.elementAt(2);
    post.postDate = result.first.elementAt(3);

    return post;
  }

  @override
  Future<List<Post>> findAll() {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> findByCommentId(int commentId) {
    // TODO: implement findByCommentId
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> findByLikeId(int likeId) {
    // TODO: implement findByLikeId
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> findByUserId(int userId) {
    // TODO: implement findByUserId
    throw UnimplementedError();
  }

  @override
  Future<bool> remove(int postId) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<Post> update(Post postToUpdate) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
