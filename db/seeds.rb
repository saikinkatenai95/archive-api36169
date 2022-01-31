5.times do
  name = Faker::Construction.subcontract_category
  Category.create!(name: name)
end

10.times do
  category_id = rand(1..3)
  body = Faker::Food.dish
  Idea.create!(category_id: category_id, body: body)
end