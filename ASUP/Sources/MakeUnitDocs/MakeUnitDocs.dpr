program MakeUnitDocs;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
	sr: TSearchRec;
	f: Text;
	g: Text;
	s, Short, Full, Owner: String;
	FirstBlock, SecondBlock, ThirdBlock, Process: Boolean;
	num: Integer;
begin
	Assign(g, 'Docs\Modules.html');
	Rewrite(g);
	Writeln(g, '<HTML><HEAD><TITLE>Модули автоматизированной системы управления персоналом</TITLE>');
	Writeln(g, '<LINK REL="StyleSheet" TYPE="text/css" HREF=modules.css></HEAD>');
	Writeln(g,'<BODY>');
	Writeln(g,'<H1>Модули автоматизированной системы управления персоналом</H1>');
	Writeln(g,'<TABLE BORDER=1>');
	Writeln(g,'<TH>№п/п</TH>');
	Writeln(g,'<TH>Название</TH>');
	Writeln(g,'<TH>Содержание</TH>');
	Writeln(g,'<TH>Предназначение</TH>');
	Writeln(g,'<TH>Ответственный</TH>');
	FindFirst('.\*.pas', faAnyFile, sr);
	num := 1;
	repeat
        	Assign(f,sr.Name);
                Reset(f);
                FirstBlock := False;
		SecondBlock := False;
		ThirdBlock := False;
		Process := True;
		Short := '';
		Owner := '';
		Full := '';
		while true do
		begin
			Readln(f, s);
			s := Trim(s);
			if s = '' then
			begin
				if FirstBlock then SecondBlock := True;
				continue;
			end;
                        if s[1] <> '{' then break;
			if s[1] = '{' then
			begin
				if not SecondBlock then
				begin
					s[1] := ' ';
					s[Length(s)] := ' ';
					s := Trim(s);
					if Pos('-internal', s) <> 0 then
					begin
						Process := False;
						break;
					end;
					FirstBlock := True;
					continue;
				end
				else
				if not ThirdBlock then
				begin
					s[1] := ' ';
					s[Length(s)] := ' ';
					s := Trim(s);
					Short := s;
					ThirdBlock := True;
				end
				else
				begin
					s[1] := ' ';
					s[Length(s)] := ' ';
					s := Trim(s);
					if Pos('ответственный',AnsiLowerCase(s)) <> 0
					then
						Owner := Copy(s, Pos(':',s)+1,Length(s))
					else Full := Full + ' ' + s;
				end;
			end;
		end;
		if Process then
		begin
			Writeln(g,'<TR>');
			Writeln(g,'<TD ALIGN=CENTER><P>',num,'</P></TD>');
			Writeln(g,'<TD><P>',sr.Name,'</P></TD>');
			Writeln(g,'<TD><P>',Short,'</P></TD>');
			Writeln(g,'<TD><P>',Full,'</P></TD>');
			Writeln(g,'<TD><P>', Owner, '</P></TD>');
			Writeln(g,'</TR>');
			inc(num);
			Close(f);
		end;
	until FindNext(sr) <> 0;
	Writeln(g,'</TABLE></BODY></HTML>');
        FindClose(sr);
        Close(g);
end.
