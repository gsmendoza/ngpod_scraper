require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
describe "Photo" do
  describe "new" do
    it "should set its attributes" do
      attributes = {
        :path_format => 'spec/tmp/#{f.name}',
        :wallpaper_path_format => 'spec/tmp/photo-of-the-day.jpg',
        :wallpaper_width => 1280,
        :wallpaper_height => 800
      }

      photo = Photo.new(attributes)
      photo.path_format.should == attributes[:path_format]
      photo.wallpaper_path_format.should == attributes[:wallpaper_path_format]
      photo.wallpaper_width.should == attributes[:wallpaper_width]
      photo.wallpaper_height.should == attributes[:wallpaper_height]
    end
  end
end
