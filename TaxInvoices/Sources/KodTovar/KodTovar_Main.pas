unit KodTovar_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase,TiCommonStyles, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  TiCommonProc, KodTovar_Add;

type
  TKodTovarMainForm = class(TForm)
    KodTovarGridDBTableView: TcxGridDBTableView;
    KodTovarGridLevel: TcxGridLevel;
    KodTovarGrid: TcxGrid;
    dxBarManager1: TdxBarManager;
    SelectButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    KodTovarGridDBTableViewDB_Kod: TcxGridDBColumn;
    KodTovarGridDBTableViewDB_NameNotes: TcxGridDBColumn;
    InsertButton: TdxBarLargeButton;
    UpdateButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure KodTovarGridDBTableViewDblClick(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure KodTovarGridDBTableViewKeyPress(Sender: TObject;
      var Key: Char);
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
  KodTovarMainForm: TKodTovarMainForm;

implementation

uses KodTovar_DM, cxCurrencyEdit, cxTextEdit;

{$R *.dfm}
constructor TKodTovarMainForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);

begin
  inherited Create(AOwner);
  PDb_Handle           := Db_Handle;
  KodTovarDM           := TKodTovarDM.Create(AOwner,Db_Handle);
//******************************************************************************
  pLanguageIndex       := LanguageIndex;
  Caption              := GetConst('KodTovar',tcForm);
  SelectButton.Caption := GetConst('Select',tcButton);
  ExitButton.Caption   := GetConst('Exit',tcButton);
//******************************************************************************
  pStylesDM            := TStyleDM.Create(Self);
  KodTovarGridDBTableView.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
//******************************************************************************
  KodTovarDM.KodTovarDSet.Close;
  KodTovarDM.KodTovarDSet.SelectSQL.Text:='select * from TI_SP_KOD_TOVAR';
  KodTovarDM.KodTovarDSet.Open;
end;

procedure TKodTovarMainForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TKodTovarMainForm.SelectButtonClick(Sender: TObject);
begin
  PRes:=VarArrayCreate([0,3], varVariant);
  PRes[0]:=KodTovarDM.KodTovarDSet['id_kod_tovar'];
  PRes[1]:=KodTovarDM.KodTovarDSet['name_kod_tovar'];
  PRes[2]:=KodTovarDM.KodTovarDSet['num_kod_tovar'];
  ModalResult:=mrYes;
end;

procedure TKodTovarMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   KodTovarDM.Free;
end;

procedure TKodTovarMainForm.KodTovarGridDBTableViewDblClick(
  Sender: TObject);
begin
  SelectButton.Click;
end;

procedure TKodTovarMainForm.InsertButtonClick(Sender: TObject);
var
  ViewForm : TKodTovarAddForm;
  id_kod_tovar:Integer;
begin
  ViewForm := TKodTovarAddForm.Create(Self,KodTovarDM.DB.Handle);
  ViewForm.NumKodTovarTextEdit.Text   := '';
  ViewForm.NameKodTovarTextEdit.Text  := '';
  ViewForm.Caption                 := GetConst('KodTovarAdd',tcForm);
  ViewForm.ShowModal;
  if (ViewForm.ModalResult=mrOk) then
    begin
      KodTovarDM.WriteTransaction.StartTransaction;
      KodTovarDM.pFIBStoredProc.StoredProcName := 'TI_SP_KOD_TOVAR_INS';
      KodTovarDM.pFIBStoredProc.ParamByName('num_kod_tovar').Value  := ViewForm.NumKodTovarTextEdit.Text;
      KodTovarDM.pFIBStoredProc.ParamByName('name_kod_tovar').Value := ViewForm.NameKodTovarTextEdit.Text;
      KodTovarDM.pFIBStoredProc.ExecProc;
      KodTovarDM.WriteTransaction.Commit;
      id_kod_tovar := KodTovarDM.pFIBStoredProc.ParamByName('id_kod_tovar_').AsInteger;
      KodTovarDM.KodTovarDSet.Close;
      KodTovarDM.KodTovarDSet.Open;
      KodTovarDM.KodTovarDSet.Locate('id_kod_tovar',IntToStr(id_kod_tovar),[]);
    end;

end;

procedure TKodTovarMainForm.UpdateButtonClick(Sender: TObject);
var
  ViewForm : TKodTovarAddForm;
  id_kod_tovar:Integer;
begin
  id_kod_tovar := KodTovarDM.KodTovarDSet['id_kod_tovar'];
  ViewForm := TKodTovarAddForm.Create(Self,KodTovarDM.DB.Handle);
  ViewForm.NumKodTovarTextEdit.Text  := KodTovarDM.KodTovarDSet['num_kod_tovar'];
  ViewForm.NameKodTovarTextEdit.Text := KodTovarDM.KodTovarDSet['name_kod_tovar'];
  ViewForm.Caption                   := GetConst('KodTovarUpd',tcForm);
  ViewForm.ShowModal;
  if (ViewForm.ModalResult=mrOk) then
    begin
      KodTovarDM.WriteTransaction.StartTransaction;
      KodTovarDM.pFIBStoredProc.StoredProcName := 'TI_SP_KOD_TOVAR_UPD';
      KodTovarDM.pFIBStoredProc.ParamByName('id_kod_tovar').Value  := id_kod_tovar;
      KodTovarDM.pFIBStoredProc.ParamByName('num_kod_tovar').Value  := ViewForm.NumKodTovarTextEdit.Text;
      KodTovarDM.pFIBStoredProc.ParamByName('name_kod_tovar').Value := ViewForm.NameKodTovarTextEdit.Text;
      KodTovarDM.pFIBStoredProc.ExecProc;
      KodTovarDM.WriteTransaction.Commit;
      KodTovarDM.KodTovarDSet.Close;
      KodTovarDM.KodTovarDSet.Open;
      KodTovarDM.KodTovarDSet.Locate('id_kod_tovar',IntToStr(id_kod_tovar),[]);
    end;   
end;

procedure TKodTovarMainForm.DeleteButtonClick(Sender: TObject);
begin
  if MessageDlg('Ви дійсно бажаєте вилучити запис? ', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin
   try
    KodTovarDM.WriteTransaction.StartTransaction;
    KodTovarDM.pFIBStoredProc.StoredProcName:='TI_SP_KOD_TOVAR_DEL';
    KodTovarDM.pFIBStoredProc.ParamByName('id_kod_tovar').Value:=KodTovarDM.KodTovarDSet['id_kod_tovar'];
    KodTovarDM.pFIBStoredProc.ExecProc;
    KodTovarDM.WriteTransaction.Commit;
    KodTovarDM.KodTovarDSet.Close;
    KodTovarDM.KodTovarDSet.Open;
   except on E:Exception do
    begin
     MessageDlg('не можна видалити цей запис', mtError, [mbOK], 0);
     KodTovarDM.WriteTransaction.Rollback;
    end;
   end;
  end;
end;

procedure TKodTovarMainForm.KodTovarGridDBTableViewKeyPress(
  Sender: TObject; var Key: Char);
begin
   if (KodTovarGridDBTableView.OptionsBehavior.IncSearchItem<>KodTovarGridDBTableViewDB_NameNotes)then
   begin
    KodTovarGridDBTableView.Controller.IncSearchingText   := '';
    KodTovarGridDBTableView.OptionsBehavior.IncSearchItem := KodTovarGridDBTableViewDB_NameNotes;
   end;
end;

end.
