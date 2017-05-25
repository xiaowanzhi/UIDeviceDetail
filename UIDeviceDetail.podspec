

Pod::Spec.new do |s|


  s.name         = "UIDeviceDetail"
  s.version      = "0.0.1"
  s.summary      = "all kinds of categories for iOS develop"

  s.description  = <<-DESC
                      this project provide all kinds of categories for iOS developer 
                   DESC

  s.homepage     = "https://github.com/xiaowanzhi/UIDeviceDetail"

  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.author             = { "lihongliang" => "949854103@qq.com" }


  s.platform     = :ios

  s.source       = { :git => "https://github.com/xiaowanzhi/UIDeviceDetail.git", :tag => "0.0.1" }


  s.source_files  = "Classes", "UIDevice/*.{h,m}"
  s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "MeTest/Classes/UIKit/UI_Categories.h","MeTest/Classes/Foundation/Foundation_Category.h","MeTest/Classes/**/*.h"

  s.requires_arc = true


end
