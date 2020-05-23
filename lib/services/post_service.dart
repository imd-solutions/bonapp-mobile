import 'package:flutter_bonapp/api/queries/post_query.dart';
import 'package:flutter_bonapp/config/graphql.dart';
import 'package:flutter_bonapp/models/post.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

PostQuery postQuery = PostQuery();

class PostService {

  Future<List<Post>> getPosts() async {
    GraphQLClient _posts = graphQLConfiguration.clientToQuery();
    QueryResult response = await _posts.query(
      QueryOptions(
        documentNode: gql(
          postQuery.getPosts(),
        ),
      ),
    );

    if (response.hasException) {
      throw new Exception();
    }

    final result = response.data;

    Iterable list = result['posts'];

    return list.map((post) => Post.fromJson(post)).toList();
  }

  Future<List<Post>> getLatestPosts(limit) async {
    GraphQLClient _sliders = graphQLConfiguration.clientToQuery();
    QueryResult response = await _sliders.query(
      QueryOptions(
        documentNode: gql(
          postQuery.getLatestPosts(),
        ),
        variables: {"limit": limit},
      ),
    );

    if (response.hasException) {
      throw new Exception();
    }

    final result = response.data;

    Iterable list = result['latestPosts'];

    return list.map((latestPost) => Post.fromJson(latestPost)).toList();
  }

  Future<Post> getPost(id) async {
    GraphQLClient _sliders = graphQLConfiguration.clientToQuery();
    QueryResult response = await _sliders.query(
      QueryOptions(
        documentNode: gql(
          postQuery.getLatestPosts(),
        ),
        variables: {"id": id},
      ),
    );

    if (response.hasException) {
      throw new Exception();
    }

    final result = response.data;

    return Post(
      title: result['posts']['title'],
      excerpt: result['posts']['excerpt'],
      body: result['posts']['body'],
      image: result['posts']['image'],
      status: result['posts']['status'],
    );
  }
}
