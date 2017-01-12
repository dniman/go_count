module GoCount
  RSpec.describe GoCounter do
		describe "#count" do
		  it "sends file name with go count" do
			  expect(capture(:stdout){ GoCounter.new.count }).to match(/\S*\.sql\s-\s\d*/)
			end
    end
  end
end