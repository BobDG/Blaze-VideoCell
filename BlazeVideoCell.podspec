Pod::Spec.new do |s|
  s.name           = 'BlazeVideoCell'
  s.version        = '0.0.1'
  s.summary        = 'Video-cell addition to Blaze'
  s.license 	   = 'MIT'
  s.description    = 'Useful video-cell for Blaze to play videos using AVPlayerViewController'
  s.homepage       = 'https://github.com/BobDG/Blaze-VideoCell'
  s.authors        = {'Bob de Graaf' => 'graafict@gmail.com'}
  s.source         = { :git => 'https://github.com/BobDG/Blaze-VideoCell.git', :tag => s.version.to_s }
  s.source_files   = 'BlazeVideoCell/*.{h,m}'
  s.platform       = :ios
  s.requires_arc   = 'true'
  s.dependency     'Blaze'
end
