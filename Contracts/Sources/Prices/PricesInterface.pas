unit PricesInterface;

interface

uses Ibase, PricesMain, Forms, Windows, Classes, UParamsReestr,  Controls, cn_Common_Types,
     Dialogs;

procedure GetPrices        (AOwner:TComponent; DbHandle:TISC_DB_HANDLE; Id_user:Int64);stdcall;
procedure ShowPrices       (AParameter:TcnSimpleParams);stdcall;
procedure GetPrice         (AOwner:TComponent; DbHandle:TISC_DB_HANDLE; Id_price:Int64;           Id_User:Int64);stdcall;
function  GetPricesByPeriod(AOwner:TComponent; DbHandle:TISC_DB_HANDLE; DateBeg,DateEnd:TDateTime;Id_user:Int64):Variant;stdcall;

exports GetPrices, GetPrice, GetPricesByPeriod, ShowPrices;


implementation
function GetPricesByPeriod(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;DateBeg,DateEnd:TDateTime;Id_user:Int64):Variant;
var Res:Variant;
begin
      with TfrmPriceReestr.Create(AOwner,DbHandle,DateBeg,DateEnd,Id_User) do
      begin
           if ShowModal=mrYes
           then begin
                     Res:=Result;
           end;
           Free;
      end;

      Result:=Res;
end;

procedure GetPrice(AOwner:TComponent; DbHandle:TISC_DB_HANDLE;Id_price:Int64;Id_User:Int64);
var
  T:TfrmPriceReestr;
begin
      {f :=true;
      for i:=0 to Application.MainForm.MDIChildCount-1 do
      begin
           if (Application.MainForm.MDIChildren[i] is TfrmPriceReestr)
           then begin
                     if TfrmPriceReestr(Application.MainForm.MDIChildren[i]).new_Id_price=Id_price
                     then begin
                               Application.MainForm.MDIChildren[i].BringToFront;
                               f:=false;
                     end;
           end;
      end;
      if f then TfrmPriceReestr.Create(AOwner,DbHandle,Id_price,Id_User);
 }
 T:=TfrmPriceReestr.Create(AOwner,DbHandle,Id_price,Id_User);
 T.ShowModal;
 T.Free;
end;

procedure ShowPrices(AParameter:TcnSimpleParams);
var f:Boolean;
    i:Integer;
begin
    f :=true;
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    begin
         if (Application.MainForm.MDIChildren[i] is TfrmPricesMain)
         then begin
                           Application.MainForm.MDIChildren[i].BringToFront;
                           f:=false;
         end;
    end;
    if f then TfrmPricesMain.create(AParameter.Owner,AParameter.Db_Handle,AParameter.id_user);
end;

procedure GetPrices(AOwner:TComponent; DbHandle:TISC_DB_HANDLE; Id_user:Int64);
var f:Boolean;
    i:Integer;
begin
    f :=true;
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    begin
         if (Application.MainForm.MDIChildren[i] is TfrmPricesMain)
         then begin
                           Application.MainForm.MDIChildren[i].BringToFront;
                           f:=false;
         end;
    end;
    if f then TfrmPricesMain.create(Aowner,DbHandle,id_user);
end;

end.
