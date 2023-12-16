# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Users
user1 = User.create(
  email: 'leo.diaz.trejo@gmail.com',
  password: '123456',
  name: 'Leo',
  last_name: 'Diaz',
  total_virtual_cash: 335.00
)
file = URI.open("https://avatars.githubusercontent.com/u/142075557?v=4")
user1.photo.attach(io: file, filename: "leo.png", content_type: "image/png")
# Antonio es comprador
user1.save
puts "El usuario #{user1.name} se a creado correctamente"

user2 = User.create(
  email: 'antoniovillalobos@gmail.com',
  password: '123456',
  name: 'Antonio',
  last_name: 'Villalobos',
  total_virtual_cash: 435.00
)

file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1676405509/obzjnjjiruvajinkvmsl.jpg")
user2.photo.attach(io: file, filename: "antonio.png", content_type: "image/png")
user2.save
puts "El usuario #{user2.name} se a creado correctamente"
# Marco es vendedor y comprador

user3 = User.create(
  email: 'marco.soria@pucp.edu.pe',
  password: '123456',
  name: 'Marco',
  last_name: 'Soria',
  total_virtual_cash: 535.00
)

file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1691789898/y5axo3cnuidqdr4p6cpj.jpg")
user3.photo.attach(io: file, filename: "marco.png", content_type: "image/png")
user3.save
puts "El usuario #{user3.name} se a creado correctamente"

# Products

product1 = Product.new(
  title: 'Pares Calcetines Bamboo Deportivos',
  description: 'Pack de 12 pares de calcetines cortos, tobilleras, lisos de fibra de Bamboo lo que impide el mal olor.Talla estándar que abarca numero 39 al 45.',
  quantity: 100,
  price: 15.99,
  user: user1,
)

file = URI.open("https://res.cloudinary.com/dyptqsblk/image/upload/v1702602003/calcetines_bamboo_fxplm4.png")
product1.photo.attach(io: file, filename: "calcetines_bamboo.png", content_type: "image/png")
product1.save
puts "El producto #{product1.title} se a creado correctamente"

product2 = Product.new(
  title: 'Toallita Húmeda 99.9% Agua Biodegradables',
  description: 'Cada toallita está hecha de tela hipoalergénica de fibras de bambú con aceites esenciales. Estas wipes son orgánicas, hipoalergénicas, compostables en casa y 100% biodegradables. Libres de químicos nocivos y alcohol. Además, traen en su empaque una tapa dispensadora que las hace super cómodas para cambiar a tu bebé',
  quantity: 50,
  price: 20.99,
  user: user2,
)

file = URI.open("https://http2.mlstatic.com/D_NQ_NP_830568-MLC53827511681_022023-O.webp")
product2.photo.attach(io: file, filename: "calcetines_bamboo.png", content_type: "image/png")
product2.save
puts "El producto #{product2.title} se a creado correctamente"


product3 = Product.new(
  title: 'Compostera',
  description: 'Para que reciclen gran parte de sus desechos y produzcan su propio abono. Incluye : Vermicompostera, Manual PDF con todos los cuidados',
  quantity: 10,
  price: 88.99,
  user: user3,
)

file = URI.open("https://http2.mlstatic.com/D_NQ_NP_920366-MLC40345636342_012020-O.webp")
product3.photo.attach(io: file, filename: "calcetines_bamboo.png", content_type: "image/png")
product3.save
puts "El producto #{product3.title} se a creado correctamente"

product4 = Product.new(
  title: 'Cepillos de dientes de bambu',
  description: 'Pack 12 unidades cepillo de dientes Bambú cerdas de fibra de carbón. Ecológico, biodegradable.',
  quantity: 15,
  price: 12.99,
  user: user1,
)

file = URI.open("https://http2.mlstatic.com/D_NQ_NP_978507-MLC43947713256_102020-O.webp")
product4.photo.attach(io: file, filename: "cepillo_bamboo.png", content_type: "image/png")
product4.save
puts "El producto #{product4.title} se a creado correctamente"

product5 = Product.new(
  title: 'Zapatero Y Banco De Bambú',
  description: 'Zapatero y banco de bambú, el producto viene separado en partes, con instrucciones para su armado',
  quantity: 15,
  price: 40.99,
  user: user2,
)

file = URI.open("https://http2.mlstatic.com/D_NQ_NP_637746-MLC69202031360_052023-O.webp")
product5.photo.attach(io: file, filename: "zapatero_bamboo.png", content_type: "image/png")
product5.save
puts "El producto #{product5.title} se a creado correctamente"

product6 = Product.new(
  title: 'Bolsas De Basura Biodegradable',
  description: 'Bolsa de Basura Ecológica Pequeña para Escritorio o Baño. 100 unidades por rollo. 37 x 51 cms.',
  quantity: 15,
  price: 7.00,
  user: user1,
)

file = URI.open("https://http2.mlstatic.com/D_NQ_NP_936496-MLC50512378463_062022-O.webp")
product6.photo.attach(io: file, filename: "bolsas_de_basura.png", content_type: "image/png")
product6.save
puts "El producto #{product6.title} se a creado correctamente"

product7 = Product.new(
  title: 'Set Envoltorio Reutilizable Algodón Y Cera De Abeja',
  description: 'Envoltorios de tela de algodón con cera de abeja que permite envolver fuentes o alimentos para mantener su condición. Son reutilizables y una vez que pierden su vida útil los puedes compostar.',
  quantity: 15,
  price: 7.00,
  user: user1,
)

file = URI.open("https://http2.mlstatic.com/D_NQ_NP_803057-MLC43207227180_082020-O.webp")
product7.photo.attach(io: file, filename: "envoltorio_compostable-png", content_type: "image/png")
product7.save
puts "El producto #{product7.title} se a creado correctamente"


