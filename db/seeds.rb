ProductCategory.delete_all
ProductCategory.create! id: 1, name: "accessories", description: "null"
ProductCategory.create! id: 2, name: "necklace", description: "null"
ProductCategory.create! id: 3, name: "rings", description: "null"
ProductCategory.create! id: 4, name: "earings", description: "null"

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"