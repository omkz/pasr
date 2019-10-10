Product.delete_all
Product.create! id: 1, name: "Banana", price: 0.49, active: true
Product.create! id: 2, name: "Apple", price: 0.29, active: true
Product.create! id: 3, name: "Carton of Strawberries", price: 1.99, active: true

ProductCategory.delete_all
ProductCategory.create! id: 1, name: "accessories", description: "null"
ProductCategory.create! id: 1, name: "necklace", description: "null"
ProductCategory.create! id: 1, name: "rings", description: "null"
ProductCategory.create! id: 1, name: "earings", description: "null"

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"