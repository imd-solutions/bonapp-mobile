class LegalQuery {
  String getLegalOrder() {
    return """
            query {
              legalsOrder {
                id
                name
                description 
                slug 
                link
                order
              }
            }
            """;
  }
}
