class UserMutation {
  // Register the user.
  String loginUser() {
    return """
      mutation login (\$data: LoginInput) {
        login (data: \$data) {
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
      mutation userCreate (\$data: UserInput) {
        userCreate (data: \$data) {
          name
          email
          profile {
            firstname
            lastname
            dob
            phone_number
            mobile_number
          }    
        }
      }
      """;
  }

  // User forgotten password.
  String forgottenPassword() {
    return """
      mutation forgotPassword (\$data: ForgotPasswordInput!) {
        forgotPassword (data: \$data) {
         status
         message 
        }
      }
      """;
  }
}
