unit SpecShifr;

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

Const FiltersFields: Array[0..1] Of String = ('NUM_SHIFR', 'NAME_SPEC');

type
    TfrmSpecShifr = class(TForm)
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
    ShifrGrid: TcxGrid;
    ShifrDataView: TcxGridDBTableView;
    ShifrDataViewDBColumn1: TcxGridDBColumn;
    ShifrDataViewDBColumn2: TcxGridDBColumn;
    ShifrGridLevel: TcxGridLevel;
    ShifrDSet: TpFIBDataSet;
    ShifrDSource: TDataSource;
    ShifrDB: TpFIBDatabase;
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
    ShReadTrans: TpFIBTransaction;
    ShWriteTrans: TpFIBTransaction;
    Panel1: TPanel;
    Panel2: TPanel;
    lblSearch: TcxLabel;
    SearchEdit: TcxTextEdit;
    cbSearchBox: TcxComboBox;
    chLocFilter: TCheckBox;
    chPanelGorup: TCheckBox;
    lblLocFilter: TcxLabel;
    lblPanelGroup: TcxLabel;
        procedure btn3Click(Sender: TObject);
        procedure RefreshButtonClick(Sender: TObject);
    procedure ExitActExecute(Sender: TObject);
    procedure InsActExecute(Sender: TObject);
    procedure EditActExecute(Sender: TObject);
    procedure DelActExecute(Sender: TObject);
    procedure SelectActExecute(Sender: TObject);
    procedure RefreshActExecute(Sender: TObject);
    procedure ShifrDataViewDblClick(Sender: TObject);
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
        procedure ShifrDSetCloseOpen;
    end;

implementation

{$R *.dfm}

uses EditShifr, BaseTypes;

{ TfrmSpSigners }

constructor TfrmSpecShifr.Create(AOwner: TComponent; OutPut:TRxMemoryData; DbHandle: TISC_DB_HANDLE; ModeEdit:Integer);
begin
    inherited Create(AOwner);
    Self.Output:=OutPut;
    ShifrDB.Handle := DbHandle;
    ShifrDSetCloseOpen;
    If ModeEdit=0 then
    begin
       btnAdd.Visible:=ivNever;
       btnEdit.Visible:=ivNever;
       btnDel.Visible:=ivNever;
    end;
    cbSearchBox.Properties.Items.Add('Шифр');
    cbSearchBox.Properties.Items.Add('Спеціальність');
    cbSearchBox.ItemIndex:=0;
end;

procedure TfrmSpecShifr.ShifrDSetCloseOpen;
begin
   ShifrDSet.Close;
   ShifrDSet.SelectSQL.Text := 'select * from  SP_SPEC_SHIFR_SEL order by num_shifr collate win1251_ua';
   ShifrDSet.Open;
end;

procedure TfrmSpecShifr.btn3Click(Sender: TObject);
begin
    ModalResult := mrNo;
end;

procedure TfrmSpecShifr.RefreshButtonClick(Sender: TObject);
begin
    ShifrDSetCloseOpen;
end;

procedure TfrmSpecShifr.ExitActExecute(Sender: TObject);
begin
   Close;
end;

procedure TfrmSpecShifr.InsActExecute(Sender: TObject);
var frm: TfrmEditShifr;
    Id: Integer;
begin
    frm := TfrmEditShifr.Create(self);
    frm.Caption:='Додати';
    if frm.ShowModal = mrOk then
    begin
        StorProc.StoredProcName := 'SP_SPEC_SHIFR_INS';
        StorProc.Transaction.StartTransaction;
        StorProc.Prepare;
        StorProc.ParamByName('NUM_SHIFR').AsString := frm.ShifrEdit.Text;
        StorProc.ParamByName('NAME_SPEC').AsString := frm.SpecEdit.Text;
        try
          StorProc.ExecProc;
          Id := StorProc.ParamByName('Ret_Val').AsInteger;
          StorProc.Transaction.Commit;
        except on e:Exception
               do begin
                    agMessageDlg('Увага!', e.Message, mtInformation, [mbOK]);
                    StorProc.Transaction.Rollback;
               end;
        end;
        ShifrDSetCloseOpen;
        ShifrDSet.Locate('Id_Spec_Shifr', Id, []);
    end;
    frm.Free;
end;

procedure TfrmSpecShifr.EditActExecute(Sender: TObject);
var frm: TfrmEditShifr;
    Id: Integer;
begin
    frm := TfrmEditShifr.Create(self);
    frm.Caption:='Змінити';
    frm.ShifrEdit.EditValue := ShifrDSet.FieldByName('Num_Shifr').Value;
    frm.SpecEdit.EditValue := ShifrDSet.FieldByName('Name_Spec').Value;
    if frm.ShowModal = mrOk then
    begin
        StorProc.Transaction.StartTransaction;
        StorProc.StoredProcName := 'SP_SPEC_SHIFR_UPD';
        StorProc.Prepare;
        Id := ShifrDSet['Id_Spec_Shifr'];
        StorProc.ParamByName('ID_SPEC_SHIFR').AsInteger := Id;
        StorProc.ParamByName('NUM_SHIFR').AsString := frm.ShifrEdit.Text;
        StorProc.ParamByName('NAME_SPEC').AsString := frm.SpecEdit.Text;
        try
          StorProc.ExecProc;
          StorProc.Transaction.Commit;
        except on e:Exception
               do begin
                     agMessageDlg('Увага!', e.Message, mtInformation, [mbOK]);
                     StorProc.Transaction.Rollback;
               end;
        end;       
        ShifrDSetCloseOpen;
        ShifrDSet.Locate('Id_Spec_Shifr', Id, []);
    end;
    frm.Free;
end;

procedure TfrmSpecShifr.DelActExecute(Sender: TObject);
begin
    if (ShifrDSet.RecordCount > 0)
        then begin
        if agMessageDlg('Увага!', 'Ви бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo]) = mrYes then
        begin
            StorProc.Transaction.StartTransaction;
            StorProc.StoredProcName := 'SP_SPEC_SHIFR_DEL';
            StorProc.Prepare;
            StorProc.ParamByName('ID_SPEC_SHIFR').Value := ShifrDSet.FieldByName('ID_SPEC_SHIFR').Value;
            StorProc.ExecProc;
            StorProc.Transaction.Commit;
            ShifrDSetCloseOpen;
        end;
    end;
end;

procedure TfrmSpecShifr.SelectActExecute(Sender: TObject);
begin
   If ShifrDSet.IsEmpty then Exit;
   if Output <> nil then
   begin
      Output.Open;
      Output.Append;
      OutPut['Id_Shifr_Spec']:=ShifrDSet['Id_Spec_Shifr'];
      Output['Num_Shifr']:=ShifrDSet['Num_Shifr'];
      Output['Name_Spec']:=ShifrDSet['Name_Spec'];
      OutPut['Name_All']:=+ShifrDSet['Num_Shifr']+' - '+ShifrDSet['Name_Spec'];
      Output.Post;
   end;
   ModalResult:=mrOk;
end;

procedure TfrmSpecShifr.RefreshActExecute(Sender: TObject);
begin
   ShifrDSetCloseOpen;
end;

procedure TfrmSpecShifr.ShifrDataViewDblClick(Sender: TObject);
begin
   if not ShifrDSet.IsEmpty then SelectActExecute(Self);
end;

procedure TfrmSpecShifr.SearchEditPropertiesChange(Sender: TObject);
var FltStr:string;
begin
   if (SearchEdit.Text = '') or (VarIsNull(SearchEdit.Text)) then
   begin
     ShifrDataView.DataController.DataSet.Filtered := False;
   end
   else
   begin
    try
      ShifrDataView.DataController.DataSet.Filtered := False;
      FltStr := 'UPPER('+AnsiUpperCase(FiltersFields[cbSearchBox.ItemIndex])+') LIKE ''' +
            '%'+AnsiUpperCase(SearchEdit.Text) + '%'' and '+FiltersFields[cbSearchBox.ItemIndex]+' is not null';
      ShifrDataView.DataController.DataSet.Filter:=FltStr;
      ShifrDataView.DataController.DataSet.Filtered := True;
      ShifrDataView.DataController.SelectRows(0, 0);
    except on e:exception
           do showmessage(e.message);
    end;
   end;
end;

procedure TfrmSpecShifr.chLocFilterClick(Sender: TObject);
var i:Integer;
begin
   for i:=0 to ShifrDataView.ColumnCount-1 do
       ShifrDataView.Columns[i].Options.Filtering:=chLocFilter.Checked;
end;

procedure TfrmSpecShifr.chPanelGorupClick(Sender: TObject);
begin
   ShifrDataView.OptionsView.GroupByBox:=chPanelGorup.Checked;
end;

end.
