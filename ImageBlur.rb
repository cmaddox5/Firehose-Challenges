class Image
  attr_accessor :img, :img_blur
  
  def initialize(arr)
    self.img = arr
  end
  
  def output
    self.img.each do |line|
      puts line.join
    end
  end
  
  def output_blur
    self.img_blur.each do |line|
      puts line.join
    end
  end
  
  def blur
    self.img_blur = Array.new(self.img.size) { Array.new(img[0].size) }
    img.each_index do |x|
      img[x].each_index do |y|
        self.img_blur[x][y] = 0
      end
    end
    self.img.each_index do |x|
      img[x].each_index do |y|
        if self.img[x][y] == 1 && x == 0 && y == 0
          self.img_blur[x][y] = 1
          self.img_blur[x+1][y] = 1
          self.img_blur[x][y+1] = 1
        elsif self.img[x][y] == 1 && x == 0 && y == self.img.length-1
          self.img_blur[x][y] = 1
          self.img_blur[x+1][y] = 1
          self.img_blur[x][y-1] = 1
        elsif self.img[x][y] == 1 && x == self.img.length-1 && y == 0
          self.img_blur[x][y] = 1
          self.img_blur[x-1][y] = 1
          self.img_blur[x][y+1] = 1
        elsif self.img[x][y] == 1 && x == self.img.length-1 && y == self.img.length-1
          self.img_blur[x][y] = 1
          self.img_blur[x-1][y] = 1
          self.img_blur[x][y-1] = 1
        elsif self.img[x][y] == 1 && x == 0
          self.img_blur[x][y] = 1
          self.img_blur[x+1][y] = 1
          self.img_blur[x][y+1] = 1
          self.img_blur[x][y-1] = 1
        elsif self.img[x][y] == 1 && x == self.img.length-1
          self.img_blur[x][y] = 1
          self.img_blur[x-1][y] = 1
          self.img_blur[x][y+1] = 1
          self.img_blur[x][y-1] = 1
        elsif self.img[x][y] == 1 && y == self.img.length-1
          self.img_blur[x][y] = 1
          self.img_blur[x+1][y] = 1
          self.img_blur[x-1][y] = 1
          self.img_blur[x][y-1] = 1
        elsif self.img[x][y] == 1 && y == 0
          self.img_blur[x][y] = 1
          self.img_blur[x+1][y] = 1
          self.img_blur[x-1][y] = 1
          self.img_blur[x][y+1] = 1
        elsif self.img[x][y] == 1
          self.img_blur[x][y] = 1
          self.img_blur[x+1][y] = 1
          self.img_blur[x-1][y] = 1
          self.img_blur[x][y+1] = 1
          self.img_blur[x][y-1] = 1
        end
      end
    end
  end
end

image = Image.new([
  [1, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0, 0],
  [1, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 1]
])

image.output
image.blur
puts " "
image.output_blur
