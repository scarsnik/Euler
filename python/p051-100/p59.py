import timing
import string
import itertools
'''
XOR decryption
Problem 59
Each character on a computer is assigned a unique code and the preferred standard is ASCII (American Standard Code for Information Interchange). For example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.

A modern encryption method is to take a text file, convert the bytes to ASCII, then XOR each byte with a given value, taken from a secret key. The advantage with the XOR function is that using the same encryption key on the cipher text, restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.

For unbreakable encryption, the key is the same length as the plain text message, and the key is made up of random bytes. The user would keep the encrypted message and the encryption key in different locations, and without both "halves", it is impossible to decrypt the message.

Unfortunately, this method is impractical for most users, so the modified method is to use a password as a key. If the password is shorter than the message, which is likely, the key is repeated cyclically throughout the message. The balance for this method is using a sufficiently long password key for security, but short enough to be memorable.

Your task has been made easy, as the encryption key consists of three lower case characters. Using cipher1.txt (right click and 'Save Link/Target As...'), a file containing the encrypted ASCII codes, and the knowledge that the plain text must contain common English words, decrypt the message and find the sum of the ASCII values in the original text.
'''
def decrypt(encrypted, key):
	d = [encrypted[i]^key[0] if i%3==0 else encrypted[i]^key[1] if i%3==1 else encrypted[i]^key[2] for i in range(len(encrypted))]
	return d

min = 0
max = 15600
# min, max = 1000, 1020
chars = "\n\"\' _.,?;!$%&()-:/\*^#@~+{}:>< 1234567890 abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ"
print(chars)
char_set = {ord(c) for c in chars}
print(char_set)

keys = [[ord(c) for c in key] for key in list(itertools.permutations(string.ascii_lowercase,3))]
text = [int(i) for i in list(open("cipher1.txt"))[0].split(",")]
print(len(text))
for k in keys[min:max]:
	d = decrypt(text,k)
	if sum([1 if i in char_set else 0 for i in d]) == len(text):
		print(k)
		print(''.join([chr(c) for c in d]))
		print(sum([i for i in d]))
		break




