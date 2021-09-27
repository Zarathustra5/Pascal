unit Kata;

interface
  
type
  TGap = array [0..1] of Int64; 
function Gap(g, m, n: Int64): TGap;

implementation

const
  noGap: TGap = (0, 0);

function Gap(g, m, n: Int64): TGap;
var i,k,count: Int64;
    //Function finds prime numbers----------
    function findPrime(x: Int64): Int64;
    var j,int:Int64;
      begin
        int := round(sqrt(x));
        count := 0;
        for j := 2 to int do
          begin
            if x mod j = 0 then 
              begin
                count += 1;
                break;
              end;
          end;
        findPrime := count;
      end;
    //---------------------------------------
begin
  Gap := noGap;
  if (g >= 2) and (m > 2) and (n >= m) then 
    begin
      for i := m to n do // Search for necessary couple of prime numbers in the interval
        begin
          if i + g <= n then
          begin
            count := findPrime(i); //m
            if count = 0 then 
            begin
              count := findPrime(i+g); //n
              if count = 0 then
              begin
                for k := i+1 to (i + g)-1 do // Search for prime numbers between the two prime numbers
                  begin
                    count := findPrime(k);
                    if count = 0 then 
                      begin
                        Inc(count,2);
                        break;  
                      end;
                  end;
                if count <> 2 then // If there is no prime numbers between'em then record result and stop all the program
                begin
                  Gap[0] := i;
                  Gap[1] := i+g;
                  break;
                end;
              end;
            end;
          end;
        end;
    end;
end;

begin
  Gap(3,4,5);
  write((Gap(3,4,5))[0]);
end.
