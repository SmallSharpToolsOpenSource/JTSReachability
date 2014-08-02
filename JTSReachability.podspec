
Pod::Spec.new do |s|

  s.name         = "JTSReachability"
  s.version      = "0.0.1"
  s.summary      = "Adaptation of Apple's Reachability with some block-based conveniences."

  s.description  = <<-DESC
Adaptation of Apple's Reachability with some block-based conveniences.
                   DESC

  s.homepage     = "https://github.com/jaredsinclair/JTSReachability"

  s.license      = 'MIT'

  s.author             = { "Jared Sinclair" => "desk@jaredsinclair.com" }

  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/jaredsinclair/JTSReachability.git", :tag => "0.0.1" }
  s.source_files  = 'Classes/**/*.{h,m}'
  s.requires_arc = true

end

