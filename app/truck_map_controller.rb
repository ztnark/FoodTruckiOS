class TruckMapController < UIViewController
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Map', image:UIImage.imageNamed('map.png'), tag:1)
    end
    self
  end

  def loadView
    self.view = MKMapView.alloc.init
    view.delegate = self
  end

  def viewDidLoad
    view.frame = tabBarController.view.bounds

    # Center on Brussels.
    region = MKCoordinateRegionMake(CLLocationCoordinate2D.new(41.897640, -87.643304), MKCoordinateSpanMake(0.03, 0.03))
    self.view.setRegion(region)

    BubbleWrap::HTTP.get("http://peaceful-waters-6955.herokuapp.com/all") do |response|
      json_trucks = BW::JSON.parse(response.body)
      json_trucks.each do |truck|
        Truck::All.push(Truck.new(truck[:latitude],truck[:longitude], truck[:name], 'http://www.yelp.com/biz/la-adelita-truck-chicago'))
        Truck::All.each { |truck| self.view.addAnnotation(truck) }
      end
    end
  end

  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(true, animated:true)
  end

  ViewIdentifier = 'ViewIdentifier'
  def mapView(mapView, viewForAnnotation:truck)
    if view = mapView.dequeueReusableAnnotationViewWithIdentifier(ViewIdentifier)
      view.annotation = truck
    else
      view = MKPinAnnotationView.alloc.initWithAnnotation(truck, reuseIdentifier:ViewIdentifier)
      view.canShowCallout = true
      view.image = UIImage.imageNamed('truck.png')
      # view.animatesDrop = true
      button = UIButton.buttonWithType(UIButtonTypeDetailDisclosure)
      button.addTarget(self, action: :'showDetails:', forControlEvents:UIControlEventTouchUpInside)
      view.rightCalloutAccessoryView = button
    end
    view
  end

  def showDetails(sender)
    if view.selectedAnnotations.size == 1
      truck = view.selectedAnnotations[0]
      controller = UIApplication.sharedApplication.delegate.truck_details_controller
      navigationController.pushViewController(controller, animated:true)
      controller.showDetailsForTruck(truck)
    end
  end
end
