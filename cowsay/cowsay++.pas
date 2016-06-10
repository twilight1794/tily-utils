Program Cowsay(input, output);
begin
{uses BASICstr;}
if paramCount() = 1 then
        funcUser()
else if paramCount() <> 3 then
        halt(1)
else
        funcConsole(paramStr(1), paramStr(2));

procedure funcUser;
        var
                x: String;
                y: String;
        begin
                writeln("Text to show: ");
                readln(x);
                writeln("File of the picture: ");
                readln(y);
                funcConsole(x,y);
        end
procedure funcConsole(a,b: string);
        var
                c: text;
                d: string;
        begin
                assign(c,b);
                reset(c);
                writeln("ษอออออออออออออออออออออออออออออออออออออออออป")
                writeln("บ"+a+"บ")
                writeln("ศอออออออออออออออออออออออออออออออออออออออออผ")
                writeln("\ |")
                writeln(" \|")
                writeln("  |")
                writeln("  .")
                while not eof(c) do
                        begin
                                readln(c,d);
                                writeln(d);
                        end
                close(c);
        end
end.
