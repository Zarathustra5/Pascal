program p;

procedure findMax;
  var i,max,masLength:integer;
      mas:array [1..100] of integer;
  begin
    write('Enter length of massive: ');
    readln(masLength);
    writeln('Massive: ');
    max:=-1000;
    for i:=1 to masLength do
      begin
        mas[i]:=random(201)-100;
        if mas[i]>max then max:=mas[i];
        write(mas[i]:4);
      end;
    writeln;
    writeln('Max = ',max);
  end;

begin
  findMax;
  readln;
end.  
