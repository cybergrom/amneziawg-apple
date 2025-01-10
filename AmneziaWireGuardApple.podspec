Pod::Spec.new do |s|
  s.name         = 'AmneziaWireGuardApple'
  s.version      = '1.0.0'
  s.summary      = 'Amnezia WireGuard for iOS and macOS'
  s.description  = <<-DESC
This project is a fork of WireGuard for iOS and macOS, with customizations for Amnezia VPN.
It contains components shared between platforms and additional custom functionality.
  DESC
  s.homepage     = 'https://github.com/cybergrom/amneziawg-apple'
  s.license      = { :type => 'MIT', :file => 'COPYING' }
  s.authors      = { 'CyberGrom' => 'cybergrom@example.com' }

  s.platforms    = { :ios => '15.0', :osx => '12.0' }
  s.source       = { :git => 'https://github.com/cybergrom/amneziawg-apple.git', :tag => "#{s.version}" }

  s.vendored_frameworks = 'Frameworks/wg-go.xcframework'
  s.swift_version = '5.7'

  s.source_files = [
    'Sources/WireGuardKitC/**/*.{c,h}',
    'Sources/WireGuardKit/**/*.{swift}',
    'Sources/Shared/**/*.{c,h,swift}',
    'Sources/WireGuardKitGo/wireguard.h',
    'Sources/WireGuardNetworkExtension/**/*.{c,h,swift}'
  ]

  s.exclude_files = [
    'Sources/Shared/**/test*.*',
    'Sources/WireGuardKitGo/out/**'
  ]

  s.preserve_paths = [
    'Sources/WireGuardKitC/module.modulemap'
  ]

  s.pod_target_xcconfig = {
    'SWIFT_INCLUDE_PATHS' => [
      '${PODS_TARGET_SRCROOT}/WireGuardKit/Sources/WireGuardKitC/**',
      '${PODS_TARGET_SRCROOT}/WireGuardKit/Sources/WireGuardKit/**',
      '${PODS_TARGET_SRCROOT}/WireGuardKit/Sources/WireGuardKitGo/wireguard.h',
      '${PODS_TARGET_SRCROOT}/WireGuardKit/Sources/Shared/**/*',
      '${PODS_TARGET_SRCROOT}/WireGuardKit/Sources/WireGuardNetworkExtension/**/*'
    ],
    'HEADER_SEARCH_PATHS' => [
      '${PODS_TARGET_SRCROOT}/WireGuardKit/Sources/WireGuardKitGo/wireguard.h'
    ],
    'APPLICATION_EXTENSION_API_ONLY' => 'YES'
  }
end