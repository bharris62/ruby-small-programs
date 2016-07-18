# create method that titlelizes everything!

movie_title = "some movie from last year"

def titleize(str)
  str.split.map { |word| word.capitalize! }.join(' ')
end

p titleize(movie_title)
