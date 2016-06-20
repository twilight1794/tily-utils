/**/
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <fstream>
using namespace std;
int group
int comp
int helpc
bool multi
char nameprog[]
char hbdir[]
char progdir[]
int funcHelp(int a)
void funcError(int b)
int funcBuild()

int main(int argc, char *argv[]){
	if (argc == 1) {
		funcErr(1)
	}
	else {
		if (argv[1] == "help"){
			if (argc == 3){
				funcHelp(argv[2])
			}
			else {
				funcHelp(0)
			}
		}
		else {
			funcBuild()
		}
	}
}
void funcErr(int b){
	switch (b) {
		case 1: cout <<"Error: No parameters" << endl;
		case 2: cout <<"Error: No enough parameters" << endl;
		case 3: cout <<"Error: No group code defined" << endl;
		case 4: cout <<"Error: No compress format defined" << endl;
		case 5: cout <<"Error: No helpcode defined" << endl;
		case 6: cout <<"Error: No HBCD directory" << endl;
		case 7: cout <<"Error: No program directory" << endl;
		case 8: cout <<"Error: An unidentified issue" << endl;
	}
}
int funcBuild(){
	if (argv != 7){
		funcErr(2)
	}
	else {
		/*Usar metodo file, csv en pyhon portable*/
		system ("python hbcdcust.py")
	}
}
/*
switch (comp)
	case 1: system("zip");
	case 2: system("cab");
	case 3: system("uha");
	case 4: system("paq");
	case 5: system("rar");
	case 6: system("7z");
	default: funcError(4);
*/
