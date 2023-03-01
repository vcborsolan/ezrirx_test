# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

products = [
  {sku: 'orange-fruit', name: 'Orange',
   description: 'The orange is a usually round or oval citrus; its rind and flesh are generally orange, except the varieties of red pulp. The edible part of the orange is the flesh, consumed in fresh or in juice. The orange is also used to make stewed fruit, jams, for consumption as dehydrated fruit, etc.'}, {sku: 'apple-fruit', name: 'Apple', description: 'The apple is one of the pome (fleshy) fruits. Apples at harvest vary widely in size, shape, colour, and acidity, but most are fairly round and some shade of red or yellow. The thousands of varieties fall into three broad classes: cider, cooking, and dessert varieties.'}, {sku: 'banana-fruit', name: 'Banana', description: 'The fruit is variable in size, color and firmness, but is usually elongated and curved, with soft flesh rich in starch covered with a rind which may be green, yellow, red, purple, or brown when ripe. The fruits grow in clusters hanging from the top of the plant.'}
]

sellers = [
  {username: 'George Michael', email: 'george@michael.com', password: 'george123', password_confirmation: 'george123',
   state: 'new york'}, {username: 'Alexander Usyk', email: 'alexander@usyk.com', password: 'alexander123', password_confirmation: 'alexander123', state: 'utah'}
]

buyers = [
  {username: 'Pedro leonardo', email: 'pedro@leonardo.com', password: 'pedro123', password_confirmation: 'pedro123',
   state: 'new york'}, {username: 'Thiago nascimento', email: 'thiago@nascimento.com', password: 'thiago123', password_confirmation: 'thiago123', state: 'utah'}
]

sellers.each {|seller| Seller.create(seller)}
buyers.each {|buyer| Buyer.create(buyer)}
products.each {|product| Product.create(product)}


sellers = Seller.all
products = Product.all

sellers.each do |seller|
  products.each do |product|
    SellerProduct.create(user_id: seller.id, product: product, price: rand(1.0..10.0), quantity: rand(1..100))
  end
end