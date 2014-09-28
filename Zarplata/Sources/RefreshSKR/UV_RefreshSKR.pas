unit UV_RefreshSKR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, ExtCtrls,
  PackageLoad, IBase, ZTypes, DB, Halcn6db, Unit_ZGlobal_Consts, ZProc, ZMessages,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  cxCheckBox, UV_RefreshSKR_FieldNames;

type
  TFRefreshSKR = class(TForm)
    Bevel1: TBevel;
    BankBtnEdit: TcxButtonEdit;
    FileBtnEdit: TcxButtonEdit;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    LabelBank: TcxLabel;
    LabelFile: TcxLabel;
    OpenFile: TOpenDialog;
    DB: TpFIBDatabase;
    Tran: TpFIBTransaction;
    StProc1: TpFIBStoredProc;
    StProc2: TpFIBStoredProc;
    CheckBoxNewFieldsDBFtable: TcxCheckBox;
    StProc3: TpFIBStoredProc;
    procedure BankBtnEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FileBtnEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure YesBtnClick(Sender: TObject);
    procedure CheckBoxNewFieldsDBFtableClick(Sender: TObject);
  private
    PId_Type_Payment:integer;
    PFileName:String;
    PFieldTinName:string;
    PFieldAcctCardName:string;
    PLanguageIndex:byte;
    PDb_Handle:TISC_DB_HANDLE;
  public
    constructor Create(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;

function View_RefreshSKR(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE):variant;stdcall;
exports View_RefreshSKR;


implementation

{$R *.dfm}

function View_RefreshSKR(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE):variant;
var ViewForm:TFRefreshSKR;
begin
ViewForm:=TFRefreshSKR.Create(AOwner,DB_Handle);
ViewForm.ShowModal;
ViewForm.Free;
end;

constructor TFRefreshSKR.Create(AOwner: TComponent;DB_Handle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 PLanguageIndex:=LanguageIndex;
//******************************************************************************
 Caption := RefreshSKR_Caption[PLanguageIndex];
 YesBtn.Caption := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption := CancelBtn_Caption[PLanguageIndex];
 LabelBank.Caption := LabelBank_Caption[PLanguageIndex];
 LabelFile.Caption := LabelFile_Caption[PLanguageIndex];
 CheckBoxNewFieldsDBFtable.Properties.Caption:=FRefreshSKR_CheckBoxNewFieldsDBFtable_Caption[PLanguageIndex];
//******************************************************************************
 PDb_Handle:=DB_Handle;
end;

procedure TFRefreshSKR.BankBtnEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var viplata:Variant;
begin
Viplata := LoadViplata(Self,PDb_Handle,zfsModal);
if VarArrayDimCount(viplata)>0 then
 begin
   PId_Type_Payment:=viplata[0];
   BankBtnEdit.Text := VarToStr(viplata[1]);
 end;
end;

procedure TFRefreshSKR.FileBtnEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
if OpenFile.Execute then
 begin
  PFileName:=OpenFile.FileName;
  FileBtnEdit.Text := PFileName;
 end;
end;

procedure TFRefreshSKR.YesBtnClick(Sender: TObject);
var DSet:THalcyonDataSet;
begin
PFieldTinName := TinFieldName;
PFieldAcctCardName := CardFieldName;

if not FileExists(PFileName) then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],
               ZeFileNotExist_Text[PLanguageIndex]+#13+PFileName,mtWarning,[mbOK]);
  Exit;
 end;
 try
  DSet:=THalcyonDataSet.Create(Self);
  DSet.TableName := PFileName;
  DSet.Open;
 except
  on E:Exception do
   begin
    ZShowMessage(   Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
    DSet.Destroy;
    Exit;
   end;
 end;
 if DSet.FindField(PFieldTinName)=nil then
  begin
  ZShowMessage(Error_Caption[PLanguageIndex],
               ZeFieldNotExist_Text[PLanguageIndex]+#13+PFieldTinName,mtWarning,[mbOK]);
   DSet.Destroy;
   Exit;
  end;
 if DSet.FindField(PFieldAcctCardName)=nil then
  begin
   ZShowMessage(Error_Caption[PLanguageIndex],
                ZeFieldNotExist_Text[PLanguageIndex]+#13+PFieldAcctCardName,mtWarning,[mbOK]);
   DSet.Destroy;
   Exit;
  end;

 DSet.First;

 try
 DB.Handle:=PDb_Handle;
 Tran.StartTransaction;
 with  StProc1 do
  begin
   StoredProcName:='Z_TNACCESS_CLEAR_FOR_TYPE_PAY';
   Prepare;
   ParamByName('ID_TYPE_PAYMENT').AsInteger:=PId_Type_Payment;
   ExecProc;
  end;
 with  StProc2 do
  begin
   DSet.First;
   StoredProcName:='Z_TNACCESS_MAN_REFRESH_CARD';
   Prepare;
   ParamByName('ID_TYPE_PAYMENT').AsInteger:=PId_Type_Payment;
   while not DSet.Eof do
    begin
     ParamByName('TIN').AsString := VarToStr(DSet[PFieldTinName]);
     ParamByName('ACCT_CARD').AsString := VarToStr(DSet[PFieldAcctCardName]);
     ExecProc;
     DSet.Next;
    end;
  end;
{ with  StProc3 do
  begin
   StoredProcName:='Z_TNACCESS_CARDS_TO_SHEETS';
   Prepare;
   ParamByName('ID_TYPE_PAYMENT').AsInteger:=PId_Type_Payment;
   ExecProc;
  end;}
  Tran.Commit;
  ModalResult:=mrYes;
 except
  on E:Exception do
   begin
   ZShowMessage(Error_Caption[PLanguageIndex],
                 E.Message+#13+LabelTin_Caption[PLanguageIndex]+': '+
                               VarToStr(DSet[PFieldTinName]),mtError,[mbOK]);
    if Tran.InTransaction then Tran.Rollback;
   end;
 end;
end;

procedure TFRefreshSKR.CheckBoxNewFieldsDBFtableClick(Sender: TObject);
var Form:TFUV_RefreshSkr_FieldNames;
begin
if CheckBoxNewFieldsDBFtable.Checked then
 begin
  Form := TFUV_RefreshSkr_FieldNames.Create(self);
  CheckBoxNewFieldsDBFtable.Checked := Form.ShowModal=mrYes;
  Form.Free;
 end;
end;

end.
