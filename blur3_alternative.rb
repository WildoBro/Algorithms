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
        change_pixel(*coordinate)
      end
  end
  
  private

  def ones_locations(n)
    pixel_placements = []
    @image.each_with_index do |row, y|
      row.each_with_index do |pixel, x|
        # determine if pixel is a 1. If pixel is a 1, store location.
        if pixel == 1
          (n + 1).times do |iy|
            (n + 1).times do |ix|
              if iy + ix <= n 
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

  def change_pixel(y, x)
    if @image[y.abs][x.abs]
      @image[y.abs][x.abs] = 1
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

image.blur!(1)
image.output_image