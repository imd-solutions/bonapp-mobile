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

  // Get all locations.
  String getLocations() {
    return """
      query {
        sites {
          id
          name  
        }
      }""";
  }

  // Get all professions.
  String getProfessions() {
    return """
      query {
        professions {
          id
          title
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
      query user (\$id: ID!){
        user (id: \$id) {
          name
          profile {
            firstname
            lastname
            alerts {
               email
               notification
               text
            }
          }
        }
      }""";
  }
}
