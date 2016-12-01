class Image
  def initialize(a)
    @table = a
  end

  def output_image
    x = 0
    while x < 4 do 
      puts @table[x].join
      x = x + 1
    end
  end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
 