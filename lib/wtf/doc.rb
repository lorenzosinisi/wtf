module Wtf
  class Doc
    class << self
      
      def current_path
        Dir.pwd
      end

      def has_documentation?
        File.exist?(wtf_file)
      end

      alias :is_documented? :has_documentation?

      def wtf_file
        current_path + '/.wtf'
      end

      def clean
        if is_documented?
          File.delete(wtf_file)
          true
        else
          puts not_documented
        end
      end

      def not_documented
        "This folder is not documented yet. Add a documentation by running: \n\n wtf doc -c 'a description of the folder'"
      end

      def write(data)
        File.open(wtf_file, 'w') {|f| f.write(data) }
      end

      def content
        if is_documented?
          data = File.read(wtf_file)
          data
        else
          puts not_documented
        end
      end

      alias :read_documentation :content
    end
  end
end