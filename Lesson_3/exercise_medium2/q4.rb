sentence = "Humpty Dumpty sat on a wall."

p sentence.split("").reverse!.join()


# or this way to make it legible. 
words = sentence.split(/\W/)
words.reverse!
p backwards_sentence = words.join(' ') + '.'
