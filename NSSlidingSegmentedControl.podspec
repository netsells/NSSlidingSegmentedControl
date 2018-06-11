#
# Be sure to run `pod lib lint NSSlidingSegmentedControl.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NSSlidingSegmentedControl'
  s.version          = '0.1.1'
  s.summary          = 'An underline styled segmented control'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A handy set of functions and extensions for your project. A project full of helper functions and extensions to give you a boost when starting a new project.
                       DESC

  s.homepage         = 'https://github.com/netsells/NSSlidingSegmentedControl'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'alexbriar' => 'alex.briar@netsells.co.uk' }
  s.source           = { :git => 'https://github.com/netsells/NSSlidingSegmentedControl.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/netsells'

  s.ios.deployment_target = '11.0'

  s.source_files = 'NSSlidingSegmentedControl/Classes/**/*'
  s.swift_version = '4.1'
  
  # s.resource_bundles = {
  #   'NSUtils' => ['NSSlidingSegmentedControl/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end