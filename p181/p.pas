program p;

var masStart,masFinish:integer;
    answer:string[1];

function findMax(masStart,masFinish:integer):integer;
  var i,max:integer;
      mas:array [1..100] of integer;
  begin
    writeln('Massive: ');
    max:=-1000;
    for i:=masStart to masFinish do
      begin
        mas[i]:=random(201)-100;
        if mas[i]>max then max:=mas[i];
        write(mas[i]:4);
      end;
    writeln;
    findMax:=max;
  end;

begin
  repeat
    write('Enter massive start: ');
    readln(masStart);
    write('Enter massive fifsh: ');
    readln(masFinish);
    writeln(findMax(masStart,masFinish));
    write('Would you like to repeat the program? (y/n): ');
    readln(answer);
  until answer='n';
  readln;
end.  
