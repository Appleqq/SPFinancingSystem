# Uncomment the next line to define a global platform for your project
 platform :ios, ‘8.0’

target 'SPFinancingSystem' do
pre_install do |installer|
    def installer.verify_no_static_framework_transitive_dependencies; end
end
    pod 'BlocksKit', '~> 2.2.5'
    pod 'PureLayout', '~> 2.0.5'
    pod 'BaiduMapKit', '~> 3.3.0'
    pod 'WXSTransition', '~> 1.2.1'
    pod 'ReactiveCocoa', '2.5'

  target 'SPFinancingSystemTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SPFinancingSystemUITests' do
    pod 'BlocksKit', '~> 2.2.5'
    pod 'PureLayout', '~> 2.0.5'
    pod 'BaiduMapKit', '~> 3.3.0'
    pod 'WXSTransition', '~> 1.2.1'
    pod 'ReactiveCocoa', '2.5'
  end

end
