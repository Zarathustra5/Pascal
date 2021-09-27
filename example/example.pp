unit example;

interface

function GetCount (str: string): Integer;
var str:string;
    count:integer;
implementation

function GetCount (str: string): Integer;
var n,i:integer;
begin
  count:=0;
  n:=length(str);
  for i:=1 to n do
  begin
    if str[i] in ['a','e','i','o','u'] then count:=count+1;
  end;
  GetCount:=count;
end;
begin
  write('Enter string: ');
  readln(str);
  write('Result: ',GetCount(str));
end.
