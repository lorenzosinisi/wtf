require 'thor'

module Wtf
  module CLI
    class Application < Thor
      
      desc "here","This will read you the description of this folder"
      def here
        if Wtf::Doc.content
          say "DOC ==> " + Wtf::Doc.content.to_s, :green
        else
          doc if yes?("Do you want to add a documentation for this folder?")
        end
      end
      default_task :here

      
      desc "doc", "This will write the description of the current folder. \n\n Usage: \n\n wtf doc"
      def doc
        content = ask("What others should know about this folder? \n\n").to_s
        Wtf::Doc.write(content)
        say "\n\n Folder documentation added: \n\n"
        say Wtf::Doc.content.to_s + "\n\n", :green
      end
      
      desc "clean", "This will clean the .wtf file from the current folder"
      def clean
        if Wtf::Doc.has_documentation?
          if yes?("Are you sure to cleanup the documentation for this folder?")
            Wtf::Doc.clean
            say :cleaned, :green
          end
        else
          say "This directory doesn't have any .wtf file", :yellow
        end
      end

    end
  end
end