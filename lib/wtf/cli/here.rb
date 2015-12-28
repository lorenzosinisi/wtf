require 'thor'

module Wtf
  module CLI
    class Application < Thor
      
      desc "here", "This will read you the description of this folder"
      def here
        puts Wtf::Core.new.content
      end
      default_task :here

      desc "doc", "This will write the description of the current folder.
                        \n\n Usage:
                        \n\n wtf doc -c 'my documentation'"
      option :c
      def doc(*args)
        content = options[:c] + " " + args.join(" ") if options[:c]
        Wtf::Core.new.write(content) if options[:c]
        puts "Folder documentation added:"
        puts Wtf::Core.new.content
      end

    end
  end
end