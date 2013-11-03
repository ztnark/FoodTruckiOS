class TruckDetailsController < UIViewController
  def loadView
    self.view = UIWebView.alloc.init
  end

  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(false, animated:true)
  end

  def showDetailsForTruck(truck)
    navigationItem.title = truck.title
    request = NSURLRequest.requestWithURL(truck.url)
    view.loadRequest(request)
  end
end
