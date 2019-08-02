#
# Be sure to run `pod lib lint BKKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BKKit'
  s.version          = '1.0.0'
  s.summary          = 'Work easier~'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                       主要把常用的东西放到一起，方便快速开发
                       DESC

  s.homepage         = 'https://github.com/BigKingQY/BKKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '641648019@qq.com' => '641648019@qq.com' }
  s.source           = { :git => 'https://github.com/BigKingQY/BKKit.git', :tag => s.version.to_s }
  #s.social_media_url = 'https://home.cnblogs.com/u/BigKingBlog'

  s.ios.deployment_target = '9.0'

  s.source_files = 'BKKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'BKKit' => ['BKKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  
  s.dependency 'AFNetworking'
  s.dependency 'Masonry'
  s.dependency 'MBProgressHUD'
  s.dependency 'MJRefresh'
  s.dependency 'IQKeyboardManager'
  s.dependency 'DZNEmptyDataSet'
  s.dependency 'WMPageController'
  
  
end
