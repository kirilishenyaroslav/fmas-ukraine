unit TypeEducMain;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ComCtrls, ToolWin, ImgList, cxStyles, cxCustomData, cxGraphics,
    cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet,
    pFIBDataSet, cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, cxClasses, Ibase,
    FIBDatabase, pFIBDatabase, pFibStoredProc, rxmemDs, ActnList, dxBar,
  dxBarExtItems, FIBQuery, pFIBQuery, ExtCtrls, cxTextEdit, cxContainer,
  cxLabel, cxMaskEdit, cxDropDownEdit, StdCtrls, dxBarExtDBItems;


type
    TfrmTypeEduc = class(TForm)
    EducDB: TpFIBDatabase;
    EducDataSet: TpFIBDataSet;
    EducReadTrans: TpFIBTransaction;
    EducWriteTrans: TpFIBTransaction;
    EducView: TcxGridDBTableView;
    EducTypeLevel: TcxGridLevel;
    EducTypeGrid: TcxGrid;
    EducBarManager: TdxBarManager;
    ToolsSubItem: TdxBarSubItem;
    CloseSubItem: TdxBarSubItem;
    EducStoredProc: TpFIBStoredProc;
    TypeEducDataSource: TDataSource;
    EducViewNAME_EDUC: TcxGridDBColumn;
    ToolsPanel: TPanel;
    FindingLabel: TLabel;
    EducActionList: TActionList;
    TypeEducSelectBtn: TdxBarLargeButton;
    TypeEducUpdateBtn: TdxBarLargeButton;
    TypeEducCloseBtn: TdxBarLargeButton;
    TypeEducChangeBtn: TdxBarLargeButton;
    EducButtonsImages: TImageList;
    TypeEducAddBtn: TdxBarLargeButton;
    TypeEducDeleteBtn: TdxBarLargeButton;
    LocalFilterCheck: TCheckBox;
    GroupPanelCheck: TCheckBox;
    FilterEdit: TcxTextEdit;
    ActIns: TAction;
    ActEdit: TAction;
    ActDel: TAction;
    ActUpdate: TAction;
    ActSelect: TAction;
    ActClose: TAction;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    procedure LocalFilterCheckClick(Sender: TObject);
    procedure GroupPanelCheckClick(Sender: TObject);
    procedure EducViewDblClick(Sender: TObject);
    procedure FindingEditPropertiesChange(Sender: TObject);
    procedure QuickFindActExecute(Sender: TObject);
    procedure EducViewKeyPress(Sender: TObject; var Key: Char);
    procedure ActInsExecute(Sender: TObject);
    procedure ActEditExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure ActUpdateExecute(Sender: TObject);
    procedure ActSelectExecute(Sender: TObject);
    procedure ActCloseExecute(Sender: TObject);
    private
    { Private declarations }
        OutPut:TRxMemoryData;
        procedure EducDSetCloseOpen;
    public
    { Public declarations }
        constructor Create(AOwner: TComponent; OutPut:TRxMemoryData; DbHandle: TISC_DB_HANDLE); reintroduce;
    end;

implementation

{$R *.dfm}

uses BaseTypes, UpKernelUnit, TypeEducEdit;


constructor TfrmTypeEduc.Create(AOwner: TComponent; OutPut:TRxMemoryData; DbHandle: TISC_DB_HANDLE);
begin
  try
    inherited Create(AOwner);
    Self.Output := OutPut;
    EducDB.Handle := DbHandle;
    EducDSetCloseOpen;
  Except on E:Exception do
         begin
            agShowMessage(E.Message);
         end;
   end;
end;

procedure TfrmTypeEduc.EducDSetCloseOpen;
var OldEducViewIndex:integer;
begin
  //OldEducViewIndex := EducView.DataController.FocusedRowIndex;
  //EducView.DataController.DataSet.Filtered:= False;
  EducDataSet.Close;
  EducDataSet.SQLs.SelectSQL.Text:='SELECT * FROM SP_EDUCATION_SELECT ORDER BY NAME_EDUC COLLATE WIN1251_UA';
  EducDataSet.Open;
  //EducView.DataController.FocusedRowIndex := OldEducViewIndex;
end;

procedure TfrmTypeEduc.LocalFilterCheckClick(Sender: TObject);
begin
   EducView.OptionsCustomize.ColumnFiltering := LocalFilterCheck.Checked;
   //EducTypeGrid.SetFocus;
end;

procedure TfrmTypeEduc.GroupPanelCheckClick(Sender: TObject);
begin
   EducView.OptionsView.GroupByBox := GroupPanelCheck.Checked;
   EducTypeGrid.SetFocus;
end;

procedure TfrmTypeEduc.EducViewDblClick(Sender: TObject);
begin
   ActSelectExecute(Self);
end;

procedure TfrmTypeEduc.FindingEditPropertiesChange(Sender: TObject);
var str:string;
begin
  str:='UPPER(NAME_EDUC) like ''%' + AnsiUpperCase(FilterEdit.Text) + '%''';
  if FilterEdit.Text = '' then EducView.DataController.DataSet.Filtered := False
  else
  begin
     EducView.DataController.DataSet.Filtered := False;
     EducView.DataController.DataSet.Filter   := str;
     EducView.DataController.DataSet.Filtered := True;
  end;
end;

procedure TfrmTypeEduc.QuickFindActExecute(Sender: TObject);
begin
  FilterEdit.SetFocus;
end;

procedure TfrmTypeEduc.EducViewKeyPress(Sender: TObject; var Key: Char);
begin
   if ((Key = #10) or (Key = #8)) then
   begin
      exit;
   end;
   FilterEdit.Text:=FilterEdit.Text+Key;
   FilterEdit.SetFocus;
   FilterEdit.SetSelection(length(FilterEdit.Text),0);
end;

procedure TfrmTypeEduc.ActInsExecute(Sender: TObject);
var frm:TfrmTypeEducEdit;
    Id:Integer;
begin
  frm := TfrmTypeEducEdit.Create(Self);
  frm.Caption := 'Додати';
  if (frm.ShowModal = mrOk) then
  begin
    EducWriteTrans.StartTransaction;
    EducStoredProc.StoredProcName := 'SP_EDUCATION_INSERT';
    EducStoredProc.Prepare;
    EducStoredProc.ParamByName('NAME_EDUC').AsString := frm.NameEducEdit.text;
    EducStoredProc.ExecProc;
    //Id:=EducStoredProc.FieldByName('ID_EDUC').AsInteger;
    EducWriteTrans.Commit;
    EducDSetCloseOpen;
    //EducDataSet.Locate('ID_EDUC', Id, []);
  end;
  frm.Free;
end;

procedure TfrmTypeEduc.ActEditExecute(Sender: TObject);
var frm:TfrmTypeEducEdit;
    Id:Integer;
begin
  if EducDataSet.IsEmpty then
  begin
    exit;
  end;
  Id:=EducDataSet['ID_EDUC'];
  frm := TfrmTypeEducEdit.Create(Self);    
  frm.Caption := 'Змінити';
  frm.NameEducEdit.text := EducDataSet['NAME_EDUC'];
  if (frm.ShowModal = mrOk) then
  begin
    EducWriteTrans.StartTransaction;
    EducStoredProc.StoredProcName := 'SP_EDUCATION_UPDATE';
    EducStoredProc.Prepare;
    EducStoredProc.ParamByName('NAME_EDUC').AsString := frm.NameEducEdit.text;
    EducStoredProc.ParamByName('ID_EDUC').AsInteger := EducDataSet['ID_EDUC'];
    EducStoredProc.ExecProc;
    EducWriteTrans.Commit;
    EducDSetCloseOpen;
    EducDataSet.Locate('ID_EDUC', Id, []);
  end;
  frm.Free;
end;

procedure TfrmTypeEduc.ActDelExecute(Sender: TObject);
begin
  if EducDataSet.IsEmpty then
  begin
    exit;
  end;
  if MessageDlg('Ви бажаєте вилучити цей запис?' + EducDataSet['NAME_EDUC'] + '?',mtInformation,[mbYes,mbNo],0)=mrYes then
  begin
    try
      EducWriteTrans.StartTransaction;
      EducStoredProc.StoredProcName := 'SP_EDUCATION_DELETE';
      EducStoredProc.Prepare;
      EducStoredProc.ParamByName('ID_EDUC').AsInteger := EducDataSet['ID_EDUC'];
      EducStoredProc.ExecProc;
      EducWriteTrans.Commit;
      EducDSetCloseOpen;
    Except
      on E:Exception do
      begin
        MessageDlg(E.Message, mtError, [mbOk], 0);
      end;
    end;
  end;
end;

procedure TfrmTypeEduc.ActUpdateExecute(Sender: TObject);
begin
  EducDSetCloseOpen;
end;

procedure TfrmTypeEduc.ActSelectExecute(Sender: TObject);
begin
  if EducDataSet.IsEmpty then exit;
  if OutPut <> nil then
  begin
     OutPut.Open;
     OutPut.Append;
     OutPut['Id_Educ']:=EducDataSet['Id_Educ'];
     OutPut['Name_Educ']:=EducDataSet['Name_educ'];
     OutPut.Post;
     ModalResult:=mrOk;
  end;
end;

procedure TfrmTypeEduc.ActCloseExecute(Sender: TObject);
begin
  Close;
end;

end.
