#include <iostream>
#include <cstdlib>
#include <fstream>
using namespace std;

// Global vars

bool *error; error = new bool; // Error bit
error = False; // No exist errors
int *ActionProg; ActionProg = new int; // What do you do?
int *fileVerPage;fileVerPage = new int; // Version of HTML
char *fileToUse[]; fileToUse = new char[]; // File of the project
char *fileTitle[]; fileTitle = new char[];// Title of the project
int *DocNotEx; DocNotEx = new int[]; //Document not exist
int *selh5; selh5 = new int; // Select HTML5
int *i; i = new int; // Iteration var of SetLang() function
int *list; list = new int; // Select List

// Pointers to dynamic vars
char *Text[1000]; // Text
char *linkd[1000]; // Link dir
char *LongText[10000]; // Long text
int *sel; // Selection

// Functions Prototypes

void Exit(){
	cout << mylang.UserEndProg << endl;
	delete error;
	delete ActionProg;
	delete fileVerPage;
	delete fileToUse;
	delete fileTitle;
	delete DocNotEx;
	delete selh5;
	delete i;
	delete list;
	cin.get();
	exit(0);
}
void Err(){
	system("cls");
	if (error) {
		cout >> mylang.Err1 << endl;
		error  = False;
		return;
	}
	return;
};
void End(){
	system("echo ^</body^> >> " fileToUse;
	system("echo ^</html^> >> " fileToUse);
	system("cls")
	cout << mylang.ProjHasEnd; << ProjHasEnd1 << endl;
	cin.get();
	return;
}
void SetLang(){
	ifstream fe("lang.csv", ios::in | ios::binary);
	if(fe.good()){
		while (!fe.eof){
			fe >> cmylang[][i];
			i++;
		}
	} else {
		break;
	}
}

void CntnProj();
void NwProj();
void Func(int* &q);
// HTML Functions
void x1strict();
void x1trasicional();
void x1frameset();
void x2();
void h3();
void h4strict();
void h4transicional();
void h4frameset();
void h5();

union unionLang {
	lang mylang;
	char cmylang[50][100]
}

struct lang {
	char idLang[50]
	char Welcome[50] = "Bienvenido a Tily HTML-Batch 1.0  ...";
	char WhatDoYouDo[50] = "¿Que desea hacer? Escoja una opcion: ";
	char OptionMain1[50] = "Para empezar un proyecto nuevo, pulsa 1";
	char OptionMain2[50] = "Para continuar un proyecto existente, pulsa 2";
	char OptionMain3[50] = "Para salir del programa, pulsa 3";
	char WriteNameProj[50] = "Escribe la ruta donde estara tu archivo..."
	char UserEndProg[50] = "Lamentamos que te vayas c': Presioa cualquier tecla para salir.";
	char WillBeSet[50] = "Su proyecto trabajara con la version: ";
	char WillBeCreate[50] = "Se creara un archivo de proyecto con el nombre";
	char WillBeCreate1[50] = "Su proyecto tendra el titulo: ";
	char Err1[50] = "Debe elegir una opcion valida";
	char Err2[50] = "Ha ocurrido un error con el documento..."
	char WillBeRedirect[50] = "Se le redirigira al menu..."
	char WriteNameProj1[50] = "Escribe la ruta de tu archivo para continuar...";
	char DocNotExist[50] = "El proyecto no se ha encontrado...";
	char DocNotExist1[50] = "¿Deseas crear un proyecto nuevo con este nombre?";
	char DocNotExist2[50] = "Si -> 1   No -> 2";
	char ProjHasEnd[50] = "Se ha finalizado tu proyecto";
	char ProjHasEnd1[50] = "Gracias por utilizar mi programa :3";
	char ForCreateHead[50] = "Para crear encabezados, pulsa 1";
	char ForCreateLink[50] = "Para crear hiperenlaces, pulsa 2";
	char ForCreateButton[50] = "Para crear botones, pulsa 3";
	char ForCreateText[50] = "Para crear texto, pulsa 4";
	char ForCreateList[50] = "Para crear listas, pulsa 5";
	char ForEnd[50] = "Para terminar tu proyecto, pulsa 6";
	char ForExit[50] = "Para salir del programa, pulsa 7";
	char WriteYourText[50] = "Escribe el texto a mostrar....";
	char WriteDirLink[50] = "Escribe la direccion del enlace...";
	char WriteTxtLink[50] = "Escribe el texto del enlace...";
	char ForAppendElem[50] = "Para agregar un elemento, pulsa 1";
	char ForCloseList[50] = "Para cerrar la lista, pulse 2";
	char WriteNameButton[50] = "Escribe el nombre de tu boton";
 	char SelectTypeButton[50] = "¿Que tipo de boton deseas?";
 	char SelectTypeButton1[50] = "Para botones con codigo, pulsa 1";
	char SelectTypeButton2[50] = "Para botones con direcciones, pulsa 2";
	char SelectTypeMarquee[50] = "¿Que tipo de marquesina desea?";
	char SelectTypeMarquee1[50] = "Para marquesinas rebotantes, pulse 1";
	char SelectTypeMarquee2[50] = "Para marquesinas que avanzan, pulse 2";
} //For include a resource file which contains translates to any language

int main (int argc, char *argv[]){
	//funcSetLang();
	aMain:
	Err();
	cout << mylang.Welcome << endl;
	cout << mylang.WhatDoYouDo << endl;
	cout << mylang.OptionMain1 << endl;
	cout << mylang.OptionMain2 << endl;
	cout << mylang.OptionMain3 << endl;
	cin >> ActionProg ;
	switch (ActionProg){
		case 3:
			Exit();
		case 2:
			CntnProj();
			goto aMain;
		case 1:
			NwProj();
			goto aMain;
		default:
			error = True;			
			goto aMain;
	}	
}

void NwProj(){
	// Set name file
	system("cls")
	cout << mylang.WriteNameProj << endl;
	cin >> fileToUse;
	cout << mylang.WillBeCreate << fileToUse << endl;
	ifstream myproj(, ios::in | ios::binary);
	if(myproj.good()){
		system("echo ^<^!--Created with Tily HTML-Batch--^> >> " fileToUse);
		cin.get();
		// Set HTML version
		aNwProj:
		Err();
		system("cls");
		cout << mylang.SelectVerPage << endl;
		cout << "1. XHTML 1.0 Strict (HTML4 + XML)" << endl;
		cout << "2. XHTML 1.0 Transitional (HTML4 + XML)" << endl;
		cout << "3. XHTML 1.0 Frameset (HTML4 + XML)" << endl;
		cout << "4. XHTML 2.0 (HTML5 + XML)" << endl;
		cout << "5. HTML 3.02" << endl;
		cout << "6. HTML 4.01 Strict" << endl;
		cout << "7. HTML 4.01 Transicional" << endl;
		cout << "8. HTML 4.01 Frameset" << endl;
		cout << "9. HTML 5" << endl;
		cin >> fileVerPage;
		switch (fileVerPage){
			case 1:
				cout << mylang.WillBeSet << "XHTML 1.0 Strict (HTML4 + XML)" << endl;
				system('echo ^<^?xml version=^"1.0^" encoding=^"UTF-8^"^?^> >>' fileToUse);
				system('echo ^<^!DOCTYPE html PUBLIC ^"-//W3C//DTD XHTML 1.0 Strict//EN^"^> >>'  fileToUse);
				system('echo ^<html xmlns=^"http://www.w3.org/1999/xhtml^" xml:lang=^"en^" lang=^"en^"^> >>' fileToUse);
			case 2:
				cout << mylang.WillBeSet << "XHTML 1.0 Transitional (HTML4 + XML)" << endl;
				system('echo ^<^?xml version=^"1.0^" encoding=^"UTF-8^"^?^> >>' fileToUse);
				system('echo ^<^!DOCTYPE html PUBLIC ^"-//W3C//DTD XHTML 1.0 Transitional//EN^"^> >>'  fileToUse);
				system('echo ^<html xmlns=^"http://www.w3.org/1999/xhtml^" xml:lang=^"en^" lang=^"en^"^> >>' fileToUse);
				error = False;
			case 3:
				cout << mylang.WillBeSet << "XHTML 1.0 Frameset (HTML4 + XML)" << endl;
				system('echo ^<^?xml version=^"1.0^" encoding=^"UTF-8^"^?^> >>' fileToUse);
				system('echo ^<^!DOCTYPE html PUBLIC ^"-//W3C//DTD XHTML 1.0 Frameset//EN^"^> >>'  fileToUse);
				system('echo ^<html xmlns=^"http://www.w3.org/1999/xhtml^" xml:lang=^"en^" lang=^"en^"^> >>' fileToUse);
				error = False;
			case 4:
				cout << mylang.WillBeSet << "XHTML 2.0 (HTML5 + XML)" << endl;
				system('echo ^<^!DOCTYPE html PUBLIC ^"-//W3C//DTD XHTML 2.0//EN^"^> >>'  fileToUse);
				system('echo ^<^?xml version=^"1.0^" encoding=^"UTF-8^"^?^> >>' fileToUse);
				system('echo ^<html xmlns=^"http://www.w3.org/1999/xhtml^" xml:lang=^"en^" lang=^"en^"^> >>' fileToUse);
				error = False;
			case 5:
				cout << mylang.WillBeSet << "HTML 3.02" << endl;
				system('echo ^<^!DOCTYPE HTML PUBLIC ^"-//W3C//DTD HTML 3.2 Final//EN^"^>  >>' fileToUse);
				system("echo ^<html^> >>" fileToUse);
				error = False;
			case 6:
				cout << mylang.WillBeSet << "HTML 4.01 Strict" << endl;
				system('echo ^<^!DOCTYPE html PUBLIC ^"-//W3C//DTD HTML 4.01//EN^"^> >>'  fileToUse);
				system("echo ^<html^> >>" fileToUse);
				error = False;
			case 7:
				cout << mylang.WillBeSet << "HTML 4.01 Transitional" << endl;
				system('echo ^<^!DOCTYPE html PUBLIC ^"-//W3C//DTD HTML 4.01 Transitional//EN^"^> >>'  fileToUse);
				system("echo ^<html^> >>" fileToUse);
				error = False;
			case 8:
				cout << mylang.WillBeSet << "HTML 4.01 Frameset" << endl;
				system('echo ^<^!DOCTYPE html PUBLIC ^"-//W3C//DTD HTML 4.01 Frameset//EN^"^> >>'  fileToUse);
				system("echo ^<html^> >>" fileToUse);
				error = False;
			case 9:
				cout << mylang.WillBeSet << "HTML 5" << endl;
				system("echo ^<^!DOCTYPE HTML^> >> " fileToUse);
				system("echo ^<html^> >>" fileToUse);
				error = False;
			default:
				error = True;
				goto aNwProj;
		}
		cin.get()
		system("echo ^<head^> >>" fileToUse);
		// Set title project
		system("cls");
		cout << mylang.WriteTitlePage << endl;
		cin << fileTitle;
		cout << mylang.WillBeCreate1 << fileTitle << endl;
		cin.get();
		system("echo ^<title^>" fileTitle " ^</title^> >>" fileToUse);
		system("echo ^</head^> >>" fileToUse);
		system("echo ^<body^> >>" fileToUse);
	} else {
		cout << mylang.Err2 << endl;
		cout << mylang.WillBeRedirect << endl;
		system("cls");
	}
}

void CntnProj(){
	aCntnProj:
	Err();
	cout << mylang.WriteNameProj1 << endl;
	cin >> fileToUse;
	ifstream myproj(, ios::in | ios::binary);
	if(myproj.good()){
		cout << mylang.WillBeCont << fileToUse << endl
		cin.get()
		switch (fileVerPage){
			case 1:
				x1strict();
			case 2:
				x1trasicional();
			case 3:
				x1frameset();
			case 4:
				x2();
			case 5:
				h3();
			case 6:
				h4strict();
			case 7:
				h4transicional();
			case 8:
				h4frameset();
			case 9:
				h5();
			default:
				error = True
				goto aCntnProj;
		}
	} else {
		cout << mylang.DocNotExist << endl;
		cout << mylang.DocNotExist1 << endl;
		cout << mylang.DocNotExist2 << endl;
		cin >> DocNotEx;
		switch (DocNotEx) {
			case 1:
				system("echo ^<^!--Created with Tily HTML-Batch--^> >> " fileToUse);
				goto aNwProj;
			case 2:
				return //Return to main
			default:
				goto aCntnProj;
		}
	}
}

void h5(){
	ah5:
	Err();
	cout << mylang.WhatDoYouDo << endl;
	cout << mylang.ForCreateHead << endl;
	cout << mylang.ForCreateLink << endl;
	cout << mylang.ForCreateButton << endl;
	cout << mylang.ForCreateText << endl;
	cout << mylang.ForCreateList << endl;
	cout << mylang.ForEnd << endl;
	cout << mylang.ForExit << endl;
	cin >> selh5;
	switch(selh5){
		case 1:
			Func(1); //Text
			goto ah5;
		case 2:
			Func(2); //Link
			goto ah5;
		case 3:
			Func(3); //List
			goto ah5;
		case 4:
			Func(4); //Img
			goto ah5;
		case 5:
			Func(5); //Script
			goto ah5;
		case 6:
			Func(6); //Table
			goto ah5;
		case 7:
			Func(7) //Video
			goto ah5;
		case 8:
			Func(8) //Sound
			goto ah5;
		case 9:
			Func(9) //Header
			goto ah5;
		case 10:
			Func(10) //Footer
			goto ah5;
		case 11:
			Func(11) //Form
			goto ah5;
		case 12:
			Func(12) //Iframe
			goto ah5;
		case 13:
			End();
		case 14:
			Exit();
		default:
			error = True;
			goto ah5
	}
}

void Func(int* &q){
	switch (*q){
		//General
		case 1:
			goto text;
		case 2:
			goto link;
		case 3:
			goto list;
		case 4:
			goto img;
		case 5:
			goto script;
		case 6:
			goto table;
		//html5
		case 7:
			goto video;
		case 8:
			goto sound;
		case 9:
			goto header;
		case 10:
			goto footer;
		case 11:
			goto form5;
		case 12:
			goto iframe;
		//obsolete
		case 13:
			goto form4;
		case 14:
			goto marquee;		
		case 15:
			goto frame;			
	}
	:text
		system("cls");
		p = new char[1000];
		cout << mylang.WriteYourText << endl;
		cin >>  *Text;
		system("echo ^<p^>" %text% "^</p^> >> " fileToUse);
		delete Text;
		return;
	link:
		system("cls");
		linkd = new char [1000];
		Text = new char [1000];
		cout << mylang.WriteDirLink << endl;
		cin >> linkd;
		cout << mylang.WriteTxtLink << endl;
		cin >> Text;
		system('echo ^<a href="http://'linkd'"^>'linkt'^</A^> >> ' fileToUse);
		delete Text;
		delete linkd;
		return;
	list:
		system("cls");
		Text = new char[1000];
		system("echo ^<ul^> >> " fileToUse);
		cout << mylang.WhatDoYouDo << endl;
		cout << mylang.ForAppendElem << endl;
		cout << mylang.ForCloseList << endl;
		cin << list;
		system("cls");
		switch (list) {
			case 1:
				cout << mylang.WriteYourText << endl;
				cin >> Text;
				system("echo ^<li^>^<p^>"Text"^</p^>^</li^> >>" fileToUse);
				system("cls");
				delete Text;
				goto list;
			case 2:
				system("echo ^</ul^> >>" fileToUse);
				system("cls");
				delete Text;
				return;
			default:
				error = True;
				delete Text;
				Err();
				goto list;
		}
	img:
		system("cls");
	script:
		system("cls");
	table:
		system("cls");
	video:
		system("cls");
	sound:
		system("cls");
	header:
		system("cls");
		Text = new char[1000];
		cout << mylang.WriteYourText << endl;
		cin >> Text;
		system("ECHO ^<h1^>"Text"^</h1^> >> " fileToUse);
		delete Text;
		return;
	footer:
		system("cls");
	form5:
		system("cls");
		Text = new char[1000];
		LongText = new char[10000];
		cout << mylang.WriteNameButton << endl;
		cin >> Text;
		cout << mylang.SelectTypeMarquee << endl;
		cout << mylang.SelectTypeMarquee1 << endl;
		cout << mylang.SelectTypeMarquee2 << endl;
		cin >> sel;
		switch (sel){
			case 1:
				cout << WriteDirLink << endl;
				cin >> LongText;
				system('echo ^<input^ type="button" value="'Text'" onClick="self.location.href=('Text')" /^> >>' fileToUse);
				delete LongText;
				delete Text;
			case 2:
				cout << WriteYourCode << endl;
				cin >> LongText;
				system('echo ^<input^ type="button" value="'Text'" onClick="'LongText'" /^> >>' fileToUse);
				delete LongText;
				delete Text;
			default:
				error = True;
				delete Text;
				Err();
				goto form5;
		}
		return;
	iframe:
		system("cls");
	form4:
		system("cls");
	marquee:
		system("cls");
		Text = new char[1000];
		
		cout << mylang.SelectTypeButton << endl;
		cout << mylang.SelectTypeButton1 << endl;
		cout << mylang.SelectTypeButton2 << endl;
		cin >> sel;
		switch (sel){
			case 1:
				cout << mylang.WriteYourText << endl;
				cin >> Text;
				system("ECHO ^<marquee behavior='alternate'^>"Text"^</marquee^> >> " fileToUse);
				delete Text;
			case 2:
				cout << mylang.WriteYourText << endl;
				cin >> Text;
				system("ECHO ^<marquee behavior='scroll'^>"Text"^</marquee^> >> " fileToUse);
				delete Text;
			default:
				error = True;
				delete Text;
				Err();
				goto marquee;
		}
		return;
	frame:
		system("cls");
}
