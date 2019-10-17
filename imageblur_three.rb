class Image

  def initialize(image_data)
    @image_data = image_data
  end

  def output_image
    @image_data.each do |arr_row|
      puts arr_row.join(" ")
    end
  end

  #Blur method
  
  def blur(distance=1)
    # deal with special case of distance
    if distance == 0
      return
    end

    # Creating the blur method
    blurred = Array.new(@image_data.size){[0]*@image_data[0].size}
    @image_data.each_with_index do |arr_row, i|
      arr_row.each_with_index do |arr_element, j|
        if arr_element == 1
          (distance+1).times do |ii|
            (distance+1).times do |jj|
              if (ii+jj) == 0
                blurred[i][j] = 1
              # elsif (ii+jj) <= distance # simple version
              elsif Math.sqrt(ii*ii+jj*jj) <= distance # a more correct
                blurred[i-ii][j-jj] = 1 if i-ii >= 0 && j-jj >= 0
                blurred[i+ii][j-jj] = 1 if i+ii < @image_data.size && j-jj >= 0
                blurred[i-ii][j+jj] = 1 if i-ii >= 0 && j+jj < arr_row.size
                blurred[i+ii][j+jj] = 1 if i+ii < @image_data.size && j+jj < arr_row.size
              end
            end
          end
        end
      end
    end

    # update image data to blurred image
    @image_data = blurred
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
image.blur(3)
puts "Blurred image:"
image.output_image