program p;

var file1,file2:text;
    file1Name,file2Name:string[24]; 
    sum,i,j,k,c,count:byte;
    a,b:string[1];

begin
  j:=0;
  a:='y';
  while a='y' do
    begin
      writeln('Choose an action: ');
      writeln('1.Create a file');
      writeln('2.Read a file');
      writeln('3.Copy a file to another one');
      writeln('4.Unite files');
      writeln('5.File info');
      readln(c);
      case c of
        1:begin
            
          end;
        else write('Invalid number');
      end;
    end;
end.
