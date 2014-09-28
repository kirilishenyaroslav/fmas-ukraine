{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit uCreateVed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxControls, cxContainer, MainInvKartForm, 
  cxEdit, cxLabel, cxRadioGroup, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxCurrencyEdit, FIBQuery, pFIBQuery, pFIBStoredProc, Ibase,
  FIBDatabase, pFIBDatabase, UWaite, ClassInvKart, uResources, uMatasVars,
  cxButtonEdit, cxCheckBox, uMatasUtils, uSpMatSchMulti;

type
  TfmCreateVedomost = class(TForm)
    cxButtonCancel: TcxButton;
    cxButtonCreate: TcxButton;
    cxLabelMainCaption: TcxLabel;
    cxRadioButtonBuh: TcxRadioButton;
    cxRadioButtonNal: TcxRadioButton;
    cxDateEditPeriod: TcxDateEdit;
    cxLabelPeriod: TcxLabel;
    cxLabelCoeff: TcxLabel;
    cxCurrencyEditCoeff: TcxCurrencyEdit;
    pFIBStoredProcForVed: TpFIBStoredProc;
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    cxSCH: TcxCheckBox;
    cxSchList: TcxButtonEdit;
    procedure cxButtonCancelClick(Sender: TObject);
    procedure cxButtonCreateClick(Sender: TObject);
    procedure cxSchListPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxSCHPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    fm_baseik : TfmMainIvKartForm;
    date_recik : TdateTime;
    Type_accountik : integer;
    tip_amortik : string;
    id_vedomostik : Int64;
  public
    DBHandle:TISC_DB_HANDLE;
    FILTER_ID_SESSION:Integer;
    constructor Create(mformd: TfmMainIvKartForm; date_nowsd : TDateTime; TYPE_ACd : integer; DatBadd: TISC_DB_HANDLE); reintroduce; overload;
  end;

var
  fmCreateVedomost: TfmCreateVedomost;

implementation

uses uAmort_selection;

{$R *.dfm}

constructor TfmCreateVedomost.Create(mformd: TfmMainIvKartForm; date_nowsd: TDateTime; TYPE_ACd : integer; DatBadd: TISC_DB_HANDLE);
var
    i : integer;
    str : string;
begin
    inherited Create(nil);
    fm_baseik                    := mformd;
    date_recik                   := date_nowsd;
    Type_accountik               := TYPE_ACd;
    pFIBDatabase1.Handle         := DatBadd;
    DBHandle                     := DatBadd;

    Caption                    := MAT_INV_system_name + MAT_INV_create_ved;
    cxButtonCreate.Caption     := MAT_INV_ved_create;
    cxButtonCancel.Caption     := MAT_INV_Cansel;
    cxRadioButtonBuh.Caption   := MAT_INV_norm_buh_uch;
    cxRadioButtonNal.Caption   := MAT_INV_norm_nal_uch;
    cxLabelPeriod.Caption      := MAT_INV_date_narah;
    cxLabelCoeff.Caption       := MAT_INV_coeff_amort;
    cxCurrencyEditCoeff.text   := '1';


    if Type_accountik = 1 then
    begin
        cxLabelMainCaption.Caption := MAT_INV_sm;
        cxRadioButtonBuh.Enabled   := false;
        cxRadioButtonNal.Enabled   := false;
        {str := DateToStr(date_rec);
        str := '01.01.'+str[7]+str[8]+str[9]+IntToStr(StrToInt(str[10])+1);
        date_rec := StrToDate(str);}
        tip_amortik:= '2';
    end;
    if Type_accountik = 2 then
    begin
        cxLabelMainCaption.Caption := MAT_INV_hoz_raz;
        cxRadioButtonBuh.Enabled   := true;
        cxRadioButtonNal.Enabled   := true;
    end;
    cxDateEditPeriod.Date      := date_recik;
    if _PRINT_INV_VED_BY_SCH = 1 then
    begin
     cxSCH.Visible:=True;
     cxSchList.Visible:=True;
     cxSCH.checked:=False;
     cxSchList.enabled:=False;
    end
    else
    begin
     cxSCH.Visible:=False;
     cxSchList.Visible:=False;
    end;
end;

procedure TfmCreateVedomost.cxButtonCancelClick(Sender: TObject);
begin
    close;
end;

procedure TfmCreateVedomost.cxButtonCreateClick(Sender: TObject);
VAR
    res : Variant;
    strik, chisloik, godokik : string;
    //T : TfmAmSelect;
    TT : TfmWaite;
begin
    TT := TfmWaite.creATE(Self);
    TT.Label1.Caption := MAT_INV_loading;
    Application.Initialize;
    TT.Show;
    TT.Repaint;
    TT.cxProgressBar1.Position := 0;

    if (cxRadioButtonBuh.Enabled   = true) and (cxRadioButtonNal.Enabled   = true) then
    begin
        if (cxRadioButtonBuh.Checked = false) and (cxRadioButtonNal.Checked = false) then
        begin
            showMessage(MAT_INV_select_tepy);
            exit;
        end;

        strik := DateToStr(cxDateEditPeriod.date);
        strik := '01.' + strik[4] + strik[5] + strik[6] + strik[7] + strik[8] + strik[9] + strik[10];
        date_recik := StrToDate(strik);

        if cxRadioButtonBuh.Checked then
        begin
            tip_amortik:= '1';
        end;
        if cxRadioButtonNal.Checked then
        begin
            tip_amortik:= '0';
        end;
        cxDateEditPeriod.Date := date_recik;
    end;
    //************************   Insert into vedomost'   ***********************
    try
       pFIBStoredProcForVed.Close;
       pFIBStoredProcForVed.Database    := fm_baseik.DatabaseMain;
       pFIBStoredProcForVed.Transaction := fm_baseik.WriteTransaction;
       pFIBStoredProcForVed.Transaction.StartTransaction;
       pFIBStoredProcForVed.StoredProcName:='MAT_INV_ADD_AMORT_VED';
       pFIBStoredProcForVed.Prepare;
       pFIBStoredProcForVed.ParamByName('tip').AsString         := tip_amortik;
       pFIBStoredProcForVed.ParamByName('date_amort').AsDate    := cxDateEditPeriod.Date;
       pFIBStoredProcForVed.ParamByName('coeff').AsString       := cxCurrencyEditCoeff.Text;
       pFIBStoredProcForVed.ExecProc;
       id_vedomostik := pFIBStoredProcForVed.ParamByName('id_amort_ved').AsInt64;
    except on E : Exception do
         begin
             ShowMessage(E.Message);
             pFIBStoredProcForVed.Transaction.Rollback;
             exit;
         end;
    end;
    pFIBStoredProcForVed.Transaction.Commit;

    TT.cxProgressBar1.Position := TT.cxProgressBar1.Position + 50;
    TT.UpDate;
    //*******************   Insert into amort_history   ************************
    if cxSchList.visible=false then FILTER_ID_SESSION:=0;
   
    Save_amort_calc(id_vedomostik, FILTER_ID_SESSION);

    res := UAmort_selection.ShowAm_Ved({self,} pFIBDatabase1.Handle, id_vedomostik, true);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) then
        begin
            //
        end;
    end;
    //T := TfmAmSelect.Create(self, pFIBDatabase1.Handle, id_vedomostik, true);
    TT.cxProgressBar1.Position := 100;
    TT.Update;
    TT.Free;

    //T.ShowModal;
    //T.Free;
    close;
end;

procedure TfmCreateVedomost.cxSchListPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
  Res : Variant;
  mr: boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
 mr:=false;
 if FILTER_ID_SESSION=0 then
  FILTER_ID_SESSION:=pFIBDatabase1.Gen_Id('MAT_ID_SESSION',1, pFIBTransaction1);

 Res:=uSpMatSchMulti.GetMatSchMulti(self, DBHandle, 0, FILTER_ID_SESSION, mr);
 if mr then begin
  if  VarType(Res) <> varEmpty then begin
   VarDimCnt:=VarArrayHighBound(Res,  1);
   s:='';
   for i:=0 to VarDimCnt do begin
    s:=s+VarToStr(Res[i][1])+';';
   end;
   cxSchList.Text := s;
   //F_SCH:=true;
  end
 end
 else
 begin
 // F_SCH:=false;
  FILTER_ID_SESSION:=0;
  cxSchList.Text:='';
 end;

end;

procedure TfmCreateVedomost.cxSCHPropertiesChange(Sender: TObject);
begin
if cxSCH.Checked=True then cxSchList.Enabled:=True else cxSchList.Enabled:=False;  
end;

end.
