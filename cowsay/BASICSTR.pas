unit BASICstr;
interface
  type 
    TipoFecha = string[8];
  FUNCTION CADENA(const carc:char;             {Cadena de caracteres repetidos} 
    const veces:byte):string; 
  FUNCTION COMAS(var s:string): string;        {Cambia , por . para hallar valor} 
  FUNCTION CONPUNTO(const num:longint):string; {N� como cadena con puntos: x.xxx.xxx} 
  FUNCTION FECHA(const separ:char):tipofecha;  {Fecha, indicando el separador} 
  FUNCTION HEX(const a:byte):string;           {Pasa byte a hexadecimal} 
  FUNCTION LEFT(const cad:string;              {Letras de la izquierda} 
    const n:byte):string; 
  FUNCTION MAYUSC(const cad:string):string;    {Convierte a may�sculas} 
  FUNCTION RIGHT(const cad:string;             {Letras de la derecha} 
    const n:byte):string; 
  FUNCTION SPC(const n:byte):string;           {Espacios en blanco} 
  FUNCTION STRS(const valor:longint):string;   {Como STR$ de Basic} 
  FUNCTION STRSR(const valor:real):string;     {STRS$ para reales} 
  FUNCTION VALORLI(const cad:string):longint;  {Valor de un string como LongInt} 
  FUNCTION VALORR(const cad:string):real;      {Valor de un string como REAL} 
  FUNCTION VALORW(const cad:string):word;      {Valor de un string como WORD}
 
implementation
 
  uses dos;
 
  FUNCTION CADENA(const carc:char; const veces:byte):string; 
  { Crea una cadena formada por un mismo car�cter repetido varias veces } 
  var 
    cadtmp: string; 
    i: byte; 
  begin 
    cadtmp := '';                               { Cadena vac�a } 
    for i := 1 to veces do cadtmp[i] := carc;   { Voy dando valores } 
    cadtmp[0] := chr(veces);                    { Ajusto la longitud } 
    { Las dos l�neas anteriores se podr�an 
    reemplazar tambi�n por: 
    for i := 1 to veces do cadtmp := cadtmp + carc; 
    } 
    cadena := cadtmp                            { Valor definitivo } 
  end;
 
  FUNCTION COMAS(var s:string): string; 
  { Cambia comas por puntos (decimales en formato americano) para poder 
    introducir un n�mero en formato espa�ol y hallar su valor} 
  var 
    i: byte; 
    t: string; 
  begin 
    t := s;                            { Copio la cadena inicial } 
    for i :=1 to length(t) do          { La recorro } 
      if t[i]=',' then t[i] := '.';    { Y si encuentro , pongo . } 
    comas := t; 
  end;
 
  FUNCTION CONPUNTO(const num:longint):string; 
  { Devuelve un n�mero como cadena con puntos: x.xxx.xxx } 
  var 
    cadena: string; 
    d: byte; 
  const 
    punto: char = '.'; 
  begin 
    str(abs(num),cadena);              { Empiezo a trabajar sin signo } 
    d := length(cadena);               { Veo la longitud } 
    if d>3 then                        { Si es mayor de 1.000 } 
      insert(punto,cadena,d-2);        { inserto un punto } 
    d := length(cadena);               { Vuelvo a mirar } 
    if d>7 then                        { Si es mayor de 1.000.000 } 
      insert(punto,cadena,d-6);        { pongo otro punto } 
    if num<0 then cadena:='-'+cadena;  { Si es negativo, le pongo signo } 
    ConPunto := cadena; 
  end;
 
  FUNCTION FECHA(const separ:char):tipofecha; 
  { Para ver la fecha como DD/MM/AA, o DD-MM-AA, etc. } 
  var 
    dia,mes,ano,disem: word;          { Fecha leida del DOS } 
    temporal: string[8];              { Temporal, para valor final } 
    tempo2: string[2];                { Temporal, para cada dato } 
  begin 
    getdate(ano,mes,dia,disem);       { Leo la fecha del DOS } 
    str(dia,tempo2);                  { Paso el d�a a cadena } 
    temporal:=tempo2+separ;           { Y le a�ado el separador } 
    str(mes,tempo2);                  { Paso el mes } 
    temporal:=temporal+tempo2+separ;  { Y lo a�ado } 
    str(ano mod 100,tempo2);          { Paso el a�o (dos ultimas cifras) } 
    temporal:=temporal+tempo2;        { Lo a�ado } 
    fecha:=temporal;                  { Y se acab� } 
  end;
  FUNCTION HEX(const a:byte):string; 
  { Convierte un byte a hexadecimal } 
  const 
    cadena: string[16] = '0123456789ABCDEF'; 
  begin 
    hex := cadena[a div 16 + 1]       { La primera letra: dividir entre 16 } 
      + cadena[a mod 16 + 1];         { La segunda: resto de la divisi�n } 
  end;
 
  FUNCTION LEFT(const cad:string; const n:byte):string; 
  { Cadena formada por los n caracteres m�s a la izquierda } 
  var 
    temp: string; 
  begin 
    If n > length(cad) then         { Si piden m�s que la longitud } 
      temp := cad                  { La cojo entera } 
    else 
      temp := copy(cad,1,n);       { Si no, una subcadena } 
    Left := temp; 
  end;
 
  FUNCTION MAYUSC(const cad:string):string; 
  { Convierte una cadena a may�sculas.  La forma de tratar los caracteres 
    internacionales no es la m�s adecuada, porque pueden variar en las 
    distintas p�ginas de c�digos, pero sirva al menos como ejemplo de 
    c�mo comprobar si un valor est� entre varios dados  O:-) } 
  var 
    buc: byte; 
    cad2: string; 
  begin 
    cad2 := cad; 
    for buc := 1 to length(cad2) do 
      begin 
      if cad2[buc] in ['a'..'z'] then           { Letras "normales" } 
        cad2[buc] := upcase(cad2[buc]); 
      { Internacionales: esto es lo que puede dar problemas } 
      if cad2[buc] in ['�','�','�','�','�'] then cad2[buc]:='A'; 
      if cad2[buc] in ['�','�','�','�','�'] then cad2[buc]:='E'; 
      if cad2[buc] in ['�','�','�','�'] then cad2[buc]:='I'; 
      if cad2[buc] in ['�','�','�','�','�'] then cad2[buc]:='O'; 
      if cad2[buc] in ['�','�','�','�','�'] then cad2[buc]:='U'; 
      if cad2[buc] = '�' then cad2[buc]:='�' 
      end; 
      mayusc := cad2                             { Valor definitivo } 
  end;
 
  FUNCTION RIGHT(const cad:string; const n:byte):string; 
  { Cadena formada por los n caracteres m�s a la derecha } 
  var 
    temp: string; 
  begin 
    If n > length(cad) then                   { Si piden m�s que la longitud } 
      temp := cad                            { La cojo entera } 
    else 
      temp := copy(cad, length(cad)-n+1, n); { Si no, subcadena } 
    right := temp; 
  end;
 
  FUNCTION SPC(const n: byte):string; 
  { Cadena formada por n espacios en blanco } 
  var 
    t: string; 
    i: byte; 
  begin 
    t := ' ';                         { Al menos uno } 
    for i := 2 to n do t:=t+' ';      { Si hay dos o m�s, a�ado } 
    spc := t 
  end;
 
  FUNCTION STRS(const valor:longint):string; 
  { Simplemente porque me gusta m�s usar STR como funci�n que como 
    procedimiento (recuerdos del Basic, supongo) } 
  var 
    temporal: string; 
  begin 
    str(valor,temporal);             { Llamo al procedimiento STR } 
    strs := temporal; 
  end;
 
  FUNCTION STRSR(const valor:real):string; 
  { Igual que STRS, pero para n�meros reales (deja 2 decimales) } 
  var 
    temporal: string; 
  begin 
    str(valor:3:2,temporal); 
    strsr := temporal; 
  end;
 
  FUNCTION VALORW(const cad:string):word; 
  { Valor de un string como WORD, para evitar usar VAL como procedimiento 
    que es m�s potente pero tambi�n m�s inc�modo a veces (posiblemente, 
    esto tambi�n est� aqu� por culpa del Basic ;-) ) } 
  var 
    uno:word; 
    code:integer; 
  begin 
    val(cad,uno,code); 
    valorw:=uno; 
  end;
 
  FUNCTION VALORLI(const cad:string):longint; 
  { Igual que VALORW, pero para LongInt } 
  var 
    uno:longint; 
    code:integer; 
  begin 
    val(cad,uno,code); 
    valorli:=uno; 
  end;
 
  FUNCTION VALORR(const cad:string):real; 
  { Igual que VALORW, pero para reales.  Primero cambia las , por . } 
  var 
    uno:real; 
    code:integer; 
    cad2:string; 
  begin 
    cad2:=cad; 
    while Pos(',', cad2) > 0 do               { Le cambio , por . (si hay) } 
      cad2[Pos(',', cad2)]:= '.'; 
    val(cad2,uno,code);                       { Y llamo al procedimiento } 
    valorr:=uno; 
  end;
 
end. 