class FaqQuery {

  String getActiveFAQ() {
    return """
            query {
              activeFaq {
                question
                answer
              }
            }
            """;
  }
}