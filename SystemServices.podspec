#
#  Be sure to run `pod spec lint SystemServices.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "SystemServices"
  s.version      = "2.0.1"
  s.summary      = "iOS System Services is a class to gather all available information about a device."
  s.description  = <<-DESC

  This is a singleton class to gather all available information about a device. It gives you over 60 methods to determine everything about a device, including:

  Hardware Information
  Network Information
  Battery Usage
  Accelerometer Data
  Disk Usage
  Memory Usage

                   DESC

  s.homepage     = "https://github.com/Shmoopi/iOS-System-Services"
  s.screenshots  = [ "https://raw.githubusercontent.com/Shmoopi/iOS-System-Services/master/Sample%20Images/Screenshot1.png",
                     "https://raw.githubusercontent.com/Shmoopi/iOS-System-Services/master/Sample%20Images/Screenshot2.png" ]
  s.license      = { :type => 'MIT' }
  s.author             = { "Shmoopi" => "shmoopillc@gmail.com" }
  s.social_media_url   = "http://twitter.com/shmoopillc"
  s.platform     = :ios
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/Shmoopi/iOS-System-Services.git", :tag => "2.0.1" }
  s.source_files  = "SystemServices", "System Services/**/*.{h,m}"
  s.frameworks = "AVFoundation", "CoreTelephony", "Security", "CoreMotion", "ExternalAccessory"
  s.requires_arc = true

end
