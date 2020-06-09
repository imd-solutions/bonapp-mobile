class MessagesQuery {

  String getAllUserMessages() {
    return """
      query userMessages (\$uid: Int!){
        userMessages (uid: \$uid) {
          id
          title
          body
          read
          created_at
        }
      }""";
  }
}