program tvector;
{
  Author: Artemij Kazakov / Kirat
  at 5:19, in 05.04.2022
}
type Vector<T> = class
  private
    emgSize: Integer;
    realSize: Integer;
    arr: array of T;
    procedure plus_size();
    begin
      if(emgSize >= realSize) then begin
        var tmpArr: array of T;
        tmpArr := arr;
        arr := new T[realSize * 2];
        realSize := realSize * 2;
        for var i := 0 to emgSize - 1 do
          arr[i] := tmpArr[i];
      end;
    end;
  public
    constructor Create();
    begin
      emgSize := 0;
      realSize := 1;
      arr := new T[1];
    end;
    function size(): Integer;
    begin
      size := emgSize;
    end;
    function get(index: Integer): T;
    begin
      get := arr[index];
    end;
    procedure set_val(index: Integer; val: T);
    begin
      arr[index] := val;
    end;
    procedure push_back(ins: T);
    begin
      plus_size();
      arr[emgSize] := ins;
      inc(emgSize);
    end;
    procedure pop_back();
    begin
      if(emgSize > 0) then
        dec(emgSize);
    end;
    procedure insert(index: Integer; val: T);
    begin
      plus_size();
      for var i := emgSize downto index + 1 do
        arr[i] := arr[i - 1];
      arr[index] := val;
      inc(emgSize);
    end;
    procedure resize(size: Integer);
    begin
      if(size = 0) then begin
        realSize := 1;
        arr := new T[1];
      end else begin
        realSize := size;
        var tmpArr: array of T;
        tmpArr := arr;
        arr := new T[size];
        for var i := 0 to min(emgSize - 1, size - 1) do
          arr[i] := tmpArr[i];
      end;
      emgSize := size;
    end;
end;


//Example of using the "vector" class below
begin
  var v: Vector<Integer>;
  v := new Vector<Integer>;
  //Example push_back
  for var i := 0 to 10 do
    v.push_back(trunc(random(Integer.MaxValue)));
  writeln('size of vector = ', v.size());
  //Example get
  writeln;
  writeln('Example get');
  for var i := 0 to v.size() - 1 do begin
    writeln('v[', i, '] = ', v.get(i));
  end;
  //Example set_value
  writeln;
  writeln('Example set_value');
  for var i := 0 to v.size() - 1 do begin
    v.set_val(i, trunc(random(Integer.MaxValue)));
    writeln('v[', i, '] = ', v.get(i));
  end;
  //Example pop_back
  writeln;
  writeln('Example pop_back');
  v.pop_back();
  v.pop_back();
  writeln('size of vector = ', v.size());
  for var i := 0 to v.size() - 1 do begin
    writeln('v[', i, '] = ', v.get(i));
  end;
  //Example insert
  writeln;
  writeln('Example insert');
  v.insert(0, -100);
  v.insert(6, -1000);
  writeln('size of vector = ', v.size());
  for var i := 0 to v.size() - 1 do begin
    writeln('v[', i, '] = ', v.get(i));
  end;
end.
