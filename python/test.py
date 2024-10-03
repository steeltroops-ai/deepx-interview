import sys

def is_palindrome(s):
    # Remove non-alphanumeric characters and convert to lowercase
    cleaned = ''.join(c.lower() for c in s if c.isalnum())
    # Check if the cleaned string is equal to its reverse
    return cleaned == cleaned[::-1]

if __name__ == "__main__":
    if len(sys.argv) > 1:
        test_string = ' '.join(sys.argv[1:])
        print(is_palindrome(test_string))
    else:
        test_string = input("Enter a string to check if it's a palindrome: ")
        print(is_palindrome(test_string))