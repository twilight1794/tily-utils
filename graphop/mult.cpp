#include <iostream>
#include <string>
#include <stdlib.h>
using namespace std;

int num1, num2, width, height, diff1, diff2, space;

string genChars(int i, const char* chars);

int main(int argc, char *argv[]){
  if (argc == 3){
    num1 = atoi(argv[1]);
    num2 = atoi(argv[2]);
    width = to_string(num1 * num2).length();
    diff1 = width - to_string(num1).length();
    diff2 = width - to_string(num2).length() - 1;
    cout << genChars(diff1, " ") << to_string(num1) << endl;
    cout << "\e[4m" << genChars(diff2, " ") << "\u00d7" << to_string(num2) << "\e[0m" << endl;
    for (int i = to_string(num2).length() - 1; i != -1; i--){
      int j = num1 * stoi(to_string(num2).substr(i,1));
      if (j != 0){
        if (i == 0){
          cout << "\e[4m" << genChars(width - to_string(j).length() - space, " ") << j << "\e[0m" << genChars(space, " ") << space << endl;
        } else {
          cout << genChars(width - to_string(j).length() - space, " ") << j << genChars(space, " ") << space << endl;
        }
      }
      space++;
    }
    cout << to_string(num1*num2) << endl;
  } else {
    cerr << "Not enough arguments" << endl;
    return 1;
  }
}

string genChars(int i, const char* chars){
  string cad;
  for (int j; j < i; j++){
    cad += chars;
  }
  return cad;
}
