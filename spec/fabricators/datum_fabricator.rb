Fabricator(:datum) do
  value { Faker::Number.decimal(l_digits: 1, r_digits: 1) }
  day { (1...50).to_a.sample }
end