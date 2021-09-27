program p;

var n:integer;
    answer:string[1];

function findFactorial(n:integer):longint;
  begin
    if n>0 then findFactorial:=n*findFactorial(n-1)
    else findFactorial:=1;
  end;

begin
  repeat
    write('Enter n: ');
    readln(n);
    writeln('Factorial: ',findFactorial(n));
    write('Would you like to repeat the program? (y/n): ');
    readln(answer);
  until answer='n';
  readln;
end.  
