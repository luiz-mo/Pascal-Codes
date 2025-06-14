procedure kadane (var v : vector; var global_maximum, local_maximum : longint; size : longint);
var i : longint;
begin
        for i := 1 to size do
        begin
                if local_maximum+v[i] < v[i] then
                        local_maximum:=v[i]
                else
                        local_maximum:=local_maximum+v[i];
                if local_maximum > global_maximum then
                        global_maximum:=local_maximum;
        end;
end;
