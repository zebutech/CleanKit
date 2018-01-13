#
# Be sure to run `pod lib lint CleanKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CleanKit'
  s.version          = '0.1.0'
  s.summary          = 'A boilerplate for Swift 3+ projects using CleanSwift and VIP architecture'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A clean boilerplate for Swift 3+ projects using CleanSwift and VIP architecture.
There are some useful structs handling view-models for generic collection view, table view and picker view.
In addition, you can find some extensions for CGPoint, UICollectionView, UITableView, UIView, UIColor and String.
                       DESC

  s.homepage         = 'https://github.com/zebutech/CleanKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ludovic Riviere' => 'ludovic@zebutech.io' }
  s.source           = { :git => 'https://github.com/zebutech/CleanKit', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'CleanKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CleanKit' => ['CleanKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
