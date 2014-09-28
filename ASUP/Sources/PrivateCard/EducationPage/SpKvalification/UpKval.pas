unit UpKval;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ComCtrls, ToolWin, ImgList, cxStyles, cxCustomData, cxGraphics,
    cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet,
    pFIBDataSet, cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, cxClasses, Ibase,
    FIBDatabase, pFIBDatabase, pFibStoredProc, rxmemDs, ActnList, dxBar,
  dxBarExtItems, FIBQuery, pFIBQuery, ExtCtrls, cxTextEdit, cxContainer,
  cxLabel, cxMaskEdit, cxDropDownEdit, StdCtrls;


type
    TfrmKval = class(TForm)
        IL_Orders: TImageList;
        StyleRepository: TcxStyleRepository;
        stBackground: TcxStyle;
        stContent: TcxStyle;
        stContentEven: TcxStyle;
        stContentOdd: TcxStyle;
        stFilterBox: TcxStyle;
        stFooter: TcxStyle;
        stGroup: TcxStyle;
        stGroupByBox: TcxStyle;
        stHeader: TcxStyle;
        stInactive: TcxStyle;
        stIncSearch: TcxStyle;
        stIndicator: TcxStyle;
        stPreview: TcxStyle;
        stSelection: TcxStyle;
        stHotTrack: TcxStyle;
        ContentError: TcxStyle;
        qizzStyle: TcxGridTableViewStyleSheet;
    KvalGrid: TcxGrid;
    KvalDataView: TcxGridDBTableView;
    KvalGridLevel: TcxGridLevel;
    KvalDSet: TpFIBDataSet;
    ShifrDSource: TDataSource;
    KvalDB: TpFIBDatabase;
    MainActionList: TActionList;
    InsAct: TAction;
    EditAct: TAction;
    DelAct: TAction;
    RefreshAct: TAction;
    ImageList: TImageList;
    MainBarManager: TdxBarManager;
    btnAdd: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    btnRefresh: TdxBarLargeButton;
    btnSelect: TdxBarLargeButton;
    btnExit: TdxBarLargeButton;
    SelectAct: TAction;
    ExitAct: TAction;
    StorProc: TpFIBStoredProc;
    KReadTrans: TpFIBTransaction;
    KWriteTrans: TpFIBTransaction;
    Panel1: TPanel;
    Panel2: TPanel;
    lblSearch: TcxLabel;
    SearchEdit: TcxTextEdit;
    chLocFilter: TCheckBox;
    chPanelGorup: TCheckBox;
    lblLocFilter: TcxLabel;
    lblPanelGroup: TcxLabel;
    KvalDataViewDBColumn1: TcxGridDBColumn;
        procedure btn3Click(Sender: TObject);
        procedure RefreshButtonClick(Sender: TObject);
    procedure ExitActExecute(Sender: TObject);
    procedure InsActExecute(Sender: TObject);
    procedure EditActExecute(Sender: TObject);
    procedure DelActExecute(Sender: TObject);
    procedure SelectActExecute(Sender: TObject);
    procedure RefreshActExecute(Sender: TObject);
    procedure KvalDataViewDblClick(Sender: TObject);
    procedure SearchEditPropertiesChange(Sender: TObject);
    procedure chLocFilterClick(Sender: TObject);
    procedure chPanelGorupClick(Sender: TObject);
    private
    { Private declarations }
        OutPut:TRxMemoryData;
    public
    { Public declarations }
        signer_fio: string;
        signer_post: string;
        constructor Create(AOwner: TComponent; OutPut:TRxMemoryData; DbHandle: TISC_DB_HANDLE; ModeEdit:Integer); reintroduce;
        procedure KvalDSetCloseOpen;
    end;

implementation

{$R *.dfm}

uses UpKvalEdit, BaseTypes;

{ TfrmSpSigners }

constructor TfrmKval.Create(AOwner: TComponent; OutPut:TRxMemoryData; DbHandle: TISC_DB_HANDLE; ModeEdit:Integer);
begin
    inherited Create(AOwner);
    Self.Output:=OutPut;
    KvalDB.Handle := DbHandle;
    KvalDSetCloseOpen;
    If ModeEdit=0 then
    begin
       btnAdd.Visible:=ivNever;
       btnEdit.Visible:=ivNever;
       btnDel.Visible:=ivNever;
    end;
end;

procedure TfrmKval.KvalDSetCloseOpen;
begin
   KvalDSet.Close;
   KvalDSet.SelectSQL.Text := 'select * from  SP_KVALIFICATION_SELECT order by name_kval collate win1251_ua';
   KvalDSet.Open;
end;

procedure TfrmKval.btn3Click(Sender: TObject);
begin
    ModalResult := mrNo;
end;

procedure TfrmKval.RefreshButtonClick(Sender: TObject);
begin
    KvalDSetCloseOpen;
end;

procedure TfrmKval.ExitActExecute(Sender: TObject);
begin
   Close;
end;

procedure TfrmKval.InsActExecute(Sender: TObject);
var frm: TfrmKvalEdit;
    Id: Integer;
    ErText:string;
begin
    frm := TfrmKvalEdit.Create(self);
    frm.Caption:='Додати';
    if frm.ShowModal = mrOk then
    begin
        StorProc.StoredProcName := 'SP_KVALIFICATION_INSERT';
        StorProc.Transaction.StartTransaction;
        StorProc.Prepare;
        StorProc.ParamByName('NAME_KVAL').AsString := frm.KvalEdit.Text;
        try
          StorProc.ExecProc;
          Id := StorProc.ParamByName('ID_KVAL').AsInteger;
          ErText := StorProc.ParamByName('ERORR_TEXT').AsString;
          if ErText='NO' then StorProc.Transaction.Commit
          else
          begin
             agMessageDlg('Увага!', ErText, mtInformation, [mbOK]);
             StorProc.Transaction.Rollback;
          end;
        except on e:Exception
               do begin
                    agMessageDlg('Увага!', e.Message, mtInformation, [mbOK]);
                    StorProc.Transaction.Rollback;
               end;
        end;
        KvalDSetCloseOpen;
        KvalDSet.Locate('ID_KVAL', Id, []);
    end;
    frm.Free;
end;

procedure TfrmKval.EditActExecute(Sender: TObject);
var frm: TfrmKvalEdit;
    Id: Integer;
    ErText:String;
begin
    frm := TfrmKvalEdit.Create(self);
    frm.Caption:='Змінити';
    frm.KvalEdit.EditValue := KvalDSet.FieldByName('NAME_KVAL').Value;
    if frm.ShowModal = mrOk then
    begin
        StorProc.Transaction.StartTransaction;
        StorProc.StoredProcName := 'SP_KVALIFICATION_UPDATE';
        StorProc.Prepare;
        Id := KvalDSet['ID_KVAL'];
        StorProc.ParamByName('NAME_KVAL').AsString := frm.KvalEdit.Text;
        StorProc.ParamByName('ID_KVAL').AsInteger := Id;
        try
          StorProc.ExecProc;
          ErText := StorProc.ParamByName('ERORR_TEXT').AsString;
          if ErText='No' then StorProc.Transaction.Commit
          else
          begin
             agMessageDlg('Увага!', ErText, mtInformation, [mbOK]);
             StorProc.Transaction.Rollback;
          end;
        except on e:Exception
               do begin
                     agMessageDlg('Увага!', e.Message, mtInformation, [mbOK]);
                     StorProc.Transaction.Rollback;
               end;
        end;       
        KvalDSetCloseOpen;
        KvalDSet.Locate('ID_KVAL', Id, []);
    end;
    frm.Free;
end;

procedure TfrmKval.DelActExecute(Sender: TObject);
begin
    if (KvalDSet.RecordCount > 0)
        then begin
        if agMessageDlg('Увага!', 'Ви бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo]) = mrYes then
        begin
            StorProc.Transaction.StartTransaction;
            StorProc.StoredProcName := 'SP_KVALIFICATION_DELETE';
            StorProc.Prepare;
            StorProc.ParamByName('ID_KVAL').Value := KvalDSet.FieldByName('ID_KVAL').Value;
            StorProc.ExecProc;
            StorProc.Transaction.Commit;
            KvalDSetCloseOpen;
        end;
    end;
end;

procedure TfrmKval.SelectActExecute(Sender: TObject);
begin
   If KvalDSet.IsEmpty then Exit;
   if Output <> nil then
   begin
      Output.Open;
      Output.Append;
      OutPut['Id_Kval']:=KvalDSet['Id_Kval'];
      Output['Name_Kval']:=KvalDSet['Name_Kval'];
      Output.Post;
   end;
   ModalResult:=mrOk;
end;

procedure TfrmKval.RefreshActExecute(Sender: TObject);
begin
   KvalDSetCloseOpen;
end;

procedure TfrmKval.KvalDataViewDblClick(Sender: TObject);
begin
   if not KvalDSet.IsEmpty then SelectActExecute(Self);
end;

procedure TfrmKval.SearchEditPropertiesChange(Sender: TObject);
var FltStr:string;
begin
   if (SearchEdit.Text = '') or (VarIsNull(SearchEdit.Text)) then
   begin
     KvalDataView.DataController.DataSet.Filtered := False;
   end
   else
   begin
    try
      KvalDataView.DataController.DataSet.Filtered := False;
      FltStr := 'UPPER('+AnsiUpperCase('NAME_KVAL')+') LIKE ''' +
            '%'+AnsiUpperCase(SearchEdit.Text) + '%'' and '+'NAME_KVAL'+' is not null';
      KvalDataView.DataController.DataSet.Filter:=FltStr;
      KvalDataView.DataController.DataSet.Filtered := True;
      KvalDataView.DataController.SelectRows(0, 0);
    except on e:exception
           do showmessage(e.message);
    end;
   end;
end;

procedure TfrmKval.chLocFilterClick(Sender: TObject);
var i:Integer;
begin
   for i:=0 to KvalDataView.ColumnCount-1 do
       KvalDataView.Columns[i].Options.Filtering:=chLocFilter.Checked;
end;

procedure TfrmKval.chPanelGorupClick(Sender: TObject);
begin
   KvalDataView.OptionsView.GroupByBox:=chPanelGorup.Checked;
end;

end.
