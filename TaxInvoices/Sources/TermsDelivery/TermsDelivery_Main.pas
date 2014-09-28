unit TermsDelivery_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase,TiCommonStyles, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,TiCommonProc;

type
  TTermsDeliveryMainForm = class(TForm)
    TermsDeliveryGridDBTableView: TcxGridDBTableView;
    TermsDeliveryGridLevel: TcxGridLevel;
    TermsDeliveryGrid: TcxGrid;
    dxBarManager1: TdxBarManager;
    SelectButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    TermsDeliveryGridDBTableViewDB_Kod: TcxGridDBColumn;
    TermsDeliveryGridDBTableViewDB_NameNotes: TcxGridDBColumn;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DelButton: TdxBarLargeButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TermsDeliveryGridDBTableViewDblClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
  private
    PRes               :Variant;
    pLanguageIndex     :Byte;
    pStylesDM          :TStyleDM;
    PDb_Handle         :TISC_DB_HANDLE;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
    property Res:Variant read PRes;
  end;

var
  TermsDeliveryMainForm: TTermsDeliveryMainForm;

implementation

uses TermsDelivery_DM,TermsDelivery_Add;

{$R *.dfm}
constructor TTermsDeliveryMainForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);

begin
  inherited Create(AOwner);
  PDb_Handle           := Db_Handle;
  TermsDeliveryDM      := TTermsDeliveryDM.Create(AOwner,Db_Handle);
//******************************************************************************
  pLanguageIndex       := LanguageIndex;
  Caption              := GetConst('TermsDelivery',tcForm);
  SelectButton.Caption := GetConst('Select',tcButton);
  ExitButton.Caption   := GetConst('Exit',tcButton);
//******************************************************************************
  pStylesDM            := TStyleDM.Create(Self);
  TermsDeliveryGridDBTableView.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
//******************************************************************************
  TermsDeliveryDM.TermsDeliveryDSet.Close;
  TermsDeliveryDM.TermsDeliveryDSet.SelectSQL.Text:='select * from TI_SP_TERMS_DELIVERY';
  TermsDeliveryDM.TermsDeliveryDSet.Open;
end;

procedure TTermsDeliveryMainForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TTermsDeliveryMainForm.SelectButtonClick(Sender: TObject);
begin
  PRes:=VarArrayCreate([0,3], varVariant);
  PRes[0]:=TermsDeliveryDM.TermsDeliveryDSet['CODE'];
  PRes[1]:=TermsDeliveryDM.TermsDeliveryDSet['NAME'];
 // ShowMessage(SpecialNotesDM.SpecialNotesDSet['NAME']);
 // PRes[2]:=SpecialNotesDM.SpecialNotesDSet['NUM'];
 // PRes[3]:=SpecialNotesDM.SpecialNotesDSet['DATEBEG'];
 // PRes[4]:=SpecialNotesDM.SpecialNotesDSet['DATEEND'];
  ModalResult:=mrYes;
end;

procedure TTermsDeliveryMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   //Action := caFree;
   TermsDeliveryDM.Free;
end;

procedure TTermsDeliveryMainForm.TermsDeliveryGridDBTableViewDblClick(
  Sender: TObject);
begin
  SelectButton.Click;
end;

procedure TTermsDeliveryMainForm.AddButtonClick(Sender: TObject);
var
  ViewForm : TTermsDeliveryAddForm;
  id_kod:Integer;
begin
  ViewForm := TTermsDeliveryAddForm.Create(Self,TermsDeliveryDM.DB.Handle);
  ViewForm.NumTermsDeliveryTextEdit.Text   := '';
  ViewForm.NameTermsDeliveryTextEdit.Text  := '';
  ViewForm.Caption := GetConst('TermsDelivery',tcForm);
  ViewForm.ShowModal;
  if (ViewForm.ModalResult=mrOk) then
    begin
      TermsDeliveryDM.WriteTransaction.StartTransaction;
      TermsDeliveryDM.pFIBStoredProc.StoredProcName := 'TI_SP_TERMS_DELIVERY_INS';
      TermsDeliveryDM.pFIBStoredProc.ParamByName('num').Value  := ViewForm.NumTermsDeliveryTextEdit.Text;
      TermsDeliveryDM.pFIBStoredProc.ParamByName('name').Value := ViewForm.NameTermsDeliveryTextEdit.Text;
      TermsDeliveryDM.pFIBStoredProc.ExecProc;
      TermsDeliveryDM.WriteTransaction.Commit;
      id_kod := TermsDeliveryDM.pFIBStoredProc.ParamByName('code_').AsInteger;
      TermsDeliveryDM.TermsDeliveryDSet.Close;
      TermsDeliveryDM.TermsDeliveryDSet.Open;
      TermsDeliveryDM.TermsDeliveryDSet.Locate('code',IntToStr(id_kod),[]);
    end;

end;

procedure TTermsDeliveryMainForm.EditButtonClick(Sender: TObject);
var
  ViewForm : TTermsDeliveryAddForm;
  id_kod:Integer;
begin
  id_kod := TermsDeliveryDM.TermsDeliveryDSet['code'];
  ViewForm := TTermsDeliveryAddForm.Create(Self,TermsDeliveryDM.DB.Handle);
  ViewForm.NumTermsDeliveryTextEdit.Text  := TermsDeliveryDM.TermsDeliveryDSet['num'];
  ViewForm.NameTermsDeliveryTextEdit.Text := TermsDeliveryDM.TermsDeliveryDSet['name'];
  ViewForm.Caption                   := GetConst('TermsDeliveryUpd',tcForm);
  ViewForm.ShowModal;
  if (ViewForm.ModalResult=mrOk) then
    begin
      TermsDeliveryDM.WriteTransaction.StartTransaction;
      TermsDeliveryDM.pFIBStoredProc.StoredProcName := 'TI_SP_TERMS_DELIVERY_UPD';
      TermsDeliveryDM.pFIBStoredProc.ParamByName('code').Value  := id_kod;
      TermsDeliveryDM.pFIBStoredProc.ParamByName('num').Value  := ViewForm.NumTermsDeliveryTextEdit.Text;
      TermsDeliveryDM.pFIBStoredProc.ParamByName('name').Value := ViewForm.NameTermsDeliveryTextEdit.Text;
      TermsDeliveryDM.pFIBStoredProc.ExecProc;
      TermsDeliveryDM.WriteTransaction.Commit;
      TermsDeliveryDM.TermsDeliveryDSet.Close;
      TermsDeliveryDM.TermsDeliveryDSet.Open;
      TermsDeliveryDM.TermsDeliveryDSet.Locate('code',IntToStr(id_kod),[]);
    end;
end;

procedure TTermsDeliveryMainForm.DelButtonClick(Sender: TObject);
begin
  if MessageDlg('Ви дійсно бажаєте вилучити запис? ', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin
   try
    TermsDeliveryDM.WriteTransaction.StartTransaction;
    TermsDeliveryDM.pFIBStoredProc.StoredProcName:='TI_SP_TERMS_DELIVERY_DEL';
    TermsDeliveryDM.pFIBStoredProc.ParamByName('code').Value:=TermsDeliveryDM.TermsDeliveryDSet['code'];
    TermsDeliveryDM.pFIBStoredProc.ExecProc;
    TermsDeliveryDM.WriteTransaction.Commit;
    TermsDeliveryDM.TermsDeliveryDSet.Close;
    TermsDeliveryDM.TermsDeliveryDSet.Open;
   except on E:Exception do
    begin
     MessageDlg('не можна видалити цей запис', mtError, [mbOK], 0);
     TermsDeliveryDM.WriteTransaction.Rollback;
    end;
   end;
  end;
end;

end.
