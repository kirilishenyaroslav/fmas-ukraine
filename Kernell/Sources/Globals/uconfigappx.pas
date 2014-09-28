unit UConfigAppx;

interface

uses IniFiles, TypInfo, Forms, Classes, SysUtils, cxDropDownEdit,
     cxMRUEdit;

type
   TListValStr=string;
   //Работа с  ини файлом
   procedure SetLookupListValues(ListValues:TcxComboBox);
   procedure SetLookupListValuesMRU(ListValues:TcxMRUEdit;SourceString:TListValStr;Id_Object:Integer);


   procedure GetLookupListValues(ListValues:TcxComboBox;SourceString:TListValStr);
   procedure GetLookupListValuesMRU(ListValues:TcxMRUEdit;SourceString:TListValStr;SourceStringId:TListValStr);

   procedure DumpLookupListValues(ListValues:TcxComboBox; var SourceString:TListValStr);
   procedure DumpLookupListValuesMRU(ListValues:TcxMRUEdit;var SourceString:TListValStr; var SourceStringId:TListValStr);


   procedure ReadWriteIni(Form: TForm; Write: Boolean);


implementation

procedure SetLookupListValuesMRU(ListValues:TcxMRUEdit;SourceString:TListValStr;Id_Object:Integer);
var ExistFlag:Boolean;
    i,FindIndex:Integer;
begin
           ExistFlag:=false; FindIndex:=0;
           for i:=0 to ListValues.Properties.LookupItems.Count-1 do
           begin
              if Trim(SourceString)=Trim(ListValues.Properties.LookupItems[i]) then ExistFlag:=true                                                                                  else FindIndex:=i;
           end;
           if not ExistFlag
           then begin
                if (ListValues.Properties.LookupItems.Count=7)
                then begin
                    ListValues.Properties.LookupItems.Delete(6);
                end;
                ListValues.Properties.LookupItems.AddObject(SourceString,TObject(Id_Object));
           end
           else begin
                ListValues.Properties.LookupItems.Move(FindIndex,0);
           end;
end;

procedure SetLookupListValues(ListValues: TcxComboBox);
var ExistFlag:Boolean;
    i,FindIndex:Integer;
begin
           ExistFlag:=false; FindIndex:=0;
           for i:=0 to ListValues.Properties.Items.Count-1 do
           begin
              if Trim(ListValues.Text)=Trim(ListValues.Properties.Items[i]) then ExistFlag:=true
                                                                                  else FindIndex:=i;
           end;
           if not ExistFlag
           then begin
                if (ListValues.Properties.Items.Count=7)
                then begin
                    ListValues.Properties.Items.Delete(6);
                end;
                ListValues.Properties.Items.Add(ListValues.Text);
           end
           else begin
                ListValues.Properties.Items.Move(FindIndex,0);
           end;
end;


procedure GetLookupListValuesMRU(ListValues:TcxMRUEdit;SourceString:TListValStr;SourceStringId:TListValStr);
var PS1,PS2:Integer;
    IntValue:String;
    Value  :Integer;
begin
        While Length(SourceString)>0 do
        begin
           Ps1:=Pos(';',SourceString);
           Ps2:=Pos(';',SourceStringId);
           IntValue:=Copy(SourceStringId,1,Ps2-1);
           try
               Value:=StrToInt(IntValue);
           except on Exception do
           end;
           ListValues.Properties.LookupItems.AddObject(Copy(SourceString,1,Ps1-1),TObject(Value));
           Delete(SourceString,1,Ps1);
           Delete(SourceStringId,1,Ps2);
        end

end;


procedure GetLookupListValues(ListValues: TcxComboBox;
  SourceString: TListValStr);
var PS:Integer;
begin
        While Length(SourceString)>0 do
        begin
           Ps:=Pos(';',SourceString);
           ListValues.Properties.Items.Add(Copy(SourceString,1,Ps-1));
           Delete(SourceString,1,Ps);
        end

end;

procedure DumpLookupListValuesMRU(ListValues:TcxMRUEdit;var SourceString:TListValStr; var SourceStringId:TListValStr);
var i:Integer;
begin
    SourceString:='';
    SourceStringId:='';
    for i:=0 to ListValues.Properties.LookupItems.Count-1 do
    begin
         SourceString:=SourceString+ListValues.Properties.LookupItems[i]+';';
         SourceStringId:=SourceStringId+IntToStr(integer(ListValues.Properties.LookupItems.Objects[i]))+';';
    end;

end;


procedure DumpLookupListValues(ListValues: TcxComboBox;
  var SourceString: TListValStr);
var i:Integer;
begin
    SourceString:='';
    for i:=0 to ListValues.Properties.Items.Count-1 do
    begin
         SourceString:=SourceString+ListValues.Properties.Items[i]+';';
    end;
end;



procedure WriteProp(Ini: TCustomIniFile; Section: string;
 Obj: TObject; Info: PPropInfo);
begin
 with Info^ do
   case PropType^.Kind of
     tkInteger, tkEnumeration, tkChar:
       Ini.WriteInteger(Section, Name, GetOrdProp(Obj, Info));
     tkFloat:
       Ini.WriteFloat(Section, Name, GetFloatProp(Obj, Info));
     tkString, tkLString:
       begin
             Ini.WriteString(Section, Name, '');       
             Ini.WriteString(Section, Name, GetStrProp(Obj, Info));
       end;
     tkWString:
       Ini.WriteString(Section, Name, GetWideStrProp(Obj, Info));
   end;
end;


procedure ReadProp(Ini: TCustomIniFile; Section: string;
 Obj: TObject; Info: PPropInfo);
begin
 with Info^ do
 begin
   if not Ini.ValueExists(Section, Name) then Exit;
   case PropType^.Kind of
     tkInteger, tkEnumeration, tkChar:
       SetOrdProp(Obj, Info, Ini.ReadInteger(Section, Name, 0));
     tkFloat:
       SetFloatProp(Obj, Info, Ini.ReadFloat(Section, Name, 0));
     tkString, tkLString:
       SetStrProp(Obj, Info, Ini.ReadString(Section, Name, ''));
     tkWString:
       SetWideStrProp(Obj, Info, Ini.ReadString(Section, Name, ''));
   end;
 end;
end;


procedure ReadWriteNewPubProps(Ini: TCustomIniFile;
 Obj: TForm; Write: Boolean);
var
 J, Size1, Size2: Integer;
 List1, List2: PPropList;
begin
   Size1:=GetTypeData(TForm.ClassInfo).PropCount;
   Size2:=GetPropList(PTypeInfo(Obj.ClassInfo),List1) - Size1;
   GetMem(List2, SizeOf(PPropInfo)*Size2);
   Move((List1^[Size1]), List2^, SizeOf(PPropInfo)*Size2);
   FreeMem(List1, SizeOf(PPropInfo)*Size1);
   for J:=0 to Size2-1 do
     if Write then
       WriteProp(Ini, Obj.Name, Obj, List2[J])
     else
       ReadProp(Ini, Obj.Name, Obj, List2[J]);
   FreeMem(List2, SizeOf(PPropInfo)*Size2);
end;

procedure ReadWriteIni(Form: TForm; Write: Boolean);
var Ini: TIniFile;
begin
 Ini:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'config.ini');
 try
    ReadWriteNewPubProps(Ini, Form, Write);
 finally
   Ini.Free;
 end;
end;


end.
