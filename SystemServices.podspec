Pod::Spec.new do |s|

  s.name         = "SystemServices"
  s.version      = "3.0.0"
  s.summary      = "A singleton class to gather all available information about an iOS device."
  s.description  = <<-DESC
    iOS System Services is a singleton class that gathers all available information
    about a device through one simple, well-documented API. It exposes 70+ read-only
    properties covering:

      * Hardware information
      * Network information
      * Battery usage
      * Accelerometer & motion data
      * Disk usage
      * Memory usage
      * Processor, carrier, accessory, localization and application details
  DESC

  s.homepage     = "https://github.com/Shmoopi/iOS-System-Services"
  s.screenshots  = [ "https://raw.githubusercontent.com/Shmoopi/iOS-System-Services/master/Sample%20Images/Screenshot1.png",
                     "https://raw.githubusercontent.com/Shmoopi/iOS-System-Services/master/Sample%20Images/Screenshot2.png" ]
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Shmoopi LLC" => "shmoopillc@gmail.com" }
  s.platform     = :ios, "15.0"
  s.source       = { :git => "https://github.com/Shmoopi/iOS-System-Services.git", :tag => s.version.to_s }
  s.source_files = "System Services/**/*.{h,m}"
  s.requires_arc = true
  s.frameworks   = "UIKit", "Foundation", "AVFoundation", "CoreTelephony", "Security", "CoreMotion", "ExternalAccessory"

end
