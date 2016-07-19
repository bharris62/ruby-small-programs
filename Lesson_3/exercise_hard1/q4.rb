# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

def uuid(one)
  chars = []
  (0..9).each {|dig| chars << dig}
  ('a'..'f').each {|let| chars << let}
  p chars

  uid = ""
  sections = %w(8 4 4 4 12)
  sections.each_with_index do |section, index|
    sections.times {uid += chars.sample}
    uid += '-' unless index >= sections.size - 1
  end
end
