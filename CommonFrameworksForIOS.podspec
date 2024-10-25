#
# Be sure to run `pod lib lint CommonFrameworks.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CommonFrameworksForIOS'
  s.version          = '0.0.3'
  s.summary          = 'CommonFrameworksForIOS is custom animated floating TextField written in Swift5 & compatable in version 12.0 and greater.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'CommonFrameworksForIOS is an awesome pod and a great alternate of default TextField powered by EncoreSky Technologiew Pvt. Ltd., Indore (M.P.), aimed to make your life easier around TextFields.'
                       DESC

  s.homepage         = 'https://github.com/chandaboy786/CommonFrameworksForIOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Muhammad Farhan' => 'muhammad.farhan@golootlo.pk' }
  s.source           = { :git => 'https://github.com/chandaboy786/CommonFrameworks.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.encoresky.com'
  s.ios.deployment_target = '13.0'
  s.source_files = 'Classes/**/*.swift'
  s.swift_version = '5.0'
  s.platform = :ios, '13.0'

  
  # s.resource_bundles = {
  #   'CommonFrameworksForIOS' => ['CommonFrameworksForIOS/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'MapKit', 'CoreTelephony', 'Foundation'
  
  # s.dependency 'Alamofire'
  # s.dependency 'AlamofireImage'
  # s.dependency 'IQKeyboardManagerSwift'
  # s.dependency 'RealmSwift'
  # s.dependency 'Cosmos'

  # s.dependency 'Firebase/Messaging'
  # s.dependency 'Firebase/Core'
  # s.dependency 'Firebase/Auth'
  # s.dependency 'Firebase/Database'
  # s.dependency 'SkeletonView'
  # s.dependency 'SDWebImage'
  # s.dependency 'ImageSlideshow/Alamofire'


  # s.subspec 'ReachabilitySwift' do |sp|
  #   sp.ios.deployment_target = '11.0'
  # end

  # s.subspec 'MBProgressHUD' do |sp|
  #   sp.ios.deployment_target = '11.0'
  # end


  # s.subspec 'GoogleMaps' do |sp|
  #   sp.ios.deployment_target = '10.0'
  # end

# s.subspec 'GooglePlaces' do |sp|
#     sp.ios.deployment_target = '10.0'
#   end


  s.static_framework = true

  # s.subspec 'Alamofire' do |sp|
  #   sp.ios.deployment_target = '10.0'

  #   sp.source = { :git => 'https://github.com/Alamofire/Alamofire.git', :tag => '5.7.1'}
  #   sp.documentation_url = 'https://alamofire.github.io/Alamofire/'

  #   sp.ios.deployment_target = '10.0'
  #   sp.osx.deployment_target = '10.12'
  #   sp.tvos.deployment_target = '10.0'
  #   sp.watchos.deployment_target = '3.0'

  # sp.swift_versions = ['5']

  # sp.source_files = 'Source/*.swift'

  # sp.frameworks = 'CFNetwork'

  # end


end

# pod trunk delete CommonFrameworksForIOS 0.0.1
# pod trunk push  

# https://medium.com/@jeantimex/create-your-own-cocoapods-library-da589d5cd270

# xcodebuild archive -workspace CommonFrameworks.xcworkspace \
#   -scheme CommonFrameworks \                                                                        
#   -sdk iphonesimulator \                                                                         
#   BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
#   SKIP_INSTALL=NO


# pod spec lint --verbose FrameworkLibs.podspec

# xcodebuild test \
#   -enableCodeCoverage YES \
#   -project CommonFrameworks.xcodeproj \
#   -scheme CommonFrameworks \
#   -sdk iphonesimulator \
#   -destination "platform=iOS Simulator,OS=12.1,name=iPhone X" \
#   ONLY_ACTIVE_ARCH=YES
