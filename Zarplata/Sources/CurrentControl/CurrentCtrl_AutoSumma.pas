unit CurrentCtrl_AutoSumma;

interface

Uses Classes, CurrentCtrl_ByHours, CurrentCtrl_ByAvg, CurrentCtrl_ByPrev,
     Windows,Forms,Controls,SysUtils,Variants,ZTypes,ZProc,Dialogs,
     IBase, Math, Z_StProc_DM, ZDPKConsts, CurrentCtrl_ByAvgSm;

function LoadTaxesForCurrent(AOwner:TComponent;ADb_Handle:TISC_DB_HANDLE;ID_Vidopl:integer;Kod_setup:integer):variant;stdcall;
function SumForPrevPeriod(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;ID_MAN:integer;Kod_Setup:integer;APercent:variant):TFPrev_Result;
function SumForHours(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Id_man_moving:Integer;defpercent, defsumma:Variant;perc,hours, csum:Variant):TFByHours_Result;
function SumForAvg(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;RMoving:Integer;Kod_setup:Integer;NDays:integer):TFAvgDays_Result;
function SumForAvgSmets(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;RMoving:Integer;Kod_setup:Integer;NDays:integer):TFAvgDaysSm_Result;

implementation

uses FIBQuery, StrUtils;

function SumForHours(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;Id_man_moving:Integer;defpercent, defsumma:Variant;perc,hours, csum:Variant):TFByHours_Result;
var Form:TFCurrCtrl_ByHours;
begin
     Form:=TFCurrCtrl_ByHours.Create(AOwner,DB_Handle,Id_man_moving,defpercent, defsumma);
     Form.EditHours.EditValue:=hours;
     Form.EditPercent.EditValue:=perc;

     if (csum<>null) then Form.EditSumma.EditValue:=csum;
     
     with Form do

     if ShowModal=mrYes then
     begin
          Result.Clock:=EditHours.Text;
          Result.Sum_Clock:=StrToFloat(EditSumma.Text);
          Result.Percent := StrToFloat(EditPercent.Text);
          if Trim(Result.Clock)=''
          then Result.Summa:=zRoundTo(StrToFloat(EditSumma.Text)/100*StrToFloat(EditPercent.Text),-2)
          else Result.Summa:=zRoundTo(StrToFloat(EditHours.Text)*StrToFloat(EditSumma.Text)/100*StrToFloat(EditPercent.Text),-2);
          Result.ModalResult:=mrYes;
     end
     else Result.ModalResult:=mrCancel;
     Form.Free;
end;

function SumForAvg(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;RMoving:Integer;Kod_setup:Integer;NDays:integer):TFAvgDays_Result;
var Form:TFAvgDays;
begin
 Form:=TFAvgDays.Create(AOwner,DB_Handle,RMoving,Kod_setup);
 if NDays<>0 then Form.EditData.Text := IntToStr(NDays);
 with Form do
 if ShowModal=mrYes then
  begin
   Result.NumDays:=StrToInt(EditData.Text);
   Result.Summa:=StrToInt(EditData.Text)*StrToFloat(AvgSumEdit.Text);
   Result.ModalResult:=mrYes;
  end
 else Result.ModalResult:=mrCancel;
 Form.Free;
end;

function SumForAvgSmets(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;RMoving:Integer;Kod_setup:Integer;NDays:integer):TFAvgDaysSm_Result;
var Form:TFAvgDaysSm;
begin
 Form:=TFAvgDaysSm.Create(AOwner,DB_Handle,RMoving,Kod_setup);
 if NDays<>0 then Form.EditData.Text := IntToStr(NDays);
 with Form do
 if ShowModal=mrYes then
  begin
   Result.NumDays:=StrToInt(EditData.Text);
   Result.Summa:=StrToFloat(LabelAllSum.Caption);
   Result.IdSession := Form.Session;
   Result.ModalResult:=mrYes;
  end
 else Result.ModalResult:=mrCancel;
 Form.Free;
end;

function SumForPrevPeriod(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;ID_MAN:integer;Kod_Setup:integer;APercent:variant):TFPrev_Result;
var Form:TFPrev;
    tarif:double;
    StProcDM:TStProcDM;
begin
 Form:=TFPrev.Create(AOwner);
 if not VarIsNull(APercent) then Form.EditData.Text:=FloatToStrF(APercent,ffFixed,8,3);
 with Form do
 if ShowModal=mrYes then
  begin
   Result.ModalResult:=mrYes;
   Result.Percent:=StrToFloat(EditData.Text);
   StProcDM:=TStProcDM.Create(AOwner);
   with StProcDM do
    begin
      DB.Handle:=DB_Handle;
      StProc.StoredProcName := 'Z_FACT_TARIF';
      StProc.Transaction.StartTransaction;
      StProc.ParamByName('ID_MAN').AsInteger := ID_MAN;
      StProc.ParamByName('KOD_SETUP').AsInteger := Kod_Setup;
      StProc.ExecProc;
      tarif:=StProc.ParamByName('FACT_TARIF').AsFloat;
      StProc.Transaction.Commit;
      Result.Summa:=zRoundTo(Result.Percent*tarif/100,-2);
    end;
  end
 else Result.ModalResult:=mrCancel;
 Form.Free;
end;

function LoadTaxesForCurrent(AOwner:TComponent;ADb_Handle:TISC_DB_HANDLE;ID_Vidopl:integer;Kod_setup:integer):variant;stdcall;
var
  HandlePack: HModule;
  MDIFUNC   :function (AOwner:TComponent;ADb_Handle:TISC_DB_HANDLE;ID_Vidopl:integer;Kod_setup:integer):variant;stdcall;
  Res:Variant;
begin
  HandlePack:=GetModuleHandle(Bpl_Taxes_Name);
  if HandlePack<32
  then
   try
      Screen.Cursor:=crHourGlass;
      HandlePack := LoadPackage(ExtractFilePath(Application.ExeName)+Bpl_Taxes_name);
   finally
      Screen.Cursor:=crDefault;
   end;

  if HandlePack > 0 then
  begin
            @MDIFUNC:=GetProcAddress(HandlePack,'ViewTaxNetForCurrent');
            if @MDIFUNC<>nil
            then Res:=MDIFUNC(AOwner,ADb_Handle,ID_Vidopl,Kod_setup);
  end
  else
   begin
            MessageBox(TForm(AOwner).Handle,PChar(Load_Error+Bpl_Taxes_Name),PChar(Error_Caption),MB_OK and MB_ICONWARNING);
            Res:=NULL;
   end;
  Result:=Res;
end;

end.
