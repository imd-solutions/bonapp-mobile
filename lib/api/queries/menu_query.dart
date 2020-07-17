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
            query menuitems (\$id: ID!) {
             menuitems (user_id: \$id) {
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

  // Get all the menu items.
  String getItemsCategory() {
    return """
            query menuitemsCategory (\$id: ID, \$cid: ID) {
             menuitemsCategory (user_id: \$id, category_id: \$cid) {
                id
                name
                subtitle
                description
                price
                imgUrl 
                pivot {
                  main_price
                  qty
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

  // Get a single menu item.
  String getShopItem() {
    return """
            query menuitemShop (\$id: ID, \$pid: ID)  {
               menuitemShop (user_id: \$id, menuitem_id: \$pid) {
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
                  main_price
                  qty
                } 
              }
            }
      """;
  }

  // Get featured menu items.
  String getFeaturedItems() {
    return """
            query menuitemFeatured (\$id: ID)  {
             menuitemFeatured (user_id: \$id) {
                id
                name
                subtitle
                description
                price
                imgUrl 
                pivot {                 
                  main_price
                  qty
                }   
              }
            }
      """;
  }

  // Get pick of the day items.
  String getPickOfDayItems() {
    return """
            query menuitemPickOfDay (\$id: ID)   {
             menuitemPickOfDay (user_id: \$id) {
              id
                name
                subtitle
                description
                price
                imgUrl
                pivot {                                
                  main_price
                  qty
                }    
              }
            }
      """;
  }
}
