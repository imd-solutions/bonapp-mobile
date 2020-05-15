class UserMutation {
  // Register the user.
  String loginUser() {
    return """
      mutation login (\$input: LoginInput) {
        login (input: \$input) {
          user {
            name
            email
            email_verified_at
            profile {
              firstname
              lastname
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
}
