# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class FancyBoxExtension < Radiant::Extension
  version "1.0"
  description "Makes it very easy to use fancybox for displaying images in 'lightbox' style overlays"
  url "http://github.com/gunn/radiant-fancy_box-extension"
  
  def activate
    Page.send :include, FancyBoxTags
  end
  
  def deactivate
  end
  
end
