class UserMutation {
  // Register the user.
  String loginUser() {
    return """
      mutation login (\$input: LoginInput) {
        login (input: \$input) {
          user {
            id
            name
            avatar
            email
            email_verified_at
            messages {
              id 
              title 
              body
              read 
              created_at
            }            
            orders {
              id
            }
            profile {
              firstname
              lastname
              mobile_number
              profession {
                id
                title
              }
              nationality {
                id
                name
              }
              site {
                id
                name
              }
              alerts {
               email
               notification
               text
              }
            }
          }   
        }
      }
      """;
  }

  // Register the user.
  String createUser() {
    return """
      mutation userCreate (\$input: UserInput) {
        userCreate (input: \$input) {
          name
          email
          profile {
            firstname
            lastname
          }    
        }
      }
      """;
  }

  // User forgotten password.
  String forgottenPassword() {
    return """
      mutation forgotPassword (\$input: ForgotPasswordInput!) {
        forgotPassword (input: \$input) {
         status
         message 
        }
      }
      """;
  }

  // Update the user information
  String updateUserDetails() {
    return """ 
      mutation updateUserDetails(\$input: UserDetailsInput) {
        updateUserDetails(input: \$input) {
           status
           message 
        }
      }
    """;
  }

  String uploadUserAvatar() {
    return """mutation uploadUserAvatar(\$id: Int!, \$file: Upload!) {
      uploadUserAvatar(id: \$id, file: \$file) {
           status
           message 
        }
    }""";
  }
}
