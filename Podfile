target 'mytestapp' do
  use_frameworks!

  # Pods for mytestapp
  pod 'Moya', '~> 14.0'
  pod 'SwiftyJSON', '~> 4.0'
  pod 'SDWebImage', '~> 5.0'

  target 'mytestappTests' do
    inherit! :search_paths
    pod 'Nimble'
    pod 'Nimble-Snapshots'
    pod 'Quick'
  end

  target 'mytestappUITests' do
    pod 'KIF', :configurations => ['Debug']
  end

end
