# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class FancyBoxExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/fancy_box"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :fancy_box
  #   end
  # end
  
  def activate
    # admin.tabs.add "Fancy Box", "/admin/fancy_box", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Fancy Box"
  end
  
end
