class MenuQuery {
  // Get the all the menus.
  String getMenus() {
    return """
            query {
              menucategories {
                name
                description
                imgUrl
                items {
                  name
                  description
                  price
                  imgUrl
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
                name
                description
                imgUrl
                items {
                  name
                  description
                  price
                  imgUrl
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
                name
                description
                price
                imgUrl    
              }
            }
      """;
  }

  // Get a single menu item.
  String getItem() {
    return """
            query menuitem (\$id: ID!)  {
               menuitem (id: 1) {
                name
                description
                price
                imgUrl    
              }
            }
      """;
  }

  // Get featured menu items.
  String getFeaturedItems() {
    return """
            query {
             menuitemFeatured {
                name
                description
                price
                imgUrl    
              }
            }
      """;
  }
}
