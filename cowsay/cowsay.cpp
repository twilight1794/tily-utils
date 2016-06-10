#include <iostream>
#include <cstdlib>
using namespace std;

char x[10000];
char y[10000];

void console(a,b);
void user();
int main (int argc, char *argv[]){
	if (argc==1){
		cout << "No arguments" << endl;
		user();
		return 0;
	}
	if (argc!=3){
		return 1;
	} else {
		console(argv[1], argv[2]);
		return;
	}
}
void console(a,b){
	//insert open file
	//insert conditional
	cout <<"/"<</*a.center(len(a),"-")*/<<"\\"<< endl;
	cout <<"|"<< a <<"|"<< endl;
	cout <<"\\"<</*a.center(len(a),"-")*/<<"/"<< endl;
	cout <<"\\ |"<< endl;
	cout <<" \\|"<< endl;
	cout <<"  |"<< endl;
	cout <<"  '"<< endl;
	system("cat" b);
	return;
}
void user(){
	cout << "Text to show: " << endl;
	cin >> x;
	cout << "Path of file of the picture: " << endl;
	cin >> y;
	console(x,y);
	return;
}
