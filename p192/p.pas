program p;

var n:integer;
    answer:string[1];

function fun(n:integer):longint;
  begin
    if n=0 then writeln(n:3,':opposite')
    else begin
      write(n:3);
      fun(n-1);
      write(n:3);
    end;
  end;

begin
  repeat
    write('Enter n: ');
    readln(n);
    write('Result: ');
    fun(n);
    writeln;
    write('Would you like to repeat the program? (y/n): ');
    readln(answer);
  until answer='n';
  readln;
end.  
