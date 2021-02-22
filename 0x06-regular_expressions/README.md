<p align="center">
  <img width="409" height="128" src="https://www.holbertonschool.com/holberton-logo.png">
</p>

# Regular Expression

For this project, you have to build your regular expression using Oniguruma, a regular expression library that which is used by Ruby by default. Note that other regular expression libraries sometimes have different properties.

Because the focus of this exercise is to play with regular expressions (regex), here is the Ruby code that you should use, just replace the regexp part, meaning the code in between the //:

```
sylvain@ubuntu$ cat example.rb
#!/usr/bin/env ruby
puts ARGV[0].scan(/127.0.0.[0-9]/).join
sylvain@ubuntu$
sylvain@ubuntu$ ./example.rb 127.0.0.2
127.0.0.2
sylvain@ubuntu$ ./example.rb 127.0.0.1
127.0.0.1
sylvain@ubuntu$ ./example.rb 127.0.0.a
```

### Task 0

- The regular expression must match `Holberton`
- Create a Ruby script that accepts one argument and pass it to a regular expression matching method

### Task 1

- Find the regular expression that will match: 2-5 `t`between `hb`qnd `n
- Create a Ruby script that accepts one argument and pass it to a regular expression matching method`

### Task 2

- Find the regular expression that will match `hbn` with 0 or more `b`'s in between `hb` and `n`.
- Create a Ruby script that accepts one argument and pass it to a regular expression matching method

### Task 3

- Find the regular expression that will match `hbn` with 1 or more `t`'s in between `hb` and `n`.
- Create a Ruby script that accepts one argument and pass it to a regular expression matching method

### Task 4

- Find the regular expression that will match `hbn` with 0 or more `t`'s in between `hb` and `n`.
- Create a Ruby script that accepts one argument and pass it to a regular expression matching method
- Your regex should not contain square brackets

### Task 5

- The regular expression must be exactly matching a string that starts with `h` ends with `n` and can have any single character in between
- Create a Ruby script that accepts one argument and pass it to a regular expression matching method

### Task 6

- The regular expression must match a 10 digit phone number

### Task 7

The regular expression must be only matching: capital letters

Example:
```
sylvain@ubuntu$ ./7-OMG_WHY_ARE_YOU_SHOUTING.rb "I realLy hOpe VancouvEr posseSs Yummy Soft vAnilla Dupper Mint Ice Nutella cream" | cat -e
ILOVESYSADMIN$
sylvain@ubuntu$ ./7-OMG_WHY_ARE_YOU_SHOUTING.rb "WHAT do you SAY?" | cat -e
WHATSAY$
sylvain@ubuntu$ ./7-OMG_WHY_ARE_YOU_SHOUTING.rb "cannot read you" | cat -e
$
sylvain@ubuntu$
```

### Ressource

https://www.w3schools.com/jsref/jsref_obj_regexp.asp

https://rubular.com/

https://regex101.com/

 Regex  | Quick reference                                    |
|:-------: | ------------------------------------------------|
|[abc]	   |A single character of: a, b, or c		     |
|[^abc]    |   Any single character except: a, b, or c	     |
|[a-z]	   |Any single character in the range a-z    	     |
|[a-zA-Z]  | Any single character in the range a-z or A-Z    |
|^	   |Start of line	     	       	     |
|$	   |End of line				     |
|\A	   |Start of string				     |
|\z	   |End of string				     |
|.	   |Any single character			     |
|\s	   |Any whitespace character			     |
|\S	   |Any non-whitespace character		     |
|\d	   |Any digit	       			     |
|\D	   |Any non-digit				     |
|\w	   |Any word character (letter, number, underscore)  |
|\W	   |Any non-word character			     |
|\b	   |Any word boundary				     |
|(...)	   |Capture everything enclosed		     |
|(a|b)	   |a or b  	       			     |
|a?	   |Zero or one of a				     |
|a*	   |Zero or more of a				     |
|a+	   |One or more of a				     |
|a{3}	   |Exactly 3 of a 				     |
|a{3,}	   |3 or more of a				     |
|a{3,6}    |   Between 3 and 6 of a			     |
