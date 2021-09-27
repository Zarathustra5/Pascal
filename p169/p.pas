program p;

type
  student = record
    number:byte;
    surname:string;
    ocenki:array[1..7] of byte;
    average:real;
  end;
  group = array[1..10] of student;
var
  s,s2:group;
  sum,i,j,k,c,count:byte;
  a,b:string[1];
  search,fIntName,fIntToName,fIntFromName1,fIntFromName2:string;
  fInt,fIntTo,fIntFrom1,fIntFrom2: file of group;
begin
  j:=0;
  a:='y';
  while a='y' do
    begin
      writeln('Choose an action: ');
      writeln('1.Input information about students');
      writeln('2.Output information about students');
      writeln('3.Average of ocenki');
      writeln('4.Search a student');
      writeln('5.Exit');
      writeln('6.Save in file');
      writeln('7.Read a file');
      writeln('8.Unite files');
      writeln('9.Unite files without same strings');
      readln(c);
      case c of
        1:begin
            repeat
              sum:=0;
              j:=j+1;
              with s[j] do
                begin
                  number:=j;
                  write('Enter the surname: ');
                  readln(surname);
                  write('Enter the ocenki: ');
                  for i:=1 to 7 do 
                    begin
                     readln(ocenki[i]);
                    end;
               end;
              write('Do you have a student else?(y,n): ');
              readln(b);
            until b='n';
          end;
        2:begin
            for k:=1 to j do
              begin
                with s[k] do
                  begin
                   write('number: ',number);
                   write('  surname: ',surname);
                   write('  ocenki: ');
                   for i:=1 to 7 do write('':1,ocenki[i]:1);
                   writeln;
                  end;  
              end;
          end;
        3:begin
            for k:=1 to j do
              begin
               sum:=0;
               with s[k] do
                 begin
                   number:=k;
                   for i:=1 to 7 do sum:=sum+ocenki[i];
                   average:=sum/7;
                 end;
              end;
            for k:=1 to j do
              begin
               write('number: ',s[k].number);
               write('  average: ',s[k].average:0:1);
               writeln;
              end;  
          end;
        4:begin
            count:=0;
            readln(search);
            for k:=1 to j do
              begin
               with s[k] do
                 begin
                   if surname=search then
                    begin 
                      for i:=1 to 7 do 
                        begin
                          write('':1,ocenki[i]:1);
                          count:=count+1;
                        end;
                    end;
                 end;
              end;  
            if count=0 then write('No results');
            count:=0;
            writeln;
          end;
        5:begin
            write('Would you like to repeat the program?(y,n): ');
            readln(a);
            j:=0;
          end;
        6:begin
            write('Enter file name: ');
            readln(fIntName);
            assign(fInt,fIntName);
            rewrite(fInt);
            write(fInt,s);
            close(fInt);
          end;
        7:begin
            write('Enter file name: ');
            readln(fIntName);
            assign(fInt,fIntName);
            reset(fInt);
            while not EOF(fInt) do
              begin
                read(fInt,s);
                k:=1;
                while s[k].number<>0 do
                  begin
                    with s[k] do
                      begin
                       write('number: ',number);
                       write('  surname: ',surname);
                       write('  ocenki: ');
                       for i:=1 to 7 do write('':1,ocenki[i]:1);
                       writeln;
                      end;  
                    k:=k+1;
                  end;
              end;
            close(fInt);
          end;
        8:begin
            write('Enter first source file name: ');
            readln(fIntFromName1);
            assign(fIntFrom1,fIntFromName1);
            write('Enter destine file name: ');
            readln(fIntToName);
            assign(fIntTo,fIntToName);
            reset(fIntFrom1);
            rewrite(fIntTo);
            while not EOF(fIntFrom1) do
              begin
                read(fIntFrom1,s);
                write(fIntTo,s);
              end;
            close(fIntFrom1);
            write('Enter second source file name: ');
            readln(fIntFromName2);
            assign(fIntFrom2,fIntFromName2);
            reset(fIntFrom2);
            while not EOF(fIntFrom2) do
              begin
                read(fIntFrom2,s);
                write(fIntTo,s);
              end;
            close(fIntFrom2);
            close(fIntTo);
          end;
        9:begin
            count:=0;
            write('Enter first source file name: ');
            readln(fIntFromName1);
            assign(fIntFrom1,fIntFromName1);
            write('Enter destine file name: ');
            readln(fIntToName);
            assign(fIntTo,fIntToName);
            reset(fIntFrom1);
            rewrite(fIntTo);
            while not EOF(fIntFrom1) do
              begin
                read(fIntFrom1,s);
              end;
            close(fIntFrom1);
            write('Enter second source file name: ');
            readln(fIntFromName2);
            assign(fIntFrom2,fIntFromName2);
            reset(fIntFrom2);
            while not EOF(fIntFrom2) do
              begin
                read(fIntFrom2,s2);
                if
              end;
            close(fIntFrom2);
            close(fIntTo);
            count:=0;
            k:=0;
            c:=0;
          end;
        else write('Invalid number');
      end;
    end;
end.
