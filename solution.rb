def solution(s)
  city_photos = Hash.new { |hash, key| hash[key] = [] }

  s.each_line.with_index do |line, index|
    photo_info = line.chomp.split(', ')
    city_photos[photo_info[1]] << [index, photo_info]
  end

  new_names = []

  city_photos.each_value do |photos|
    photos.sort_by! { |_, photo| photo[2] }
    max_length = photos.size.to_s.length

    photos.each_with_index do |(index, photo), idx|
      extension = photo[0].split('.').last
      new_name = "#{photo[1]}#{(idx + 1).to_s.rjust(max_length, '0')}.#{extension}"
      new_names[index] = new_name
    end
  end

  new_names.join("\n")
end

# Example:
photos = "photo.jpg, Krakow, 2013-09-05 14:08:15
Mike.png, London, 2015-06-20 15:13:22
myFriends.png, Krakow, 2013-09-05 14:07:13
Eiffel.jpg, Florianopolis, 2015-07-23 08:03:02
pisatower.jpg, Florianopolis, 2015-07-22 23:59:59
BOB.jpg, London, 2015-08-05 00:02:03
notredame.png, Florianopolis, 2015-09-01 12:00:00
me.jpg, Krakow, 2013-09-06 15:40:22
a.png, Krakow, 2016-02-13 13:33:50
b.jpg, Krakow, 2016-01-02 15:12:22
c.jpg, Krakow, 2016-01-02 14:34:30
d.jpg, Krakow, 2016-01-02 15:15:01
e.png, Krakow, 2016-01-02 09:49:09
f.png, Krakow, 2016-01-02 10:55:32
g.jpg, Krakow, 2016-02-29 22:13:11"

puts solution(photos)
