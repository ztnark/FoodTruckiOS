class TruckListController < UITableViewController
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('List', image:UIImage.imageNamed('list.png'), tag:1)
    end
    self
  end

  def viewDidLoad
    view.dataSource = view.delegate = self
  end

  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(true, animated:true)
  end

  def tableView(tableView, numberOfRowsInSection:section)
    Truck::All.size
  end

  CELLID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELLID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CELLID)
      cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton
      cell
    end

    truck = Truck::All[indexPath.row]
    cell.textLabel.text = truck.title
    cell
  end

  def tableView(tableView, accessoryButtonTappedForRowWithIndexPath:indexPath)
    truck = Truck::All[indexPath.row]
    controller = UIApplication.sharedApplication.delegate.truck_details_controller
    navigationController.pushViewController(controller, animated:true)
    controller.showDetailsForTruck(truck)
  end
end
