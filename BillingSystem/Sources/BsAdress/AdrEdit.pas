unit AdrEdit;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, pFIBDatabase, cxLabel, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, BaseTypes;

type

  TEditForm = class (TForm)
  private
  public
     ReturnId:Int64;
     KeyField:Variant;
     AddInfo:Variant;
     procedure SetParams(DbHandle:TISC_DB_HANDLE; InputId, Add:Variant);
     procedure CloseConnect;
  end;

procedure GlobalBoxFilter(inBox:TcxLookupComboBox; NameField:String);
procedure ShowInfoByBox(inBox:TcxLookupComboBox);

implementation

uses FIBDatabase;

procedure TEditForm.SetParams(DbHandle:TISC_DB_HANDLE; InputId, Add:Variant);
var i:Smallint;
begin
   for i:=0 to ComponentCount-1 do
   begin
      if Components[i] is TpFIBDatabase then
      begin
         (Components[i] as TpFIBDatabase).Handle:=DbHandle;
         Break;
      end;
   end;
   KeyField:=InputId;
   AddInfo:=Add;
end;


procedure GlobalBoxFilter(inBox:TcxLookupComboBox; NameField:String);
begin
   inBox.Properties.DropDownHeight:=100;
   if inBox.EditText<>'' then
   begin
       inBox.Properties.ListSource.DataSet.Filtered := False;
       inBox.Properties.ListSource.DataSet.Filter := 'UPPER('+AnsiUpperCase(NameField)+') LIKE '''+'%'+
                                                     AnsiUpperCase(inBox.EditText) + '%'' and '+NameField+' is not null';
       inBox.Properties.ListSource.DataSet.Filtered := True;
   end
   else
   begin
      inBox.Properties.ListSource.DataSet.Filtered := False;
   end;
end;

procedure TEditForm.CloseConnect;
var i, j:SmallInt;
begin
  try
     for i:=0 to ComponentCount-1 do
     begin
        if Components[i] is TpFIBDatabase then
        begin
           for j:=0 to (Components[i] as TpFIBDatabase).TransactionCount-1 do
           begin
              if (Components[i] as TpFIBDatabase).Transactions[j].Active
              then (Components[i] as TpFIBDatabase).Transactions[j].Rollback;
           end;
           (Components[i] as TpFIBDatabase).Close;
           Break;
        end;
     end;
  except on E:Exception
         do agMessageDlg('гтрур!', E.Message, mtInformation, [mbOK]);
  end;
end;

procedure ShowInfoByBox(inBox:TcxLookupComboBox);
begin
   if not VarIsNull(inBox.EditValue) then
      agMessageDlg(Application.Title, inBox.Properties.KeyFieldNames+': '+IntToStr(inBox.EditValue), mtInformation, [mbOK]);
end;

end.
