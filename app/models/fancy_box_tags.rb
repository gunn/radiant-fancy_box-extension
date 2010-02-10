module FancyBoxTags
  include Radiant::Taggable
  
  class TagError < StandardError; end
  
  desc %{
    Renders the url for the asset. If the asset is an image, the <code>size</code> attribute can be used to 
    generate the url for that size. 
    
    *Usage:* 
    <pre><code><r:assets:fancy_img image_id="77" [tn_size="icon|thumbnail"]/></pre>
  }
  tag 'assets:fancy_img' do |tag|
    image_options = {}
    tn_options = {}
    
    options = tag.attr.dup
    options.each do |k,v|
      if m = /\Aimage_(.*)/.match(k)
        image_key = m.captures.first
        image_options[image_key] = options.delete(k)
      end
      if m = /\Atn_(.*)/.match(k)
        tn_key = m.captures.first
        tn_options[tn_key] = options.delete(k)
      end
    end
    
    tn_options["size"] ||= "thumbnail"
    tn_options["id"] ||= image_options["id"]
    tn_options["title"] ||= image_options["title"]
    
    image_url = tag.render('assets:url', image_options)
    tn_img = tag.render('assets:image', tn_options)
    
    options["class"] ||= "fancy-img"
    
    attributes = options.inject('') { |s, (k, v)| s << %{#{k.downcase}="#{v}" } }.strip
    
    "<a href='#{image_url}' #{attributes}>#{tn_img}</a>"
  end
  
  
end