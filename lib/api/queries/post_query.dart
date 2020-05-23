class PostQuery {
  String getPosts() {
    return """
      query {
          posts  {
              id
              title
              excerpt
              body
              image
              status
          }
      }
    """;
  }
  String getLatestPosts() {
    return """
      query latestPosts (\$limit: Int){
          latestPosts (limit: \$limit) {
              id
              title
              excerpt
              body
              image
              status
          }
      }
    """;
  }

  String getPost() {
    return """
        query post (\$id: ID!) {
          post (id: \$id) {
              title
              excerpt
              body
              image
              status
          }
        }    
    """;
  }
}
