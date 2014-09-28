unit UpSpec;

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
    TfrmSpec = class(TForm)
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
    SpecGrid: TcxGrid;
    SpecDataView: TcxGridDBTableView;
    SpecGridLevel: TcxGridLevel;
    SpecDSet: TpFIBDataSet;
    SpecDSource: TDataSource;
    SpecDB: TpFIBDatabase;
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
    SReadTrans: TpFIBTransaction;
    SWriteTrans: TpFIBTransaction;
    Panel1: TPanel;
    Panel2: TPanel;
    lblSearch: TcxLabel;
    SearchEdit: TcxTextEdit;
    chLocFilter: TCheckBox;
    chPanelGorup: TCheckBox;
    lblLocFilter: TcxLabel;
    lblPanelGroup: TcxLabel;
    SpecDataViewDBColumn1: TcxGridDBColumn;
        procedure btn3Click(Sender: TObject);
        procedure RefreshButtonClick(Sender: TObject);
    procedure ExitActExecute(Sender: TObject);
    procedure InsActExecute(Sender: TObject);
    procedure EditActExecute(Sender: TObject);
    procedure DelActExecute(Sender: TObject);
    procedure SelectActExecute(Sender: TObject);
    procedure RefreshActExecute(Sender: TObject);
    procedure SpecDataViewDblClick(Sender: TObject);
    procedure SearchEditPropertiesChange(Sender: TObject);
    procedure chLocFilterClick(Sender: TObject);
    procedure chPanelGorupClick(Sender: TObject);
    procedure SpecDataViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    private
    { Private declarations }
        OutPut:TRxMemoryData;
    public
    { Public declarations }
        signer_fio: string;
        signer_post: string;
        constructor Create(AOwner: TComponent; OutPut:TRxMemoryData; DbHandle: TISC_DB_HANDLE; ModeEdit:Integer); reintroduce;
        procedure SpecDSetCloseOpen;
    end;

implementation

{$R *.dfm}

uses UpSpecEdit, BaseTypes, UpKernelUnit;

{ TfrmSpSigners }

constructor TfrmSpec.Create(AOwner: TComponent; OutPut:TRxMemoryData; DbHandle: TISC_DB_HANDLE; ModeEdit:Integer);
begin
    inherited Create(AOwner);
    Self.Output:=OutPut;
    SpecDB.Handle := DbHandle;
    SpecDSetCloseOpen;
    If ModeEdit=0 then
    begin
       btnAdd.Visible:=ivNever;
       btnEdit.Visible:=ivNever;
       btnDel.Visible:=ivNever;
    end;
end;

procedure TfrmSpec.SpecDSetCloseOpen;
begin
   SpecDSet.Close;
   SpecDSet.SelectSQL.Text := 'select * from  SP_SPEC_SELECT order by name_spec collate win1251_ua';
   SpecDSet.Open;
end;

procedure TfrmSpec.btn3Click(Sender: TObject);
begin
    ModalResult := mrNo;
end;

procedure TfrmSpec.RefreshButtonClick(Sender: TObject);
begin
    SpecDSetCloseOpen;
end;

procedure TfrmSpec.ExitActExecute(Sender: TObject);
begin
   Close;
end;

procedure TfrmSpec.InsActExecute(Sender: TObject);
var frm: TfrmSpecEdit;
    Id: Integer;
    ErText:String;
begin
    frm := TfrmSpecEdit.Create(self);
    frm.Caption:='Додати';
    if frm.ShowModal = mrOk then
    begin
        StorProc.StoredProcName := 'SP_SPEC_INSERT';
        StorProc.Transaction.StartTransaction;
        StorProc.Prepare;
        StorProc.ParamByName('NAME_SPEC').AsString := frm.SpecEdit.Text;
        try
          StorProc.ExecProc;
          Id := StorProc.ParamByName('ID_SPEC').AsInteger;
          ErText := StorProc.ParamByName('ERORR_TEXT').AsString;
          If ErText='NO' then StorProc.Transaction.Commit
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
        SpecDSetCloseOpen;
        SpecDSet.Locate('ID_SPEC', Id, []);
    end;
    frm.Free;
end;

procedure TfrmSpec.EditActExecute(Sender: TObject);
var frm: TfrmSpecEdit;
    Id: Integer;
    ErText:string;
begin
    frm := TfrmSpecEdit.Create(self);
    frm.Caption:='Змінити';
    frm.SpecEdit.EditValue := SpecDSet.FieldByName('NAME_SPEC').Value;
    if frm.ShowModal = mrOk then
    begin
        StorProc.Transaction.StartTransaction;
        StorProc.StoredProcName := 'SP_SPEC_UPDATE';
        StorProc.Prepare;
        Id := SpecDSet['ID_SPEC'];
        StorProc.ParamByName('NAME_SPEC').AsString := frm.SpecEdit.Text;
        StorProc.ParamByName('ID_SPEC').AsInteger := Id;
        try
          StorProc.ExecProc;
          ErText := StorProc.ParamByName('ERORR_TEXT').AsString;
          If ErText='NO' then StorProc.Transaction.Commit
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
        SpecDSetCloseOpen;
        SpecDSet.Locate('ID_SPEC', Id, []);
    end;
    frm.Free;
end;

procedure TfrmSpec.DelActExecute(Sender: TObject);
begin
    if (SpecDSet.RecordCount > 0)
        then begin
        if agMessageDlg('Увага!', 'Ви бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo]) = mrYes then
        begin
            StorProc.Transaction.StartTransaction;
            StorProc.StoredProcName := 'SP_SPEC_DELETE';
            StorProc.Prepare;
            StorProc.ParamByName('ID_SPEC').Value := SpecDSet.FieldByName('ID_SPEC').Value;
            StorProc.ExecProc;
            StorProc.Transaction.Commit;
            SpecDSetCloseOpen;
        end;
    end;
end;

procedure TfrmSpec.SelectActExecute(Sender: TObject);
begin
   If SpecDSet.IsEmpty then Exit;
   if Output <> nil then
   begin
      Output.Open;
      Output.Append;
      OutPut['Id_Spec']:=SpecDSet['Id_Spec'];
      Output['Name_Spec']:=SpecDSet['Name_Spec'];
      Output.Post;
   end;
   ModalResult:=mrOk;
end;

procedure TfrmSpec.RefreshActExecute(Sender: TObject);
begin
   SpecDSetCloseOpen;
end;

procedure TfrmSpec.SpecDataViewDblClick(Sender: TObject);
begin
   if not SpecDSet.IsEmpty then SelectActExecute(Self);
end;

procedure TfrmSpec.SearchEditPropertiesChange(Sender: TObject);
var FltStr:string;
begin
   if (SearchEdit.Text = '') or (VarIsNull(SearchEdit.Text)) then
   begin
     SpecDataView.DataController.DataSet.Filtered := False;
   end
   else
   begin
    try
      SpecDataView.DataController.DataSet.Filtered := False;
      FltStr := 'UPPER('+AnsiUpperCase('NAME_SPEC')+') LIKE ''' +
            '%'+AnsiUpperCase(SearchEdit.Text) + '%'' and '+'NAME_SPEC'+' is not null';
      SpecDataView.DataController.DataSet.Filter:=FltStr;
      SpecDataView.DataController.DataSet.Filtered := True;
      SpecDataView.DataController.SelectRows(0, 0);
    except on e:exception
           do showmessage(e.message);
    end;
   end;
end;

procedure TfrmSpec.chLocFilterClick(Sender: TObject);
var i:Integer;
begin
   for i:=0 to SpecDataView.ColumnCount-1 do
       SpecDataView.Columns[i].Options.Filtering:=chLocFilter.Checked;
end;

procedure TfrmSpec.chPanelGorupClick(Sender: TObject);
begin
   SpecDataView.OptionsView.GroupByBox:=chPanelGorup.Checked;
end;

procedure TfrmSpec.SpecDataViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ((Key=VK_F12) and (ssShift in Shift)) then ShowInfo(SpecDSet);
end;

end.
