class MenuQuery {
  // Get the all the menus.
  String getMenus() {
    return """
            query {
              menucategories {
                id
                name
                description
                imgIcon   
                imgUrl
                items {
                  id
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

  // Get a single menu.
  String getMenu() {
    return """
            query menucategory (\$id: ID!) {
               menucategory(id: \$id) {
                id
                name
                description
                imgIcon   
                imgUrl
                items {
                  id
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

  // Get all the menu items.
  String getItems() {
    return """
            query {
             menuitems {
                id
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
      """;
  }

  // Get a single menu item.
  String getItem() {
    return """
            query menuitem (\$id: ID!)  {
               menuitem (id: \$id) {
                id
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
      """;
  }

  // Get featured menu items.
  String getFeaturedItems() {
    return """
            query {
             menuitemFeatured {
                id
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
      """;
  }

  // Get pick of the day items.
  String getPickOfDayItems() {
    return """
            query {
             menuitemPickOfDay {
              id
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
      """;
  }
}
