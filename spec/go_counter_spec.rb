require 'fileutils'
module GoCount
  RSpec.describe GoCounter do
		describe "#count" do
			let(:program) { GoCounter.new }
		  before :each do
				Dir[File.expand_path('../../data/*.sql',__FILE__)].each{|f| FileUtils.remove(f) }					        
      end

      context "when path is empty" do
        it "sends directory is empty" do
          expect(capture(:stdout){program.count}).to match(/Directory is empty/)
        end
      end

      context "when path is not empty" do
		  	it "sends file name with go count" do
          File.write(File.expand_path('../../data/test.sql', __FILE__), '') 

			  	expect(capture(:stdout){ program.count }).to match(/\S*\.sql\s-\s\d*/)
				end
			end
    end
  end
end