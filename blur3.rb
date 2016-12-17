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

  def blur!(distance)
      ones_locations(distance).each do |coordinate|
        # Change all surrounding pixels to 1
        change_pixel_above(*coordinate)
        change_pixel_right(*coordinate)
        change_pixel_down(*coordinate)
        change_pixel_left(*coordinate)
      end
  end
  
  private

  def ones_locations(n)
    pixel_placements = []
    @image.each_with_index do |row, y|
      row.each_with_index do |pixel, x|
        # determine if pixel is a 1. If pixel is a 1, store location.
        if pixel == 1
          n.times do |iy|
            n.times do |ix|
              if iy + ix < n
                if @image[y + iy] && @image[y + iy][x + ix]
                  pixel_placements << [y + iy, x + ix]
                end
                if @image[y + iy] && @image[y + iy][x - ix]
                  pixel_placements << [y + iy, x - ix]
                end
                if @image[y - iy] && @image[y - iy][x + ix]
                  pixel_placements << [y - iy, x + ix]
                end
                if @image[y - iy] && @image[y - iy][x - ix]
                  pixel_placements << [y - iy, x - ix]
                end
              end
            end
          end
        end
      end
    end
    pixel_placements
  end

  def change_pixel_above(y, x)
    if @image[(y - 1).abs][x.abs]
      @image[(y - 1).abs][x.abs] = 1
    end
  end

  def change_pixel_right(y, x)
    if @image[y.abs][(x + 1).abs]
      @image[y.abs][(x + 1).abs] = 1
    end
  end

  def change_pixel_down(y, x)
    if @image[(y + 1).abs]
      @image[(y + 1).abs][x.abs] = 1
    end
  end

  def change_pixel_left(y, x)
    if @image[y.abs][(x - 1).abs]
      @image[y.abs][(x - 1).abs] = 1
    end
  end

end

image = Image.new([
  [0, 0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0]
])

image.blur!(3)
image.output_image