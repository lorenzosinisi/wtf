require 'spec_helper'

module Wtf
  describe Doc do
    
    let(:wtf) { Doc }
    
    after(:each) do
      if Wtf::Doc.has_documentation?
        File.delete(Wtf::Doc.current_path + '/.wtf')
      end
    end

    context "#current_path" do
      describe "without a file" do
        it "should be a string" do
          expect(wtf.current_path).to be_a String
        end
        it "should say if the current folder is documented" do
          expect(wtf.has_documentation?).to be false
        end
        it "should clean the directory" do
          expect(wtf.clean).to be nil
        end
      end

      describe "with a file" do 
        
        before(:each) do 
          File.open(wtf.current_path + '/.wtf', 'w') {|f| f.write("Somethin") }
        end

        
        it "should say if the current folder is documented" do
          expect(wtf.has_documentation?).to be true
        end

        it "should clean the directory" do
          expect(wtf.clean).to be true
        end

        it "should write the documentation" do
          content = "This is a completely useless folder, drop it."
          wtf.write(content)
          expect(wtf.content).to eq content
          File.delete(Wtf::Doc.current_path + '/.wtf')
        end

        after(:each) do
          if Wtf::Doc.has_documentation?
            File.delete(Wtf::Doc.current_path + '/.wtf')
          end
        end

      end
    end
  end
end
