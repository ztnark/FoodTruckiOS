20.times do |x|
  Truck.create(name: @names.shuffle.pop, latitude: "41.8#{rand(5..9)}#{rand(1..9)}400", longitude: "-87.6#{rand(2..5)}#{rand(1..9)}3044", url: "http://www.test.com")
end

@names = ["Jerk 312",
        "Fat Shallot",
        "Toasty Cheese",
        "Yum Dum Truck",
        "Babycakes Gourment",
        "The Roost",
        "Beavers Donuts",
        "Caponies Express",
        "Schnitzel King",
        "Two Italians",
        "Duck n' Roll",
        "ChiTown Tamale",
        "La Adelita",
        "Samich Box",
        "Chubby Wieners",
        "Curried",
        "Ja' Grill",
        "Haute Sausage",
        "Taquero Fusion",
        "Steakwich",
        "Wagya Wagon"]
