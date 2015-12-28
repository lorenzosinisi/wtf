module Wtf
  class Core
    class << self
      
      def current_path
        Dir.pwd
      end

      def has_documentation?
        File.exist?(current_path + wtf_file)
      end

      alias :is_documented? :has_documentation?

      def wtf_file
        '/.wtf'
      end

      def clean
        if is_documented?
          File.delete(current_path + wtf_file)
          true
        else
          puts "This folder was not documented, nothing deleted."
          nil
        end
      end

    end
  end
end