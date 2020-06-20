class MessagesMutation {
  String markMessageAsRead() {
    return """
    mutation markMessageAsRead (\$id: Int) {
      markMessageAsRead (id: \$id) {
        status
        message
      }
    }
    """;
  }

  String deleteMessage() {
    return """
    mutation deleteMessage (\$id: Int) {
      deleteMessage (id: \$id) {
        status
        message
      }
    }""";
  }
}
