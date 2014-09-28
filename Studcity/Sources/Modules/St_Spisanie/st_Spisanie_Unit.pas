unit st_Spisanie_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxTextEdit,
  cxCurrencyEdit, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, dxBar, ImgList, ActnList,
  dxBarExtItems, dxStatusBar, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, frmDocs_AE_Unit, frmPfio_AE_Unit,
  st_ConstUnit, St_Proc, cxContainer, cxLabel, cxImage;


type
  TPMSumma = record
    PlusSumma: Currency;
    MinusSumma: Currency;
  end;

  type
  TfrmSpisanie = class(TForm)
    Splitter1: TSplitter;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    DataSource: TDataSource;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    ViewButton: TdxBarLargeButton;
    AddPfioButton: TdxBarLargeButton;
    DeletePfioButton: TdxBarLargeButton;
    EditPfioButton: TdxBarLargeButton;
    AddRoomButton2: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    Search_Button: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    ViewAction: TAction;
    DataSource1: TDataSource;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    PopupMenu1: TdxBarPopupMenu;
    PopupImageList: TImageList;
    dxBarPopupMenu1: TdxBarPopupMenu;
        DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    WriteProc: TpFIBStoredProc;
    ReadDataSet: TpFIBDataSet;
    RoomDataSet: TpFIBDataSet;
    NUM_DOC: TcxGridDBColumn;
    DATE_DOC: TcxGridDBColumn;
    FIO_COMBO: TcxGridDBColumn;
    Summa: TcxGridDBColumn;
    MinusEdit: TcxCurrencyEdit;
    PlusEdit: TcxCurrencyEdit;
    cxImage1: TcxImage;
    cxImage2: TcxImage;
    cxImage3: TcxImage;
    procedure ExitButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure AddPfioButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure EditPfioButtonClick(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure DeletePfioButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RoomDataSetAfterOpen(DataSet: TDataSet);
    procedure DataSetAfterScroll(DataSet: TDataSet);
  private
    id_user : int64;
    PLanguageIndex :byte;
    procedure FormIniLanguage();
    function GetDatasetSumma : TPMSumma;
  public

  end;

function View_Spisanie(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; id_user_in : int64):variant;stdcall;
exports  View_Spisanie;

var
  frmSpisanie: TfrmSpisanie;
  res:variant;
implementation

{$R *.dfm}

function TfrmSpisanie.GetDatasetSumma: TPMSumma;
var
 Buffer : Currency;
 i: integer;
 PMSumma :TPMSumma;
begin
Screen.Cursor := crHourGlass;
PMSumma.PlusSumma := 0;
PMSumma.MinusSumma := 0;
 if not RoomDataSet.Active then exit;
 RoomDataSet.First;

 for i:= 0 to RoomDataSet.RecordCount-1 do
 begin
  if RoomDataSet['SUMMA'] > 0 then PMSumma.PlusSumma  := PMSumma.PlusSumma + RoomDataSet['SUMMA'];
  if RoomDataSet['SUMMA'] < 0 then PMSumma.MinusSumma := PMSumma.MinusSumma + RoomDataSet['SUMMA'];
  RoomDataSet.Next;
  end;
Screen.Cursor := crDefault;
 Result := PMSumma;
end;

function View_Spisanie(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; id_user_in : int64):variant;stdcall;
var ViewForm: TfrmSpisanie;
begin
      ViewForm:=TfrmSpisanie.Create(AOwner);
      ViewForm.FormStyle:=fsMDIChild;
      ViewForm.DB.Handle := DB;
      ViewForm.id_user := id_user_in;
      ViewForm.DataSet.Open;
      ViewForm.RoomDataSet.Open;
      ViewForm.Show;
      View_Spisanie:=res;
end;

procedure TfrmSpisanie.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=               St_Proc.cnLanguageIndex;
 Caption := st_ConstUnit.st_Spisanie[PLanguageIndex];
 //названия кнопок
 ExitButton.Caption :=         st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
 ExitButton.Hint :=            st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
 AddButton.Caption :=          st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 AddButton.Hint :=             st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=         st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 EditButton.Hint :=            st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=       st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 DeleteButton.Hint :=          st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=      st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 RefreshButton.Hint :=         st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];

 AddPfioButton.Caption :=          st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 AddPfioButton.Hint :=             st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 EditPfioButton.Caption :=         st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 EditPfioButton.Hint :=            st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 DeletePfioButton.Caption :=       st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 DeletePfioButton.Hint :=          st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];

 // grid's
 NUM_DOC.Caption       :=   st_ConstUnit.st_NumDoc_Pay[PLanguageIndex];
 DATE_DOC.Caption      :=   st_ConstUnit.st_DateDoc_Pay[PLanguageIndex];
 FIO_COMBO.Caption     :=   st_ConstUnit.st_grid_FIO_Column[PLanguageIndex];
 Summa.Caption         :=   st_ConstUnit.st_Sum[PLanguageIndex];

end;

procedure TfrmSpisanie.ExitButtonClick(Sender: TObject);
begin
DataSet.Close;
ReadDataSet.Close;
RoomDataSet.Close;
DB.Close;
close;
end;

procedure TfrmSpisanie.AddButtonClick(Sender: TObject);
var ViewForm : TfrmDocs_AE;
 location : int64;
begin
 ViewForm := TfrmDocs_AE.create(self);
 ViewForm.PLanguageIndex := PLanguageIndex;
 ViewForm.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 if ViewForm.ShowModal = mrOk then
  begin
    with WriteProc do
     begin
      try
        StoredProcName := 'ST_DT_WRITING_OFF_DOCS_INS';
        Transaction.StartTransaction;
        ParamByName('NUM_DOC').AsString := ViewForm.Num_Doc_Edit.Text;
        ParamByName('DATE_DOC').AsDate  := ViewForm.Date_Doc_Edit.Date;
        ParamByName('ID_USER').AsInt64  := id_user;
        Prepare;
        ExecProc;
        location := ParamByName('ID_WRITING').AsInt64;
        Transaction.Commit;
        Close;
      except
        Transaction.Rollback;
        ShowMessage('Error in stored procedure ST_DT_WRITING_OFF_DOCS_INS');
        exit;
      end;
     end;
     DataSet.CloseOpen(true);
     DataSet.Locate('ID_WRITING',location,[] );
     RoomDataSet.CloseOpen(true);
  end;
end;

procedure TfrmSpisanie.RefreshButtonClick(Sender: TObject);
begin
DataSet.CloseOpen(true);
RoomDataSet.CloseOpen(true);
end;

procedure TfrmSpisanie.AddPfioButtonClick(Sender: TObject);
var
  ViewForm : TfrmPfio_AE;
  i: integer;
  id_pk_new : int64;
begin
 ViewForm := TfrmPfio_AE.create(self);
 ViewForm.PLanguageIndex := PLanguageIndex;
 ViewForm.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 ViewForm.DB_Handle := DB.Handle;
 if ViewForm.ShowModal = mrOk then
  begin
    with WriteProc do
     begin
      try
        StoredProcName := 'ST_DT_WRITING_OFF_BY_PFIO_INS';
        Transaction.StartTransaction;
        ParamByName('ID_KOD').AsInt64         := ViewForm.id_kod;
        ParamByName('SUMMA').AsCurrency       := ViewForm.SummaEdit.Value;
        ParamByName('ID_WRITING_OFF').AsInt64 := Dataset['ID_WRITING'];
        Prepare;
        ExecProc;
        id_pk_new := ParamByName('ID_PK').AsInt64;

        StoredProcName := 'ST_DT_WRITING_OFF_BUDJET_INS';
        for i:=0 to ViewForm.Grid_istochnikiTableView.DataController.RecordCount-1 do
         begin
          ParamByName('FK_BY_PFIO').AsInt64  := id_pk_new;
          ParamByName('SUMMA').AsCurrency    := ViewForm.Grid_istochnikiTableView.DataController.Values[i, 4];
          ParamByName('ID_SMET').AsInt64     := ViewForm.Grid_istochnikiTableView.DataController.Values[i, 5];
          ParamByName('ID_RAZD').AsInt64     := ViewForm.Grid_istochnikiTableView.DataController.Values[i, 6];
          ParamByName('ID_STAT').AsInt64     := ViewForm.Grid_istochnikiTableView.DataController.Values[i, 7];
          ParamByName('ID_KEKV').AsInt64     := ViewForm.Grid_istochnikiTableView.DataController.Values[i, 8];

          Prepare;
          ExecProc;
         end;

        Transaction.Commit;
        Close;
      except
        Transaction.Rollback;
        ShowMessage('Error in stored procedure ST_DT_WRITING_OFF_BY_PFIO_INS, ST_DT_WRITING_OFF_BUDJET_INS');
        exit;
      end;
     end;

     RoomDataSet.CloseOpen(true);
     RoomDataSet.Locate('ID_PK',id_pk_new,[] );
  end;
end;

procedure TfrmSpisanie.EditButtonClick(Sender: TObject);
var ViewForm : TfrmDocs_AE;
 locateID : int64;
begin
if cxGrid1DBTableView1.DataController.RecordCount = 0 then exit;
 ViewForm := TfrmDocs_AE.create(self);
 ViewForm.PLanguageIndex := PLanguageIndex;
 ViewForm.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 ViewForm.Num_Doc_Edit.Text  := DataSet['NUM_DOC'];
 ViewForm.Date_Doc_Edit.Date := DataSet['DATE_DOC'];

 if ViewForm.ShowModal = mrOk then
  begin
    with WriteProc do
     begin
      try
        StoredProcName := 'ST_DT_WRITING_OFF_DOCS_UPT';
        Transaction.StartTransaction;
        ParamByName('ID_WRITING').AsInt64 := Dataset['ID_WRITING'];
        locateID := Dataset['ID_WRITING'];
        ParamByName('NUM_DOC').AsString   := ViewForm.Num_Doc_Edit.Text;
        ParamByName('DATE_DOC').AsDate    := ViewForm.Date_Doc_Edit.Date;
        ParamByName('ID_USER').AsInt64    := id_user;
        Prepare;
        ExecProc;
        Transaction.Commit;
        Close;
      except
        Transaction.Rollback;
        ShowMessage('Error in stored procedure ST_DT_WRITING_OFF_DOCS_UPT');
        exit;
      end;
     end;
   DataSet.CloseOpen(true);
   RoomDataSet.CloseOpen(true);
   DataSet.Locate('ID_WRITING',locateID, []);
  end;
end;
procedure TfrmSpisanie.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure TfrmSpisanie.EditPfioButtonClick(Sender: TObject);
var ViewForm : TfrmPfio_AE;
 i: integer;
 NEW_ID_PK: int64;
begin
if cxGridDBTableView1.DataController.RecordCount = 0 then exit;
 ViewForm := TfrmPfio_AE.create(self);
 ViewForm.DB_Handle := DB.Handle;
 ViewForm.PLanguageIndex := PLanguageIndex;
 ViewForm.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 ViewForm.Studer_Edit.Text := RoomDataSet['FIO_COMBO'];
 ViewForm.SummaEdit.Value :=  RoomDataSet['SUMMA'];
 ViewForm.id_kod :=  RoomDataSet['ID_KOD'];
 // забираю бюджеты
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text := 'select * from ST_DT_WRITING_OFF_BUDJET_SEL('+ IntToStr(RoomDataSet['ID_PK']) +')';
 ReadDataSet.Open;
 ReadDataSet.FetchAll;
 ReadDataSet.First;
  for i:=0 to ReadDataSet.RecordCount -1 do
   begin
    ViewForm.Grid_istochnikiTableView.DataController.RecordCount := ViewForm.Grid_istochnikiTableView.DataController.RecordCount + 1;
    ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 0] := ReadDataSet['KOD_SM'];
    ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 1] := ReadDataSet['KOD_RAZD'];
    ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 2] := ReadDataSet['KOD_ST'];
    ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 3] := ReadDataSet['KOD_KEKV'];
    ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 4] := ReadDataSet['SUMMA'];

    ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 5] := ReadDataSet['ID_SMET'];
    ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 6] := ReadDataSet['ID_RAZD'];
    ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 7] := ReadDataSet['ID_STAT'];
    ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 8] := ReadDataSet['ID_KEKV'];
   ReadDataSet.Next;
   end;
 ViewForm.Grid_istochnikiTableView.DataController.FocusedRecordIndex := 0;
 ReadDataSet.Close;

 if ViewForm.ShowModal = mrOk then
  begin
    with WriteProc do
     begin
      try
        Transaction.StartTransaction;

        StoredProcName := 'ST_DT_WRITING_OFF_BY_PFIO_UPT';
        ParamByName('ID_PK').AsInt64          := RoomDataSet['ID_PK'];
        ParamByName('USE_BEG').AsDateTime     := VarToDateTime(RoomDataSet['USE_BEG']);
        ParamByName('ID_KOD').AsInt64         := ViewForm.id_kod;
        ParamByName('SUMMA').AsCurrency       := ViewForm.SummaEdit.Value;
        ParamByName('ID_WRITING_OFF').AsInt64 := Dataset['ID_WRITING'];
        Prepare;
        ExecProc;
        NEW_ID_PK := ParamByName('NEW_ID_PK').AsInt64;

        StoredProcName := 'ST_DT_WRITING_OFF_BUDJET_CLOSE';
        ParamByName('ID_PK').AsInt64          := RoomDataSet['ID_PK'];
        Prepare;
        ExecProc;

        StoredProcName := 'ST_DT_WRITING_OFF_BUDJET_INS';
        for i:=0 to ViewForm.Grid_istochnikiTableView.DataController.RecordCount-1 do
         begin
          ParamByName('FK_BY_PFIO').AsInt64  := NEW_ID_PK;
          ParamByName('SUMMA').AsCurrency    := ViewForm.Grid_istochnikiTableView.DataController.Values[i, 4];
          ParamByName('ID_SMET').AsInt64     := ViewForm.Grid_istochnikiTableView.DataController.Values[i, 5];
          ParamByName('ID_RAZD').AsInt64     := ViewForm.Grid_istochnikiTableView.DataController.Values[i, 6];
          ParamByName('ID_STAT').AsInt64     := ViewForm.Grid_istochnikiTableView.DataController.Values[i, 7];
          ParamByName('ID_KEKV').AsInt64     := ViewForm.Grid_istochnikiTableView.DataController.Values[i, 8];

          Prepare;
          ExecProc;
         end;

        Transaction.Commit;
        Close;
      except
        Transaction.Rollback;
        ShowMessage('Error in stored procedure ST_DT_WRITING_OFF_BY_PFIO_UPT, ST_DT_WRITING_OFF_BUDJET_CLOSE, ST_DT_WRITING_OFF_BUDJET_INS');
        raise;
      end;
     end;

   RoomDataSet.CloseOpen(true);
   RoomDataSet.Locate('ID_PK',NEW_ID_PK, []);
  end;
end;

procedure TfrmSpisanie.cxGridDBTableView1DblClick(Sender: TObject);
begin
  EditPfioButtonClick(Sender);
end;

procedure TfrmSpisanie.DeletePfioButtonClick(Sender: TObject);
begin
if cxGridDBTableView1.DataController.RecordCount = 0 then exit;
  if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
    with WriteProc do
     begin
      try
        StoredProcName := 'ST_DT_WRITING_OFF_BY_PFIO_DEL';
        Transaction.StartTransaction;
        ParamByName('ID_PK').AsInt64         := RoomDataSet['ID_PK'];
        ParamByName('USE_BEG').AsDateTime    := RoomDataSet['USE_BEG'];
        Prepare;
        ExecProc;
        Transaction.Commit;
        Close;
      except
        Transaction.Rollback;
        ShowMessage('Error in stored procedure ST_DT_WRITING_OFF_BY_PFIO_DEL');
        exit;
      end;
     end;
          RoomDataSet.CloseOpen(true);
end;

procedure TfrmSpisanie.FormShow(Sender: TObject);
begin
FormIniLanguage();
end;

procedure TfrmSpisanie.DeleteButtonClick(Sender: TObject);
begin
if cxGrid1DBTableView1.DataController.RecordCount = 0 then exit;
  if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
  if RoomDataSet.RecordCount > 0 then
   begin
    Showmessage('Неможливо видалити. Документ має залежні суми!');
    exit;
   end;
    with WriteProc do
     begin
      try
        StoredProcName := 'ST_DT_WRITING_OFF_DOCS_DEL';
        Transaction.StartTransaction;
        ParamByName('ID_WRITING').AsInt64   := DataSet['ID_WRITING'];
        Prepare;
        ExecProc;
        Transaction.Commit;
        Close;
      except
        Transaction.Rollback;
        ShowMessage('Error in stored procedure ST_DT_WRITING_OFF_DOCS_DEL');
        exit;
      end;
     end;

     DataSet.CloseOpen(true);
     RoomDataSet.CloseOpen(true);
end;


procedure TfrmSpisanie.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:= caFree;
end;

procedure TfrmSpisanie.RoomDataSetAfterOpen(DataSet: TDataSet);
var PMSumma :TPMSumma;
begin
 PMSumma := GetDatasetSumma;
 MinusEdit.Value := PMSumma.MinusSumma;
 PlusEdit.Value  := PMSumma.PlusSumma;
end;

procedure TfrmSpisanie.DataSetAfterScroll(DataSet: TDataSet);
var PMSumma :TPMSumma;
begin
 PMSumma := GetDatasetSumma;
 MinusEdit.Value := PMSumma.MinusSumma;
 PlusEdit.Value  := PMSumma.PlusSumma;
end;

end.
