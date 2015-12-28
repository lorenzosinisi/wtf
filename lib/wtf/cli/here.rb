require 'thor'

module Wtf
  module CLI
    class Application < Thor
      
      desc "here", "This will read you the description of this folder"
      def here
        puts Wtf::Core.new.content
      end
      default_task :here

      desc "document", "This will write the description of this folder.
                        \n\n Usage:
                        \n\n wtf document -c 'my documentation'"
      option :c
      def document(*args)
        content = options[:c] + " " + args.join(" ")
        Wtf::Core.new.write(content) if options[:c]
        puts "Folder documentation added:"
        puts Wtf::Core.new.content
      end

    end
  end
end