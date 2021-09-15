program p;

{Объявление переменных-----------------------------------}
type
  cars = record
    name:string;
    year:integer;
    price:int64;
  end;
  group = array[1..5] of cars;
var
  s:group;
  j,k,c,count:byte;
  a,b:string[1];
  search,fIntName,fIntToName,fIntFromName1,fIntFromName2:string;
  fInt,fIntTo,fIntFrom1,fIntFrom2: file of group;

{Процедура ввода данных-----------------------------------}
procedure inputCar;
  begin
    repeat
      j:=j+1;
      with s[j] do
        begin
          write('Enter label: ');
          readln(name);
          write('Enter year: ');
          readln(year);
          write('Enter price: ');
          readln(price);
       end;
      write('Do you have a car else?(y,n): ');
      readln(b);
    until b='n';
  end;

{Процедура вывода данных-----------------------------------}
procedure outputCars;
  begin
    for k:=1 to j do
      begin
        with s[k] do
          begin
           write('label: ',name);
           write('  year: ',year);
           write('  price: ',price);
           writeln;
          end;  
      end;
  end;

{Процедура поиска машин по марке-----------------------------------}
procedure searchCar;
  begin
    count:=0;
    readln(search);
    for k:=1 to j do
      begin
       with s[k] do
         begin
           if name=search then
            begin 
              write('label: ',name);
              write('  year: ',year);
              write('  price: ',price);
              writeln;
              count:=count+1;
            end;
         end;
      end;  
    if count=0 then write('No results');
    count:=0;
    writeln;
  end;

{Процедура вывода машин дороже 1 000 000-----------------------------------}
procedure outputExpensiveCars;
  begin
    count:=0;
    for k:=1 to j do
      begin
       with s[k] do
         begin
           if price > 1000000 then 
            begin
              write('label: ',name);
              write('  year: ',year);
              write('  price: ',price);
              writeln;
              count:=count+1;
            end;
         end;
      end;
    if count=0 then write('No results');
    count:=0;
    writeln;
  end;

{Процедура записи в файл----------------------------------------------}
procedure saveInFile;
  begin
    write('Enter file name: ');
    readln(fIntName);
    assign(fInt,fIntName);
    rewrite(fInt);
    write(fInt,s);
    close(fInt);
  end;

{Процедура чтения файлов----------------------------------------------}
procedure readFile;
  begin
    write('Enter file name: ');
    readln(fIntName);
    assign(fInt,fIntName);
    reset(fInt);
    while not EOF(fInt) do
      begin
        read(fInt,s);
        k:=1;
          while s[k].name <> '' do
            begin
              with s[k] do
                begin
                 write('label: ',name);
                 write('  year: ',year);
                 write('  price: ',price);
                 writeln;
                end;  
              k:=k+1;
          end;
      end;
    close(fInt);
  end;

{Процедура объединения файлов----------------------------------------------}
procedure uniteFiles;
  begin
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

{Процедура копирования файлов----------------------------------------------}
procedure copyFiles;
  begin
    write('Enter source file name: ');
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
    close(fIntTo);
  end;

{Тело программы-------------------------------------------------}
begin
  j:=0;
  a:='y';
  while a='y' do
    begin
      writeln('Choose an action: ');
      writeln('1.Input information about a car');
      writeln('2.Output information about cars');
      writeln('3.Search a car');
      writeln('4.Output cars more expensive than 1 000 000');
      writeln('5.Save in file');
      writeln('6.Read a file');
      writeln('7.Unite files');
      writeln('8.Copy files');
      writeln('9.Exit');
      readln(c);
      case c of
        1:inputCar;
        2:outputCars;
        3:searchCar;
        4:outputExpensiveCars;
        5:saveInFile;
        6:readFile;
        7:uniteFiles;
        8:copyFiles;
        9:begin
            write('Would you like to repeat the program?(y,n): ');
            readln(a);
            j:=0;
          end;
        else writeln('Invalid number');
      end;
    end;
end.
