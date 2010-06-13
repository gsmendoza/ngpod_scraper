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

  describe "exists?" do
    it "should be false if there's no file saved in photo.path" do
      path = Pow('spec/fixtures/1.jpg')
      path.exists?.should be_false

      photo = Photo.new(:file => Pow('spec/fixtures/hong-kong.jpg').open, :path_format => 'spec/fixtures/1.jpg')
      photo.exists?.should be_false
    end

    it "should be true if there's there's file saved in photo.path" do
      path = Pow('spec/fixtures/hong-kong.jpg')
      path.exists?.should be_true

      photo = Photo.new(:file => path.open, :path_format => path.to_s)
      photo.exists?.should be_true
    end
  end

  describe "path" do
    it "should eval the path_format" do
      file = Pow('spec/fixtures/hong-kong.jpg').open
      time = Time.now

      photo = Photo.new(:url => file.path, :file => file, :path_format => 'tmp/#{year}/#{month}/#{day}/#{hour}-#{name}')
      photo.path.should =~ /#{"tmp/#{time.strftime('%Y/%m/%d/%H')}-#{Pow(file.path).name}"}/
    end
  end

  describe "save" do
    it "should save the photo in its path" do
      file = Pow('spec/fixtures/hong-kong.jpg').open
      photo = Photo.new(:url => file.path, :file => file, :path_format => 'tmp/#{year}/#{name}')
      Pow(photo.path).exists?.should be_false

      photo.save

      Pow(photo.path).exists?.should be_true
    end
  end


end
