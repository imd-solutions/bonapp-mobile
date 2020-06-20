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

  String getUnreadUserMessages() {
    return """
      query userUnreadMessages (\$uid: Int!){
        userUnreadMessages (uid: \$uid) {
          id
          title
          body
          read
          created_at
        }
      }""";
  }
}
