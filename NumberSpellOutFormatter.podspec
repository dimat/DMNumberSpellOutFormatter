#
# Be sure to run `pod lib lint NumberSpellOutFormatter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NumberSpellOutFormatter'
  s.version          = '0.1.2'
  s.summary          = 'Spell out numbers in any language'

  s.description      = <<-DESC
Allows to spell out numbers in different languages and with many options. Unlike the standard NSNumberFormatter it
also supports ordinal numbers with any additional modes that are applicable for specific language, such as gender
(feminine and masculine) and grammatical cases.
                       DESC

  s.homepage         = 'https://github.com/dimat/DMNumberSpellOutFormatter'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dmitry Matyukhin' => 'dimatu@gmail.com' }
  s.source           = { :git => 'https://github.com/dimat/DMNumberSpellOutFormatter.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = ['NumberSpellOutFormatter/Classes/**/*', 'NumberSpellOutFormatter/Private/**/*.h']
  
  s.public_header_files = 'NumberSpellOutFormatter/Classes/**/*.h'
  s.private_header_files = 'NumberSpellOutFormatter/Private/**/*.h'
  s.libraries = "icucore"

end
