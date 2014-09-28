unit TnAccess_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxButtonEdit, cxContainer, cxEdit, cxLabel,
  cxControls, cxGroupBox, StdCtrls, cxButtons,
  PackageLoad, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  ZTypes, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, GlobalSpr,
  cxSpinEdit, FIBQuery, pFIBQuery, pFIBStoredProc, Unit_ZGlobal_Consts,
  ActnList, zProc, zMessages, TnAccess_DM, cxCheckBox;

type
  TFTnAccessControl = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    BoxMan: TcxGroupBox;
    EditMan: TcxButtonEdit;
    LabelMan: TcxLabel;
    BoxPriv: TcxGroupBox;
    LabelTypeViplata: TcxLabel;
    EditViplata: TcxButtonEdit;
    Actions: TActionList;
    Action1: TAction;
    LabelAcctCard: TcxLabel;
    MaskEditCard: TcxMaskEdit;
    ClearBtn: TcxButton;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditManPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure MaskEditCardKeyPress(Sender: TObject; var Key: Char);
    procedure EditPrivilegePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Action1Execute(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
  private
    PId_man:Integer;
    PId_Viplata:Integer;
    PId_TnAccess:variant;
    PResault:Variant;
    PLanguageIndex:Byte;
    DM:TDM_Ctrl;
  public
    constructor Create(AOwner:TComponent;ComeDB:TISC_DB_HANDLE;AID_man:integer);reintroduce;
    property Resault:Variant read PResault;
  end;

implementation

uses VarConv;

{$R *.dfm}

constructor TFTnAccessControl.Create(AOwner: TComponent;ComeDB:TISC_DB_HANDLE;AID_man:integer);
begin
 inherited Create(AOwner);
 PLanguageIndex:=LanguageIndex;
 PId_man:=AId_Man;
//******************************************************************************
 Caption                      := Label_Acct_Card[PLanguageIndex];
 YesBtn.Caption               := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption            := CancelBtn_Caption[PLanguageIndex];
 ClearBtn.Caption             := ClearBtn_Caption[PLanguageIndex];
 LabelMan.Caption             := LabelMan_Caption[PLanguageIndex];
 LabelTypeViplata.Caption     := LabelTypePayment_Caption[PLanguageIndex];
 LabelAcctCard.Caption        := 'Шифр для податків';
//******************************************************************************
 DM:=TDM_Ctrl.Create(self);
 with Dm do
  begin
  DataBase.Handle := ComeDB;
  DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_TNACCESS_S_BY_MAN('+IntToStr(AID_man)+')';
  DSet.Open;
  EditMan.Text := VarToStrDef(DSet['TN'],'')+' - '+VarToStrDef(DSet['FIO'],'');
  PId_TnAccess := DSet['ID_TNACCESS'];
  if VarIsNULL(DSet['ID_PAYMENT']) then
   begin
    PId_Viplata:=-99;
    MaskEditCard.Text := '';
    EditViplata.Text := '';
   end
  else
   begin
    PId_Viplata:=DSet['ID_PAYMENT'];
    MaskEditCard.Text := varToStrDef(DSet['ACCT_CARD'],'');
    EditViplata.Text := DSet['NAME_PAYMENT'];
   end;
  end;
//******************************************************************************
end;

procedure TFTnAccessControl.CancelBtnClick(Sender: TObject);
begin
ModalResult  := mrCancel;
end;

procedure TFTnAccessControl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if DM.DefaultTransaction.Active then DM.DefaultTransaction.Commit;
end;

procedure TFTnAccessControl.EditManPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Man:Variant;
begin
Man:=LoadPeopleModal(self,DM.DataBase.Handle);
if VarArrayDimCount(Man)> 0 then
 if Man[0]<>NULL then
  begin
   EditMan.Text  := Man[1]+' '+Man[2]+' '+Man[3];
   PId_Man       := Man[0];
  end;
end;

procedure TFTnAccessControl.FormDestroy(Sender: TObject);
begin
if DM<>nil then DM.Destroy;
end;

procedure TFTnAccessControl.MaskEditCardKeyPress(Sender: TObject;
  var Key: Char);
begin
if not((Key in ['0'..'9']) and (Length(MaskEditCard.Text)<16)) then Key:=#0;
end;

procedure TFTnAccessControl.EditPrivilegePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Viplata:variant;
begin
viplata:=LoadViplata(self,DM.DataBase.Handle,zfsModal);
if VarArrayDimCount(Viplata)>0 then
 begin
  EditViplata.Text := Viplata[1];
  PId_Viplata := Viplata[0];
 end;
end;

procedure TFTnAccessControl.Action1Execute(Sender: TObject);
begin
  with DM do
  try
   StoredProc.Database := DataBase;
   StoredProc.Transaction := WriteTransaction;
   StoredProc.Transaction.StartTransaction;
   StoredProc.StoredProcName := 'Z_TNACCESS_IUD';
   StoredProc.Prepare;
   StoredProc.ParamByName('ID_MAN').AsInteger := PId_man;
   if PId_Viplata=-99 then
      StoredProc.ParamByName('ID_PAYMENT').AsVariant := NULL
   else
      StoredProc.ParamByName('ID_PAYMENT').AsInteger := PId_Viplata;
   if MaskEditCard.Text='' then
      StoredProc.ParamByName('ACCT_CARD').AsVariant := NULL
   else StoredProc.ParamByName('ACCT_CARD').AsString := MaskEditCard.Text;
   StoredProc.ExecProc;
   StoredProc.Transaction.Commit;
   ModalResult:=mrYes;
  except
   on e:exception do
    begin
     ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
     StoredProc.Transaction.Rollback;
    end;
  end
end;

procedure TFTnAccessControl.ClearBtnClick(Sender: TObject);
begin
PId_Viplata := -99;
EditViplata.Text := '';
MaskEditCard.Text := '';
end;

end.
