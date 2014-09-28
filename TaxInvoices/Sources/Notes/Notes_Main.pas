unit Notes_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase,TiCommonStyles, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  TiCommonProc, Notes_Add;

type
  TNotesMainForm = class(TForm)
    NotesGridDBTableView: TcxGridDBTableView;
    NotesGridLevel: TcxGridLevel;
    NotesGrid: TcxGrid;
    dxBarManager1: TdxBarManager;
    SelectButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    NotesGridDBTableViewDB_Kod: TcxGridDBColumn;
    NotesGridDBTableViewDB_NameNotes: TcxGridDBColumn;
    NotesGridDBTableViewDB_Price: TcxGridDBColumn;
    InsertButton: TdxBarLargeButton;
    UpdateButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NotesGridDBTableViewDblClick(Sender: TObject);
    procedure InsertButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure NotesGridDBTableViewKeyPress(Sender: TObject;
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
  NotesMainForm: TNotesMainForm;

implementation

uses Notes_DM, cxCurrencyEdit, cxTextEdit;

{$R *.dfm}
constructor TNotesMainForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);

begin
  inherited Create(AOwner);
  PDb_Handle           := Db_Handle;
  NotesDM    := TNotesDM.Create(AOwner,Db_Handle);
//******************************************************************************
  pLanguageIndex       := LanguageIndex;
  Caption              := GetConst('Notes',tcForm);
  SelectButton.Caption := GetConst('Select',tcButton);
  ExitButton.Caption   := GetConst('Exit',tcButton);
//******************************************************************************
  pStylesDM            := TStyleDM.Create(Self);
  NotesGridDBTableView.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
//******************************************************************************
  NotesDM.NotesDSet.Close;
  NotesDM.NotesDSet.SelectSQL.Text:='select * from ti_sp_note';
  NotesDM.NotesDSet.Open;
end;

procedure TNotesMainForm.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TNotesMainForm.SelectButtonClick(Sender: TObject);
begin
  PRes:=VarArrayCreate([0,4], varVariant);
  PRes[0]:=NotesDM.NotesDSet['id_note'];
  PRes[1]:=NotesDM.NotesDSet['ARTICLE_NOTE'];
  PRes[2]:=NotesDM.NotesDSet['SHORT_NAME_NOTE'];
  PRes[3]:=NotesDM.NotesDSet['LONG_NAME_NOTE'];
  ModalResult:=mrYes;
end;

procedure TNotesMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   NotesDM.Free;
end;

procedure TNotesMainForm.NotesGridDBTableViewDblClick(
  Sender: TObject);
begin
  SelectButton.Click;
end;

procedure TNotesMainForm.InsertButtonClick(Sender: TObject);
var
  ViewForm : TNotesAddForm;
  id_note:Integer;
begin
  ViewForm := TNotesAddForm.Create(Self,NotesDM.DB.Handle);
  ViewForm.ArticleTextEdit.Text   := '';
  ViewForm.ShortNameTextEdit.Text := '';
  ViewForm.FullNameTextEdit.Text  := '';
  ViewForm.Caption                := GetConst('NotesAdd',tcForm);
  ViewForm.ShowModal;
  if (ViewForm.ModalResult=mrOk) then
    begin
      NotesDM.WriteTransaction.StartTransaction;
      NotesDM.pFIBStoredProc.StoredProcName := 'TI_SP_NOTE_INS';
      NotesDM.pFIBStoredProc.ParamByName('article_note').Value    := ViewForm.ArticleTextEdit.Text;
      NotesDM.pFIBStoredProc.ParamByName('short_name_note').Value := ViewForm.ShortNameTextEdit.Text;
      NotesDM.pFIBStoredProc.ParamByName('long_name_note').Value  := ViewForm.FullNameTextEdit.Text;
      NotesDM.pFIBStoredProc.ExecProc;
      NotesDM.WriteTransaction.Commit;
      id_note := NotesDM.pFIBStoredProc.ParamByName('id_note_').AsInteger;
      NotesDM.NotesDSet.Close;
      NotesDM.NotesDSet.Open;
      NotesDM.NotesDSet.Locate('id_note',IntToStr(id_note),[]);
    end;

end;

procedure TNotesMainForm.UpdateButtonClick(Sender: TObject);
var
  ViewForm : TNotesAddForm;
  id_note:Integer;
begin
  id_note  := NotesDM.NotesDSet['id_note'];
  ViewForm := TNotesAddForm.Create(Self,NotesDM.DB.Handle);
  ViewForm.ArticleTextEdit.Text   := NotesDM.NotesDSet['article_note'];
  ViewForm.ShortNameTextEdit.Text := NotesDM.NotesDSet['short_name_note'];
  ViewForm.FullNameTextEdit.Text  := NotesDM.NotesDSet['long_name_note'];
  ViewForm.Caption                := GetConst('NotesUpd',tcForm);
  ViewForm.ShowModal;
  if (ViewForm.ModalResult=mrOk) then
    begin
      NotesDM.WriteTransaction.StartTransaction;
      NotesDM.pFIBStoredProc.StoredProcName := 'TI_SP_NOTE_UPD';
      NotesDM.pFIBStoredProc.ParamByName('article_note').Value    := ViewForm.ArticleTextEdit.Text;
      NotesDM.pFIBStoredProc.ParamByName('short_name_note').Value := ViewForm.ShortNameTextEdit.Text;
      NotesDM.pFIBStoredProc.ParamByName('long_name_note').Value  := ViewForm.FullNameTextEdit.Text;
      NotesDM.pFIBStoredProc.ParamByName('id_note').Value         := id_note;
      NotesDM.pFIBStoredProc.ExecProc;
      NotesDM.WriteTransaction.Commit;
      NotesDM.NotesDSet.Close;
      NotesDM.NotesDSet.Open;
      NotesDM.NotesDSet.Locate('id_note',IntToStr(id_note),[]);
    end;   
end;

procedure TNotesMainForm.DeleteButtonClick(Sender: TObject);
begin
  if MessageDlg('Ви дійсно бажаєте вилучити запис? ', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin
  try
    NotesDM.WriteTransaction.StartTransaction;
    NotesDM.pFIBStoredProc.StoredProcName:='TI_SP_NOTE_DEL';
    NotesDM.pFIBStoredProc.ParamByName('id_note').Value:=NotesDM.NotesDSet['id_note'];
    NotesDM.pFIBStoredProc.ExecProc;
    NotesDM.WriteTransaction.Commit;
    NotesDM.NotesDSet.Close;
    NotesDM.NotesDSet.Open;
  except on E:Exception do
  begin
    MessageDlg('не можна видалити цей запис', mtError, [mbOK], 0);
    NotesDM.WriteTransaction.Rollback;
  end;
  end;
  end;
end;

procedure TNotesMainForm.NotesGridDBTableViewKeyPress(
  Sender: TObject; var Key: Char);
begin
   if (NotesGridDBTableView.OptionsBehavior.IncSearchItem<>NotesGridDBTableViewDB_NameNotes)then
   begin
    NotesGridDBTableView.Controller.IncSearchingText   := '';
    NotesGridDBTableView.OptionsBehavior.IncSearchItem := NotesGridDBTableViewDB_NameNotes;
   end;
end;

end.
