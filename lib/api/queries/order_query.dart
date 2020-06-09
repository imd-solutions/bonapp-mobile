class OrderQuery {
  String getUserOrders() {
    return """
            query userOrders (\$uid: Int){
                userOrders (uid: \$uid) {
                  id
                  status                 
                  billing_subtotal
                  billing_tax
                  billing_total
                  payment_method
                  payment_status
                  created_at
                  items {
                    name
                    subtitle
                    description
                    price
                    imgUrl
                    pivot {
                      quantity
                      price
                      total_price
                    }
                  }
                }
              } 
          """;
  }
}
