require 'thor'

module Wtf
  module CLI
    class Application < Thor
      
      desc "here", "This will read you the description of this folder"
      
      def here
        puts "DOC:" + Wtf::Core.new.content
      end

      default_task :here

      desc "doc", "This will write the description of the current folder.
                        \n\n Usage:
                        \n\n wtf doc -c 'my documentation'"
      option :c
      
      def doc(*args)
        if options[:c]
          content = options[:c] + " " + args.join(" ")
          Wtf::Core.new.write(content)
          puts "Folder documentation added:"
        end
        puts "DOC:" + Wtf::Core.new.content
      end

    end
  end
end