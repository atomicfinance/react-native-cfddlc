require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-cfddlc"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => "10.0" }
  s.source       = { :git => "https://github.com/atomicfinance/react-native-cfddlc.git", :tag => "#{s.version}" }

  s.source_files = ["ios/*.{h,hpp,cpp,m,mm,swift}", "ios/cfd-dlc-js/src/**/*.{h,cpp}", "ios/cfd-dlc-js/include/**/*.{h}"]
  s.vendored_libraries = "ios/lib/libcfddlc.a"
  s.private_header_files = ["ios/lib/**/*.{h}", "ios/autogen/*.h", "ios/**/*.hpp", "ios/cfd-dlc-js/**/*.h"]
  
  s.dependency "React-Core"
  s.preserve_paths = ['lib/**', 'include/**']
  s.pod_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => ["\"" + __dir__ + "/ios/lib\"", "\"" + __dir__ + "/ios/cfd-dlc-js/include\""]
  }
  s.xcconfig = {
    'HEADER_SEARCH_PATHS' =>  ["\"${PODS_ROOT}/react-native-cfd/ios/lib\"", "\"${PODS_ROOT}/react-native-cfd/ios/cfd-dlc-js/include\""]
  }
  s.library = 'c++'
end
