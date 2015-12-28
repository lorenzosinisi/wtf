require 'spec_helper'

module Wtf
  describe Core do
    
    after(:each) do
      if Wtf::Core.has_documentation?
        File.delete(Wtf::Core.current_path + '/.wtf')
      end
    end
    
    context "#current_path" do
      describe "without a file" do
        it "should be a string" do
          expect(Core.current_path).to be_a String
        end
        it "should say if the current folder is documented" do
          expect(Core.has_documentation?).to be false
        end
        it "should clean the directory" do
          expect(Core.clean).to be nil
        end
      end

      describe "with a file" do 
        
        before(:each) do 
          File.open(Wtf::Core.current_path + '/.wtf', 'w') {|f| f.write("Somethin") }
        end
        
        it "should say if the current folder is documented" do
          expect(Core.has_documentation?).to be true
        end
        it "should clean the directory" do
          expect(Core.clean).to be true
        end

      end
    end
  end
end
