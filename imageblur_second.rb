#IMAGE BLUR CHALLENGE #2

class Image
  def initialize(image_data)
    @image_data = image_data
  end

  def output_image
    @image_data.each do |arr_row|
      puts arr_row.join(" ")
    end
  end

  def blur
    tmp = Array.new(@image_data.size){[0]*@image_data[0].size}
    @image_data.each_with_index do |arr_row, i|
      arr_row.each_with_index do |arr_element, j|
        if arr_element == 1
          tmp[i][j] = 1
          tmp[i-1][j] = 1 if i-1 >= 0
          tmp[i+1][j] = 1 if i+1 < @image_data.size
          tmp[i][j-1] = 1 if j-1 >= 0
          tmp[i][j+1] = 1 if j+1 < arr_row.size
        end
      end
    end
    @image_data = tmp
  end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

puts "Original image"
image.output_image
image.blur
puts "Blurred image:"
image.output_image