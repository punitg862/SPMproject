Pod::Spec.new do |s|
  s.name             = 'SPMproject'
  s.version          = '0.1.0'
  s.summary          = 'A short description of SPMproject.'
  s.homepage         = 'https://github.com/quickbirdeng/SPMproject'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Quick Bird' => 'mascot@quickbirdstudios.com' }
  s.source           = { :git => 'https://github.com/quickbirdeng/SPMproject.git', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.4'
  s.source_files = 'Sources/SPMproject/**/*'
end
