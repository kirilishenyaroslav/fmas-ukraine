{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkPosEditForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxCurrencyEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, ibase, uSpMatSch, uPackageManager, GlobalSPR,
  FIBDatabase, pFIBDatabase, Math, DB, uMatasVars, cxCheckBox, DateUtils;

type
  TDocWorkPosEditForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cxName: TcxButtonEdit;
    CancelButton: TcxButton;
    OkButton: TcxButton;
    cxKolDoc: TcxCurrencyEdit;
    cxKolMat: TcxCurrencyEdit;
    cxSumma: TcxCurrencyEdit;
    cxPrice: TcxCurrencyEdit;
    Label6: TLabel;
    cxUnit: TcxButtonEdit;
    cxNameSch: TcxButtonEdit;
    Label7: TLabel;
    cxCheckWorkPos: TcxCheckBox;
    cxPosNote: TcxTextEdit;
    Label8: TLabel;
    tmr1: TTimer;
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxNamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxUnitPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxNameSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxKolMatExit(Sender: TObject);
    procedure cxKolDocKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxKolMatKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxSummaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxKolDocExit(Sender: TObject);
    procedure cxNameSchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxNameSchExit(Sender: TObject);
    procedure cxNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxPricePropertiesEditValueChanged(Sender: TObject);
    procedure cxKolMatPropertiesEditValueChanged(Sender: TObject);
    procedure cxSummaPropertiesEditValueChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
  private
//
  public
   DBHANDLE : TISC_DB_HANDLE;
   ID_MO_IN, ID_MO_OUT: integer;
   ID_OST: integer;
   ID_NOMN, ID_UNIT, ID_SCH: integer;
   ID_MARK: integer;
   ID_SESSION: integer;
   MAX_KOL_MAT: double;
   CHECK_KOL_MAT: boolean;
   POS_MODE: integer;
   TypeMat: integer;
   ISTFIN_MODE: boolean;
   dateopr:TDateTime;
   is_add_all,not_change_price:Integer;
//   ID_SM, ID_RZ, ID_ST, ID_KEKV: integer;
//   KOD_SM, KOD_RZ, KOD_ST, KOD_KEKV: integer;
  end;

var
  DocWorkPosEditForm: TDocWorkPosEditForm;

implementation

uses uDocWorkOstForm, uDocWorkForm; //, uDocWorkMarks; , uDocWorkBudgetEditForm;
{$R *.dfm}

procedure TDocWorkPosEditForm.OkButtonClick(Sender: TObject);
begin
 tmr1.enabled:=False;
 if cxName.Text='' then
 begin
  ShowMessage('Необхідно вказати назву!');
  cxName.SetFocus;
  Exit;
 end;
 if CHECK_KOL_MAT then
 begin
  if cxKolMat.EditValue>MAX_KOL_MAT then
  begin
   ShowMessage('Кількість повинна бути < '+FloatToStrF(MAX_KOL_MAT, ffNumber, 16, 2));
   Exit;
  end;
 end;
 if (_SET_SCH_ID_DOC=1) and (ID_SCH=0) then
 begin
  ShowMessage('Необхідно вказати рахунок!');
  cxNameSch.SetFocus;
  Exit;
 end;
 
 ModalResult:=mrOk;

end;

procedure TDocWorkPosEditForm.FormCreate(Sender: TObject);
begin
 ID_NOMN:=0;
 ID_UNIT:=0;
 ID_SCH:=0;
 ID_OST:=0;
 ID_MARK:=0;
 if _SET_SCH_ID_DOC=1 then
 begin
  cxNameSch.Style.Color:=clInfoBk
 end;
 CHECK_KOL_MAT:=false;
 TypeMat:=-1;
 dateopr:=StartOfAMonth(3050,1);
end;

procedure TDocWorkPosEditForm.cxNamePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  T: TDocWorkOstForm;
  i: integer;
begin
  if ID_MO_OUT=0 then
  begin
   if POS_MODE=0 then
   begin
    Res:=uPackageManager.LGetNomn(self, DBHandle, fsNormal, 0, ID_NOMN, 0, 0, 0, 0, 0);
    if  VarType(Res) <> varEmpty then
    begin
     ID_NOMN:=Res[0];
     cxName.Text:=Res[1];
     ID_UNIT:=res[2];
     cxUNIT.Text:=res[3];
     cxPRICE.EditValue:=res[4];
     ID_SCH:=res[5];
     cxNameSch.Text:=res[7];
     TypeMat:=1;
    end;
   end;
   if POS_MODE=1 then
   begin
    T:=TDocWorkOstForm.Create(self);
    T.DBHANDLE:=DBHANDLE;
    T.WorkDatabase.Handle:=DBHANDLE;
    T.ID_MO:=ID_MO_IN;
    T.ID_SESSION:=ID_SESSION;
    T.DocOstDataSet.ParamByName('ID_MO').Value:=ID_MO_IN;
    T.DocOstDataSet.ParamByName('ID_SESSION').Value:=ID_SESSION;
    T.OstSpecDataSet.ParamByName('PID_MO').Value:=ID_MO_IN;
    T.OstSpecDataSet.ParamByName('PID_SESSION').Value:=ID_SESSION;
    T.SchDataSet.ParamByName('ID_MO').Value:=ID_MO_IN;
    T.SchDataSet.ParamByName('ID_SESSION').Value:=ID_SESSION;
    T.DocOstDataSet.CloseOpen(False);
    T.OstSpecDataSet.CloseOpen(False);
    T.OstIstfinDataSet.CloseOpen(false);
    T.SchDataSet.CloseOpen(false);
    if ID_OST>0 then
     T.DocOstDataSet.Locate('ID_NOMN',ID_NOMN,[])
    else
     T.DocOstDataSet.First;
    T.KOL_MODE:=-1;
    T.ShowModal;
    if T.IS_OK then
    begin
     ID_NOMN:=T.ID_NOMN;
     cxName.Text:=T.NAME;
     ID_UNIT:=T.ID_UNIT;
     cxUNIT.Text:=T.UNIT_NAME;
     cxPRICE.EditValue:=T.PRICE;
     cxKolMat.EditValue:=T.KOL_MAT;
     cxKolDoc.EditValue:=T.KOL_MAT;
     cxSumma.EditValue:=cxPRICE.EditValue*cxKolMat.EditValue;
     if T.OstSpecDataSet.FieldByName('ID_SCH').IsNull then
      ID_SCH:=0
     else
      ID_SCH:=T.OstSpecDataSet.FieldByName('ID_SCH').AsInteger;
     ID_OST:=T.ID_OST;
     CHECK_KOL_MAT:=true;
     MAX_KOL_MAT:=T.MAX_KOL_MAT;
     if ID_SCH=0 then
      cxNameSch.Text:=''
     else
      cxNameSch.Text:=T.OstSpecDataSet.FieldByName('SCH_NUMBER').AsString;
     TypeMat:=2;
     if T.OstSpecDataSet.FieldByName('DATE_OPR').Value<> null then
     dateopr:= T.OstSpecDataSet.FieldByName('DATE_OPR').AsDateTime;
    end;
    T.Free;
   end;
  end
  else
  begin
   T:=TDocWorkOstForm.Create(self);
   T.DBHANDLE:=DBHANDLE;
   T.WorkDatabase.Handle:=DBHANDLE;
   T.ID_MO:=ID_MO_OUT;
   T.ID_SESSION:=ID_SESSION;
   T.DocOstDataSet.ParamByName('ID_MO').Value:=ID_MO_OUT;
   T.DocOstDataSet.ParamByName('ID_SESSION').Value:=ID_SESSION;
   T.OstSpecDataSet.ParamByName('PID_MO').Value:=ID_MO_OUT;
   T.OstSpecDataSet.ParamByName('PID_SESSION').Value:=ID_SESSION;
   T.SchDataSet.ParamByName('ID_MO').Value:=ID_MO_OUT;
   T.SchDataSet.ParamByName('ID_SESSION').Value:=ID_SESSION;
   T.DocOstDataSet.CloseOpen(False);
   T.OstSpecDataSet.CloseOpen(False);
   T.OstIstfinDataSet.CloseOpen(false);
   T.SchDataSet.CloseOpen(false);
   if ID_OST>0 then
    T.DocOstDataSet.Locate('ID_NOMN',ID_NOMN,[])
   else
    T.DocOstDataSet.First;
   T.KOL_MODE:=0;
   T.ShowModal;
   if T.IS_OK then
   begin
    ID_NOMN:=T.ID_NOMN;
    cxName.Text:=T.NAME;
    ID_UNIT:=T.ID_UNIT;
    cxUNIT.Text:=T.UNIT_NAME;
    cxPRICE.EditValue:=T.PRICE;
    cxKolMat.EditValue:=T.KOL_MAT;
    cxKolDoc.EditValue:=T.KOL_MAT;
    cxSumma.EditValue:=cxPRICE.EditValue*cxKolMat.EditValue;
    ID_SCH:=T.ID_SCH;
    ID_OST:=T.ID_OST;
    CHECK_KOL_MAT:=true;
    MAX_KOL_MAT:=T.MAX_KOL_MAT;
    cxNameSch.Text:=T.SCH_NUMBER;
    TypeMat:=2;
    if T.OstSpecDataSetDATE_OPR.Value<>null
    then dateopr:=T.OstSpecDataSetDATE_OPR.AsDateTime;
   end;
   T.Free;
  end;
  if cxKolDoc.Enabled then
   cxKolDoc.SetFocus else cxKolMat.SetFocus;
end;

procedure TDocWorkPosEditForm.cxUnitPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
//var
//  Res : Variant;
begin
{
 Res:=uPackageManager.ShowUnitMeas(Self, self.DBHandle, fsNormal, ID_UNIT);
 if  VarType(Res) <> varEmpty then
  begin
   ID_UNIT:=Res[0];
   cxUnit.Text:=Res[1];
  end;
}
end;

procedure TDocWorkPosEditForm.cxNameSchPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Res : Variant;
begin
 Res:=uSpMatSch.GetMatSch(self, DBHandle, 0, ID_SCH);
 if  VarType(Res) <> varEmpty
  then begin
   ID_SCH := Res[0];
   cxNameSch.Text := RES[1]; //+' "'+RES[2]+'"';
  end;
end;

procedure TDocWorkPosEditForm.cxKolMatExit(Sender: TObject);
var
 is_exit: boolean;
begin
 is_exit:=true;
 if CHECK_KOL_MAT then
 begin
  if cxKolMat.EditValue>MAX_KOL_MAT then
  begin
   ShowMessage('Кількість повинна бути< '+FloatToStrF(MAX_KOL_MAT, ffNumber, 16, 2));
   is_exit:=false;
  end;
 end;
 if not is_exit then
  cxKolMat.SetFocus;
end;

procedure TDocWorkPosEditForm.cxKolDocKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_RETURN then
 begin
  if cxKolMat.EditValue=0 then
   cxKolMat.EditValue:=cxKolDoc.EditValue;
  cxKolMat.SetFocus;
 end;
end;

procedure TDocWorkPosEditForm.cxKolMatKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_RETURN then
  cxSumma.SetFocus;
end;

procedure TDocWorkPosEditForm.cxPriceKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_RETURN then
  OkButton.SetFocus;
end;

procedure TDocWorkPosEditForm.cxSummaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_RETURN then
  cxNameSch.SetFocus;
end;

procedure TDocWorkPosEditForm.cxKolDocExit(Sender: TObject);
begin
 if cxKolMat.Value=0 then
  cxKolMat.Value:=cxKolDoc.Value;
end;

procedure TDocWorkPosEditForm.cxNameSchKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key=VK_RETURN then
  cxPosNote.SetFocus;
end;

procedure TDocWorkPosEditForm.cxNameSchExit(Sender: TObject);
var
  Res : Variant;
begin
  Res:=uSpMatSch.GetMatSchEx(self, DBHandle, 0, 0, ID_SCH, cxNameSch.Text);
  if  VarType(Res) <> varEmpty then begin
   ID_SCH := Res[0];
   cxNameSch.Text := RES[1]; //+' "'+RES[2]+'"';
  end
  else
  begin
//   ShowMessage('Указанный счет не найден в справочнике счетов');
   ID_SCH:=0;
   cxNameSch.Text:='';
  end
//   cxNameSch.SetFocus;
end;

procedure TDocWorkPosEditForm.cxNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then
  cxNamePropertiesButtonClick(self, 0);
end;

procedure TDocWorkPosEditForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// if (Key=VK_RETURN) and (Shift<>[ssCtrl]) then
//  Key:=VK_TAB;
 if Key=VK_ESCAPE	then
  CancelButton.SetFocus;
 if (Key=VK_F10) or ((Key=VK_END) and (Shift=[ssCtrl])) then
  OkButton.SetFocus;
end;

procedure TDocWorkPosEditForm.cxPricePropertiesEditValueChanged(
  Sender: TObject);
begin
 cxSumma.EditValue:=cxKolMat.EditValue*cxPrice.EditValue;
end;

procedure TDocWorkPosEditForm.cxKolMatPropertiesEditValueChanged(
  Sender: TObject);
begin
 if cxKolMat.EditValue<>MAX_KOL_MAT then
  cxSumma.EditValue:=cxKolMat.EditValue*cxPrice.EditValue
end;

procedure TDocWorkPosEditForm.cxSummaPropertiesEditValueChanged(
  Sender: TObject);
begin
  if not_change_price=0 then
  begin
  if cxKolMat.Value<>0 then
  cxPrice.EditValue:=cxSumma.EditValue/cxKolMat.EditValue;
  end;
  if not_change_price=1 then
  begin
  if cxKolMat.Value<>0 then
  cxSumma.EditValue:=cxPrice.EditValue*cxKolMat.EditValue;
  end;
end;

procedure TDocWorkPosEditForm.FormShow(Sender: TObject);
begin
  if is_add_all = 1 then tmr1.Enabled:=True else  tmr1.Enabled:=False;
end;

procedure TDocWorkPosEditForm.tmr1Timer(Sender: TObject);
begin
OkButtonClick(Self);
tmr1.Enabled:=False;
end;

end.
