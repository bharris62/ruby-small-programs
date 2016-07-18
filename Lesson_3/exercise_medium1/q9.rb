munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, val|
  case name['age']
  when 0..29
    val['age_group'] = 'kid'
  when 31..100
    val['age_group'] = 'adult'
  else
    val['age_group'] = 'senior'
  end
end

p munsters
