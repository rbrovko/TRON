Pod::Spec.new do |s|
  s.name     = 'TRON'
  s.version  = '2.0.0-beta.2'
  s.license  = 'MIT'
  s.summary  = 'Lightweight network abstraction layer, written on top of Alamofire'
  s.homepage = 'https://github.com/MLSDev/TRON'
  s.authors  = { 'Denys Telezhkin' => 'denys.telezhkin@yandex.ru' }
  s.social_media_url = 'https://twitter.com/MLSDevCom'
  s.source   = { :git => 'https://github.com/MLSDev/TRON.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.watchos.deployment_target = '2.0'
  s.frameworks = 'Foundation'
  s.dependency 'Alamofire' , '~> 4.0'

  s.subspec 'Core' do |core|
      core.ios.frameworks = 'UIKit'
      core.source_files = 'Source/Core/*.swift'
      core.tvos.exclude_files = "Source/Core/NetworkActivityPlugin.swift"
      core.osx.exclude_files = "Source/Core/NetworkActivityPlugin.swift"
      core.watchos.exclude_files = "Source/Core/NetworkActivityPlugin.swift"
  end

  s.subspec 'SwiftyJSON' do |swiftyjson|
      swiftyjson.dependency 'TRON/Core'
      swiftyjson.dependency 'SwiftyJSON', '~> 3.0.0'
      swiftyjson.source_files = 'Source/SwiftyJSON/*.swift'
  end

  s.subspec 'RxSwift' do |rxswift|
      rxswift.dependency 'TRON/Core'
      rxswift.dependency 'RxSwift', '~> 3.0.0-beta.1'
      rxswift.source_files = 'Source/RxSwift/*.swift'
  end

  s.default_subspec = 'SwiftyJSON'
end
