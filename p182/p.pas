program p;

var masStart,masFinish,max,maxCount,searchCount:integer;
    answer:string[1];

procedure findMax(masStart,masFinish:integer; var max,maxCount,searchCount:integer);
  var i,search:integer;
      mas:array [1..100] of integer;
  begin
    if masStart<masFinish then 
      begin
        write('Massive: ');
        max:=-1000;
        for i:=masStart to masFinish do
          begin
            mas[i]:=random(201)-100;
            if mas[i]>max then 
              begin
                max:=mas[i];
                maxCount:=i;
              end;
            write(mas[i]:4);
          end;
        writeln;
        write('Search: ');
        readln(search);
        for i:=masStart to masFinish do
          begin
            if search = mas[i] then 
             begin
               searchCount:=i;
               break;
             end;
          end;
      end
    else writeln('Error: massive start should be less than massive finish');
  end;

begin
  repeat
    write('Enter massive start: ');
    readln(masStart);
    write('Enter massive finish: ');
    readln(masFinish);
    findMax(masStart,masFinish,max,maxCount,searchCount);
    writeln('Max= ',max);
    writeln('Max number=',maxCount);
    writeln('Search number= ',searchCount);
    write('Would you like to repeat the program? (y/n): ');
    readln(answer);
    max:=0;
    maxCount:=0;
    searchCount:=0;
  until answer='n';
  readln;
end.  
