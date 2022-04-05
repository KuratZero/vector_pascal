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
    upd_size: Integer;
    procedure plus_size();
    begin
      if(emgSize >= realSize) then begin
        var tmpArr: array of T;
        tmpArr := arr;
        arr := new T[realSize * upd_size];
        realSize := realSize * upd_size;
        for var i := 0 to emgSize - 1 do
          arr[i] := tmpArr[i];
      end;
    end;
  public
    constructor Create(count: integer := 1; mn_size: Integer := 2);
    begin
      emgSize := 0;
      realSize := count;
      upd_size := mn_size;
      arr := new T[count];
    end;
    function size(): Integer;
    begin
      size := emgSize;
    end;
    function get(index: Integer): T;
    begin
      get := arr[index];
    end;
    function getPointer(index: Integer): ^T;
    begin
      getPointer := @arr[index];
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
    procedure erase(index: Integer);
    begin
      for var i := index to emgSize - 2 do
        arr[i] := arr[i + 1];
      dec(emgSize);
    end;
    procedure clear();
    begin
      emgSize := 0;
    end;
    procedure reserve(size: Integer);
    //reload data
    begin
      emgSize := 0;
      realSize := size;
      arr := new T[size];
    end;
    procedure resize(size: Integer);
    //with safe data
    begin
      if(size >= realSize) then begin
        realSize := size;
        var tmpArr: array of T;
        tmpArr := arr;
        arr := new T[size];
        for var i := 0 to emgSize - 1 do
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
  //Example getPointer and change
  writeln;
  writeln('Example getPointer and change');
  v.getPointer(0)^ := 0;
  v.getPointer(4)^ := 0;
  v.getPointer(8)^ := 0;
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
  //Example erase
  writeln;
  writeln('Example erase');
  v.erase(0);
  v.erase(5);
  writeln('size of vector = ', v.size());
  for var i := 0 to v.size() - 1 do begin
    writeln('v[', i, '] = ', v.get(i));
  end;
  //Example clear & reserve
  writeln;
  writeln('Example clear & reserve');
  writeln('size of vector = ', v.size());
  writeln('real size of vector = ', v.realSize);
  v.clear();
  writeln('size of vector = ', v.size());
  writeln('real size of vector = ', v.realSize);
  v.reserve(1000);
  writeln('size of vector = ', v.size());
  writeln('real size of vector = ', v.realSize);
  //Example resize
  writeln;
  writeln('Example resize');
  v.resize(10);
  writeln('size of vector = ', v.size());
  writeln('real size of vector = ', v.realSize);
  for var i := 0 to v.size() - 1 do begin
    writeln('v[', i, '] = ', v.get(i));
  end;
  v.resize(2000);
  writeln('size of vector = ', v.size());
  writeln('real size of vector = ', v.realSize);
end.
