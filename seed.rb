20.times do |x|
  Truck.create(name: "Test #{x}", latitude: "41.8#{rand(5..9)}#{rand(1..9)}400", longitude: "-87.6#{rand(2..5)}#{rand(1..9)}3044", url: "http://www.test.com")
end
