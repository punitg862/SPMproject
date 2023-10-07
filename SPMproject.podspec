Pod::Spec.new do |s|
  s.name             = "SPMproject"
  s.version          = "1.0.3"
  s.summary          = "SPMproject use to support Swift package and pod support"
  s.homepage         = "https://github.com/punitg862/SPMproject"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "punitg862" => 'punitg862@gmail.com' }
  s.source           = { :git => "https://github.com/punitg862/SPMproject.git", :tag => "#{s.version}" }
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.4'
  s.source_files = 'Sources/SPMproject/**/*.{h,m,swift}'
end
