ProductCategory.delete_all
ProductCategory.create! id: 1, name: "accessories", description: "null"
ProductCategory.create! id: 2, name: "necklace", description: "null"
ProductCategory.create! id: 3, name: "rings", description: "null"
ProductCategory.create! id: 4, name: "earings", description: "null"

Product.delete_all
Product.create! id: 1, name: "Mid-Century Modern Solid Walnut ", price: 200, active: true, product_category_id: 1
Product.create! id: 2, name: "Pallet Sign / Last Name Sign", price: 300, active: true, product_category_id: 2
Product.create! id: 3, name: "Fireplace Mantel", price: 400, active: true, product_category_id: 3

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"