{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Картотека МНА и МБП                                   }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uMnaWorkForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, ibase,
  cxDropDownEdit, StdCtrls, cxLookAndFeelPainters, cxCalendar, cxButtons,
  cxCurrencyEdit, cxButtonEdit, uMatasVars, uMatasUtils, uResources,
  uSpMatSch, uSpMatOtv, uPackageManager, cxCheckBox, ActnList, cxMemo, uMatasMnaMain,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase;

type
  TMnaWorkFrom = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    cxTip: TcxComboBox;
    cxMatOtv: TcxButtonEdit;
    cxSch: TcxButtonEdit;
    cxName: TcxButtonEdit;
    cxKolMat: TcxCurrencyEdit;
    cxSumma: TcxCurrencyEdit;
    cxPrice: TcxCurrencyEdit;
    cxUnit: TcxButtonEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxDateOpr: TcxDateEdit;
    cxDateExpl: TcxDateEdit;
    cxModel: TcxTextEdit;
    cxMarka: TcxTextEdit;
    cxNote: TcxTextEdit;
    cxNNum: TcxTextEdit;
    Label17: TLabel;
    cxNNumExt: TcxTextEdit;
    cxOstLink: TcxButtonEdit;
    Label18: TLabel;
    cxCheckOst: TcxCheckBox;
    ActionList1: TActionList;
    acSave: TAction;
    acCancel: TAction;
    lblInvNum: TLabel;
    InvNum: TcxTextEdit;
    lbl1: TLabel;
    Iznos: TcxCurrencyEdit;
    cxMemo1: TcxMemo;
    cxNumGen: TcxButton;
    StPrGenNum: TpFIBStoredProc;
    TrGenNum: TpFIBTransaction;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure cxMatOtvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxMatOtvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxKolMatExit(Sender: TObject);
    procedure cxSummaExit(Sender: TObject);
    procedure cxNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxNamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure OkButtonClick(Sender: TObject);
    procedure cxOstLinkPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckOstPropertiesChange(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure acSaveExecute(Sender: TObject);
    procedure cxNumGenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_MO, ID_SCH, ID_NOMN, ID_UNIT, ID_OST: integer;
  end;

var
  MnaWorkFrom: TMnaWorkFrom;

implementation

{$R *.dfm}
uses uMnaWorkOst;

procedure TMnaWorkFrom.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_ESCAPE	then
  CancelButton.SetFocus;
 if (Key=VK_F10) or ((Key=VK_END) and (Shift=[ssCtrl])) then
  OkButton.SetFocus;
 if (Key=VK_RETURN) and (Shift<>[ssCtrl]) then
  Key:=VK_TAB;
end;

procedure TMnaWorkFrom.FormCreate(Sender: TObject);
begin
 cxTip.ItemIndex:=0;
 if (_MNA_INV_ACC=0) and (_MBP_INV_ACC=0) then
 begin
   InvNum.Visible:=False;
   lblInvNum.Visible:=False;
 end;
end;

procedure TMnaWorkFrom.cxMatOtvPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  FioMO, SpodrMO: string;
  IsMoOk: boolean;
 dm, dy: Word;
begin
  Res:=uSpMatOtv.GetMatOtv(self, DBHandle, 0, ID_MO);
  if  VarType(Res) <> varEmpty then begin
    ID_MO:=Res[0];
    FioMO := Res[1];
    SpodrMO := Res[2];
   cxMatOtv.Text:=FioMO+' / '+SpodrMO;
  end;
end;

procedure TMnaWorkFrom.cxMatOtvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxMatOtv.Text:='';
  ID_MO:=0;
 end;
end;

procedure TMnaWorkFrom.cxSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
begin
 Res:=uSpMatSch.GetMatSch(self, DBHandle, 0, ID_SCH);
 if  VarType(Res) <> varEmpty
  then begin
   ID_SCH := Res[0];
   cxSch.Text := RES[1]; //+' "'+RES[2]+'"';
  end;
end;

procedure TMnaWorkFrom.cxKolMatExit(Sender: TObject);
begin
 cxSumma.EditValue:=cxKolMat.EditValue*cxPrice.EditValue;
end;

procedure TMnaWorkFrom.cxSummaExit(Sender: TObject);
begin
 if cxKolMat.Value<>0 then
  cxPrice.EditValue:=cxSumma.EditValue/cxKolMat.EditValue;
end;

procedure TMnaWorkFrom.cxNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// if Key=VK_RETURN then
//  cxNamePropertiesButtonClick(self, 0);
end;

procedure TMnaWorkFrom.cxNamePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 Res: Variant;
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
  cxSch.Text:=res[7];
  if cxKolMat.EditValue=0 then
   cxKolMat.EditValue:=1;
 end;
 cxKolMat.SetFocus;
end;

procedure TMnaWorkFrom.OkButtonClick(Sender: TObject);
begin
 if cxName.Text='' then
 begin
  ShowMessage('Необхідно вказати назву!');
  cxName.SetFocus;
  Exit;
 end;
 if (ID_SCH=0) then
 begin
  ShowMessage('Необхідно вказати рахунок!');
  cxSch.SetFocus;
  Exit;
 end;
 if (ID_MO=0) then
 begin
  ShowMessage('Необхідно вказати МВО!');
  cxMatOtv.SetFocus;
  Exit;
 end;
{ if cxDateOpr.EditValue=Null then
 begin
  ShowMessage('Необхідно вказати дату оприбуткування!');
  cxDateOpr.SetFocus;
  Exit;
 end;
 if cxDateExpl.EditValue=Null then
 begin
  ShowMessage('Необхідно вказати дату вводу в експлуатацію!');
  cxDateExpl.SetFocus;
  Exit;
 end;
} ModalResult:=mrOk;
end;

procedure TMnaWorkFrom.cxOstLinkPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 T: TMnaWorkOstForm;
begin
 T:=TMnaWorkOstForm.Create(self, DBHANDLE, ID_NOMN, ID_MO, ID_SCH);
 T.ShowModal;
 if T.ID_OST>0 then
 begin
  cxOstLink.Text:=T.OstDataSet.FieldByName('NOMN').AsString+', '+T.OstDataSet.FieldByName('NAME').AsString+', '+T.OstDataSet.FieldByName('KOL_MAT').AsString;
  ID_OST:=T.ID_OST
 end;
 T.Free;
end;

procedure TMnaWorkFrom.cxCheckOstPropertiesChange(Sender: TObject);
begin
  if cxCheckOst.Checked then
  begin
    cxOstLink.Enabled:=false;
    cxOstLink.Text:='';
    ID_OST:=0;
  end
  else
    cxOstLink.Enabled:=true;
end;

procedure TMnaWorkFrom.acCancelExecute(Sender: TObject);
begin
  Close;
end;

procedure TMnaWorkFrom.acSaveExecute(Sender: TObject);
begin
  OkButtonClick(self);
end;

procedure TMnaWorkFrom.cxNumGenClick(Sender: TObject);
begin
try
   StPrGenNum.Transaction := TrGenNum;
   StPrGenNum.Transaction.StartTransaction;
   StPrGenNum.ExecProcedure('MAT_GEN_EMPTY_NNUM', [ID_SCH,ID_NOMN,_MATAS_PERIOD]);
   StPrGenNum.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     StPrGenNum.Transaction.Rollback;
     exit;
    end;
end;
cxNNum.Text:= StPrGenNum.ParAmByNAme('NNUM').AsString;
cxNNumExt.Text:= StPrGenNum.ParAmByNAme('NNUM_EXT').AsString;
end;

end.
