class AdvertisingQuery {
  String getAllAdvertising() {
    return """
    query {
      advert {
        id
        title
        description
        company
        imgUrl
        status
      }
    }
    """;
  }

  String getSingleAdvertising() {
    return """
    query advert (\$id: ID!){
      advert (id: \$id) {
        title
        description
        company
        imgUrl
        status
      }
    }  
    """;
  }
}
