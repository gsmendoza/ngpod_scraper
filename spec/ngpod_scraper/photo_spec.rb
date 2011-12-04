require 'spec_helper'
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

      photo = Photo.new(:file => Pow('spec/fixtures/test.jpg').open, :path_format => 'spec/fixtures/1.jpg')
      photo.exists?.should be_false
    end

    it "should be true if there's there's file saved in photo.path" do
      path = Pow('spec/fixtures/test.jpg')
      path.exists?.should be_true

      photo = Photo.new(:file => path.open, :path_format => path.to_s)
      photo.exists?.should be_true
    end
  end

  describe "path" do
    it "should eval the path_format" do
      file = Pow('spec/fixtures/test.jpg').open
      time = Time.now

      photo = Photo.new(:url => file.path, :file => file, :path_format => 'tmp/#{year}/#{month}/#{day}/#{hour}-#{name}')
      photo.path.should =~ /#{"tmp/#{time.strftime('%Y/%m/%d/%H')}-#{Pow(file.path).name}"}/
    end
  end

  describe "path" do
    it "should eval the wallpaper_path_format" do
      file = Pow('spec/fixtures/test.jpg').open
      time = Time.now

      photo = Photo.new(:url => file.path, :file => file, :wallpaper_path_format => 'tmp/#{year}/#{month}/#{day}/#{hour}-#{name}')
      photo.wallpaper_path.should =~ /#{"tmp/#{time.strftime('%Y/%m/%d/%H')}-#{Pow(file.path).name}"}/
    end
  end

  describe "save" do
    it "should save the photo in its path" do
      file = Pow('spec/fixtures/test.jpg').open
      photo = Photo.new(:url => file.path, :file => file, :path_format => 'tmp/#{year}/#{name}')
      Pow(photo.path).exists?.should be_false

      photo.save

      Pow(photo.path).exists?.should be_true
    end
  end

  describe "wallpaper_scale" do
    it "should be the wallpaper_height/image.height if that is the smallest" do
      file = Pow('spec/fixtures/test.jpg').open
      photo = Photo.new(:file => file, :path_format => file.path)
      photo.wallpaper_height = photo.image.rows / 4
      photo.wallpaper_width  = photo.image.columns / 2

      photo.wallpaper_scale.should == photo.wallpaper_height.to_f / photo.image.rows
    end

    it "should be the wallpaper_width/image.width if that is the smallest" do
      file = Pow('spec/fixtures/test.jpg').open
      photo = Photo.new(:file => file, :path_format => file.path)
      photo.wallpaper_height = photo.image.rows / 2
      photo.wallpaper_width  = photo.image.columns / 4

      photo.wallpaper_scale.should == photo.wallpaper_width.to_f / photo.image.columns
    end

    it "should be 1 if both height and width rations are greater that 1 (don't enlarge the image)" do
      file = Pow('spec/fixtures/test.jpg').open
      photo = Photo.new(:file => file, :path_format => file.path)
      photo.wallpaper_height = photo.image.rows * 2
      photo.wallpaper_width  = photo.image.columns * 4

      photo.wallpaper_scale.should == 1
    end
  end

  describe "wallpaper" do
    it "should be the image centered in a background" do
      file = Pow('spec/fixtures/test.jpg').open

      photo = Photo.new(:file => file, :path_format => file.path, :wallpaper_background_color => 'black')
      photo.wallpaper_height = photo.image.rows * 2
      photo.wallpaper_width  = photo.image.columns * 4

      #sorry, I don't know how I can test this
      photo.wallpaper.should be_a(Magick::Image)
    end
  end

  describe "save_wallpaper" do
    it "should save the wallpaper in the wallpaper_path" do
      file = Pow('spec/fixtures/test.jpg').open

      photo = Photo.new(:file => file, :path_format => file.path)
      photo.wallpaper_background_color = 'black'
      photo.wallpaper_height = 800
      photo.wallpaper_width  = 1280
      photo.wallpaper_path_format = "tmp/#{Time.now.to_i}-wallpaper.jpg"

      Pow(photo.wallpaper_path).exists?.should_not be_true

      photo.save_wallpaper

      Pow(photo.wallpaper_path).exists?.should be_true
    end
  end
end
