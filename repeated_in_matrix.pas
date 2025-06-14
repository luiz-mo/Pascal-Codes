program repetition_in_matrix;
const max = 100;
type matrix = array [1..max,1..max] of longint;
var M : matrix;
    l,c : longint;

(*this procedure reads the matrix's number of lines and columns and also its elements*)
procedure read_matrix(var M : matrix; var l,c : longint);
var i,j : longint;
begin
	read(l,c);
	for i:=1 to l do
		for j:=1 to c do
			read(M[i,j]);
end;

(*this function searches for the number from the position where this number is in the matrix and return true if the number was found*)
function search(var M : matrix; l,c,x,i,j : longint) : boolean;
begin
	search:=false;
	j:=j+1;
	while (i<=l) AND NOT(search) do 
	begin
		while (j<=c) AND NOT(search) do
		begin
			if M[i,j] = x then
				search := true;
			j:=j+1;
		end;
		i:=i+1;
		j:=1;
	end;
end;

(*this function sends the number and its position to the search function and return true if the number was found*)
function check_repetition(var M : matrix; l,c : longint) : boolean;
var i,j : longint;
begin
	check_repetition:=false;
	i:=1;
	while (i<=l) AND NOT (check_repetition) do
	begin
		j:=1;
		while (j<=c) AND NOT (check_repetition) do
		begin
			if search(M,l,c,M[i,j],i,j) then
				check_repetition:=true;
			j:=j+1;
		end;
		i:=i+1;
	end;
end;

begin
	read_matrix(M,l,c);
	if check_repetition(M,l,c) then
		writeln('yes')
	else
		writeln('no');
end.
