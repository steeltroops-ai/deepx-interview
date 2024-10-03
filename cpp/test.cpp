#include <iostream>
#include <string>
using namespace std;

bool isPalindrome(const string& str) {
    int left = 0;
    int right = str.length() - 1;
    while (left < right) {
        if (str[left] != str[right]) {
            return false;
        }
        left++;
        right--;
    }
    return true;
}

int main() {
    string str;
    while (getline(cin, str)) {
        if (isPalindrome(str)) {
            cout << "Palindrome" << endl;
        } else {
            cout << "Not Palindrome" << endl;
        }
    }
    return 0;
}