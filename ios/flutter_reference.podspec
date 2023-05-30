#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_reference.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_reference'
  s.version          = '0.0.5'
  s.summary          = 'Flutter Reference'
  s.description      = <<-DESC
Simple way to keep reference between native classes and Flutter.
                       DESC
  s.homepage         = 'https://github.com/DIG-/flutter-reference'
  s.license          = { :file => '../LICENSE', :type => 'Creative Commons Attribution-NoDerivatives 4.0 
International Public License' }
  s.author           = { 'Gustavo de Oliveira Silva (DIG)' => 'contato@dig.dev.br' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
