module Wtf
  class Core
      
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
        puts not_documented
        nil
      end
    end

    def not_documented
      "This folder is not documented."
    end

    def write(data)
      File.open(current_path + '/.wtf', 'w') {|f| f.write(data) }
    end

    def content
      if is_documented?
        data = File.read(current_path + wtf_file)
        data
      else
        puts not_documented
      end
    end

    alias :read_documentation :content

  end
end