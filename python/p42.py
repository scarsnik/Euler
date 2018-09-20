import timing
import string
'''
Coded triangle numbers
Problem 42
The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.

Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?
'''

triangle_nums = []
for n in range(10000):
	triangle_nums.append(0.5*n*(n+1))

letters = dict()
for i in range(1,27):
	letters[string.ascii_uppercase[i-1]] = i
print(letters)
line = [file.strip().replace("\"","").replace("'","") for file in list(open("words.txt"))]
words = line[0].split(",")

scores = dict()
count = 0
for word in words:
	# print(word)
	scores[word] = 0
	for letter in range(len(word)):
		scores[word] += letters[word[letter]]
	if scores[word] in triangle_nums: count += 1

print(count)

