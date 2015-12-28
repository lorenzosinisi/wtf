require 'thor'

module Wtf
  module CLI
    class Application < Thor
      
      desc "here","This will read you the description of this folder"
      def here
        puts "DOC ==> " + Wtf::Doc.content.to_s
      end

      default_task :here

      desc "doc", "This will write the description of the current folder.
                        \n\n Usage:
                        \n\n wtf doc -c 'my documentation'"
      option :c
      def doc(*args)
        if options[:c]
          content = options[:c] + " " + args.join(" ")
          Wtf::Doc.write(content)
          puts "Folder documentation added:"
          puts "Doc ==> " + Wtf::Doc.content
        else
          puts "Please provide some text with -c"
        end
      end

      desc "clean", "This will clean the .wtf file from the current folder"
      option :clean
      def clean
        Wtf::Doc.clean
      end

    end
  end
end