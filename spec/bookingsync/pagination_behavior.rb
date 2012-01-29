shared_examples_for "a paginated class" do
  it { subject.class.included_modules.should include(BookingSync::Pagination) }

  it ".find_all_across_pages" do
    subject.class.should_receive(:find).with(:all, {
      :params => { :page => 1, :per_page => 500 }}).and_return(["things"])
    subject.class.should_receive(:find).with(:all,{
      :params => { :page => 2, :per_page => 500 }}).and_return([])
    subject.class.find_all_across_pages.should == ["things"]
  end

  it ".find_all_across_pages with zero results" do
    subject.class.should_receive(:find).with(:all,{
      :params => { :page => 1, :per_page => 500 }}).and_return(nil)
    subject.class.find_all_across_pages.should == []
  end

  it ".find_all_across_pages_since" do
    time = Time.parse("Fri Jan 07 12:34:56 +0200 2011")
    subject.class.should_receive(:find_all_across_pages).with({
      :params => { :from => "20110107"}}).and_return("result")
    subject.class.find_all_across_pages_from(time).should == "result"
  end
end