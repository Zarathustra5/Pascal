program p;

var n:integer;
    answer:string[1];

function findFibonachi(n:integer):longint;
  begin
    if n<=0 then 
      begin
        n:=0;
        write(n:3); 
      end;
      else if n=1 then 
        begin
          n:=1;
          write(n:3); 
        end;
    else findFibonachi:=n*findFactorial(n-1)
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
