namespace :radiant do
  namespace :extensions do
    namespace :fancy_box do
      
      desc "Copies public assets of the Fancy Box to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from FancyBoxExtension"
        Dir[FancyBoxExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(FancyBoxExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
        
        yaml_file = File.join(FancyBoxExtension.root, "db", "snippets.yml")
        yaml = File.open(yaml_file) { |f| f.read }
        YAML.load(yaml).each do |snippet_name, snippet_content|
          s = Snippet.find_or_initialize_by_name(snippet_name)
          if s.new_record? || confirm("Are you sure you want to overwrite existing snippet #{snippet_name}?")
            s.content = snippet_content
            s.save!
            puts "  - #{snippet_name}"
          end
        end
        
      end
      
    end
  end
end
