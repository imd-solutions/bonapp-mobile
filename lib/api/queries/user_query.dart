class UserQuery {
  // Get all titles.
  String getTitles() {
    return """
      query {
        titles {
          id
          name  
        }
      }""";
  }

  // Get all users
  String getUsers() {
    return """
      query {
        users {
          name  
        }
      }""";
  }

  // Get a single user from ID.
  String getUser() {
    return """
      query user (\$userID: ID!){
        user (id: \$userID) {
          name  
        }
      }""";
  }
}
