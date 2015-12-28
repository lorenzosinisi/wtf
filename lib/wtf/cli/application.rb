require 'thor'

module Wtf
  module CLI
    class Application < Thor
      
      desc "here","This will read you the description of this folder"
      def here
        if Wtf::Doc.content
          puts "DOC ==> " + Wtf::Doc.content.to_s
        else
          answer = ask("Do you want to add a documentation for this folder?", :limited_to => ["y", "n"])
          if answer.to_sym == :y
            doc
          end
        end
      end
      default_task :here

      
      desc "doc", "This will write the description of the current folder. \n\n Usage: \n\n wtf doc"
      def doc
        content = ask("What others should know about this folder?")
        Wtf::Doc.write(content)
        puts "Folder documentation added: \n\n " + "Doc ==> " + Wtf::Doc.content
      end

      
      desc "clean", "This will clean the .wtf file from the current folder"
      def clean
        if Wtf::Doc.has_documentation?
          answer = ask("Are you sure to cleanup the documentation for this folder?", :limited_to => ["y", "n"])
          if answer.to_sym == :y
            Wtf::Doc.clean
            puts :cleaned
          else
            puts :ok
          end
        else
          puts "This directory doesn't have any .wtf file"
        end
      end

    end
  end
end