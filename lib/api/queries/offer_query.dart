class OfferQuery {

  String getOffers() {
    return """
    query {      
      offers {
        id
        name
        description
        imgUrl
        status
      }
    }
    """;
  }

  String getOffer() {
    return """
    query offer (\$id: ID!) {
      offer (id: \$id) {
        name
        description
        imgUrl
        status
      }
    }
    """;
  }
}