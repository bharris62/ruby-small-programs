# Describe the difference between ! and ? in Ruby. And explain what would happen
# in the following scenarios:
#
# what is != and where should you use it?
this is a comparison operator, you should use it when you want to compare if
something is not.

car =! bike
# put ! before something, like !user_name
turns into opposite of boolian object

name = true
!name => return false

# put ! after something, like words.uniq!
this means that the action is likely destructive.  for example if you have an !
array it will mutate it, most likely;  it is actually part of the method name if
it is after and you need to inspect it to see exactly what it does.

# put ? before something

ternary operator

# put ? after something
part of method name; need to inspect to exactly what it will do.

# put !! before something, like !!user_name
turns object in boolian equiv.
