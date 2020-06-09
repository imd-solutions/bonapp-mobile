class PageQuery {
  String getSinglePage() {
    return """
            query page (\$id: ID!) {
                page (id: \$id) {
                    title              
                    body
                }
              }    
          """;
  }
}
