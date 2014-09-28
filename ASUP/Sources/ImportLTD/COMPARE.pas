unit COMPARE;

interface

uses Halcn6db,sysutils, dialogs, windows,DB,variants,crc32,conn_form;

var

      bufferset:THalcyonDataset;

      function compare_crc32(buffername:string;id_pbkey:integer;crc32_read:string;field_search:string):boolean;
      function VFloatToString(field : TField) : String;
implementation



function compare_crc32(buffername:string;id_pbkey:integer;crc32_read:string;field_search:string):boolean;
var
    index,crc32_str:string;
    loCaseInsensitive:TLocateoptions;
    i,res:integer;
    fieldName: String;
  	field: TField;
    val:variant;
    date_form:TformatSettings;
begin
    date_form.ShortDateFormat := 'yyyymmdd';
    date_form.LongDateFormat  := 'yyyymmdd';
  Bufferset.Close;
	Bufferset.TableName := Buffername;
  try
	  Bufferset.Open;
  except
    compare_crc32:=false;
     exit;
  end;
try
   Index:=buffername+'.cdx';
   Bufferset.IndexFileInclude(index);
except
  end;
  SetLength(crc32_str,4096);
  crc32_str:='';
  //bufferset.Locate(field_search,id_pbkey,loCaseInsensitive);
  for i:=0 to  conn_form..FieldCount-1 do
     begin
	  	fieldName := UpperCase(bufferset.Fields[i].FieldName);
  		field := Bufferset.Fields.FindField(fieldName);
  		if field <> nil then
                 begin
                      val := Bufferset[fieldName];

			{if field.DataType = ftBoolean then
				field.Value := ( val = 'T')
			else	field.Value := val;}

			// CRC32_beg
			if (FieldName <> 'CRC32') and (FieldName <> 'SYSTEM_F')
			then begin

				case field.DataType of
					ftString   : if not VarIsNull(field.Value)
							then crc32_str := crc32_str + field.Value;
							//else crc32_str := crc32_str + ' ';

					ftInteger  : if not VarIsNull(field.Value)
							then crc32_str := crc32_str + IntToStr(field.Value)
							else crc32_str := crc32_str + '0';

					ftSmallInt : if not VarIsNull(field.Value)
							then crc32_str := crc32_str + IntToStr(field.Value)
							else crc32_str := crc32_str + '0';

					ftBoolean  : if not VarIsNull(field.Value)
							then begin
								if field.Value  then crc32_str := crc32_str + 'T'
										else crc32_str := crc32_str + 'F';
							end
							else crc32_str := crc32_str + 'F';

					ftFloat    : crc32_str := crc32_str + VFloatToString(field);

					ftDate     : if not VarIsNull(field.Value)
							then crc32_str := crc32_str + DateToStr(field.Value,date_form)
							else crc32_str := crc32_str + '00000000';
				end;
			end;
			// CRC32_end
		end
	end;

//	crc32_str := StringToHalcyonASCII(crc32_str);
  crc32_str := crc32.CrcToString(CalculateCrc32(crc32_str));
 res:=COMPARESTR(crc32_str+'',crc32_read);
    if res<>0// (crc32_read<>crc32_str)
       then compare_crc32:=false
       else compare_crc32:=TRUE;

end;



function VFloatToString(field : TField) : String;    // ??????? ?????????? ? ???????? ???? ???? ????? ???????, ?.?. ???? 250 ????? 250.00
var
	SymbolsAfterDot : Integer;
	res_str : String;
begin
	if UpperCase(field.FieldName) = 'TARST'
	then SymbolsAfterDot := 3
                else SymbolsAfterDot := 2;

        if not VarIsNull(field.Value)
                then res_str := Field.Value
                else res_str := '0';

        if POS('.',res_str) = 0 then res_str := res_str + '.';

        while POS('.',res_str) > Length(res_str) - SymbolsAfterDot
        do res_str := res_str + '0';

        result := res_str;

end;

initialization
  bufferset:=THalcyondataset.Create(nil);


finalization
   bufferset.free;
end.
