class Image
  attr_accessor :a
  
  def initialize(a)
    @arr = a
  end



  def output_image
    @arr.each do |row|
      row.each do |pixel|
        print pixel
      end
      print "\n"
    end
  end

  def blurDown
    @arr.reverse_each do |row|
      placementDown = @arr[@arr.index(row) + 1]
      row.reverse_each do |pixel|
        pixelPlacement = row.index(pixel)
        if pixel == 1
          if placementDown[pixelPlacement] == 0 
            placementDown[pixelPlacement] = 1
          end
        end
      end
    end
  end

  def blurLeft
    tempArray = @arr
    @arr.each do |row|
      row.each do |pixel|
        if pixel == 1
          placementLeft = row.index(pixel) - 1
          if row[placementLeft] == 0 && tempArray[tempArray.index(row)][placementLeft] == 0
            row[placementLeft] = 1
          end
        end
      end
    end
  end

  def blurRight
    tempArray = @arr
    @arr.each do |row|
      row.each do |pixel|
        if pixel == 1
          placementRight = row.index(pixel) + 1
          if row[placementRight] == 0 && tempArray[tempArray.index(row)][placementRight] == 0
            row[placementRight] = 1
          end
        end
      end
    end
  end

  def blurUpLeft
    tempArray = @arr
    @arr.each do |row|
      placementUp = @arr[@arr.index(row) - 1]
      row.each do |pixel|
        if pixel == 1
          placementLeft = row.index(pixel) - 1
          pixelPlacement = row.index(pixel)
          if tempArray[tempArray.index(row)][placementLeft] == 0
            row[placementLeft] = 1
          end
          if placementUp[pixelPlacement] == 0
            placementUp[pixelPlacement] = 1
          end
        end
      end
    end
  end

  def blurDownRight
    tempArray = @arr
    @arr.reverse_each do |row|
      placementDown = @arr[@arr.index(row) + 1]
      row.reverse_each do |pixel|
        pixelPlacement = row.index(pixel)
        if pixel == 1
          placementRight = row.index(pixel) + 1
          if row[placementRight] == 0 && tempArray[tempArray.index(row)][placementRight] == 0
            row[placementRight] = 1
          end
          if placementDown[pixelPlacement] == 0 
            placementDown[pixelPlacement] = 1
          end
        end
      end
    end
  end


  def blur2
    tempArray = @arr
    @arr.each do |row|
      placementUp = tempArray[tempArray.index(row) - 1]
      row.each do |pixel|
        if pixel == 1
          placementLeft = row.index(pixel) - 1
          pixelPlacement = row.index(pixel)
          if tempArray[tempArray.index(row)][placementLeft] == 0
            row[placementLeft] = 1
          end
          if placementUp[pixelPlacement] == 0
            placementUp[pixelPlacement] = 1
          end
        end
      end
    end
    @arr.each do |row|
    #   placementDown = tempArray[tempArray.index(row) + 1]
      row.each do |pixel|
        if pixel == 1
          placementRight = row.index(pixel) + 1
          pixelPlacement = row.index(pixel)
          if row[placementRight] == 0 && tempArray[tempArray.index(row)][placementRight] == 0
            row[placementRight] = 1
          end
    #       if placementDown[pixelPlacement] == 0
    #         placementDown[pixelPlacement] = 1
    #       end
        end
      end
    end
  end


end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])


# image.blurUpLeft
# image.output_image

print "\n"

image.blurDownRight
image.output_image

