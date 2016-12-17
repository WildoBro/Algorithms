class Image
  
  def initialize(image)
    @image = image
  end

  def output_image
    @image.each do |row|
      row.each do |pixel|
        print pixel
      end
      print "\n"
    end
  end  

  # def blur!
  #   ones_locations.each do |coordinate|
  #     # Change all surrounding pixels to 1
  #     change_pixel_above(*coordinate)
  #     change_pixel_right(*coordinate)
  #     change_pixel_down(*coordinate)
  #     change_pixel_left(*coordinate)
  #   end
  # end

  def blur!(distance)
      (distance).times do
        ones_locations.each do |coordinate|
          # Change all surrounding pixels to 1
          change_pixel_above(*coordinate)
          change_pixel_right(*coordinate)
          change_pixel_down(*coordinate)
          change_pixel_left(*coordinate)
        end
      end
  end
  
  private

  def ones_locations    
    pixel_placements = []
    @image.each_with_index do |row, y|
      row.each_with_index do |pixel, x|
        # determine if pixel is a 1. If pixel is a 1, store location.
        if pixel == 1
          pixel_placements << [y, x]
        end
      end
    end
    pixel_placements
  end

  def change_pixel_above(y, x)
    if @image[y - 1][x]
      @image[y - 1][x] = 1
    end
  end

  def change_pixel_right(y, x)
    if @image[y][x + 1]
      @image[y][x + 1] = 1
    end
  end

  def change_pixel_down(y, x)
    if @image[y + 1][x]
      @image[y + 1][x] = 1
    end
  end

  def change_pixel_left(y, x)
    if @image[y][x - 1]
      @image[y][x - 1] = 1
    end
  end

end

image = Image.new([
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1, 0],
  [0, 0, 0, 1, 0, 0],
  [0, 1, 0, 0, 1, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0, 0]
])

image.blur!(2)
image.output_image

