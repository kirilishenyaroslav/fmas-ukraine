unit UpSpSigners;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ComCtrls, ToolWin, ImgList, cxStyles, cxCustomData, cxGraphics,
    cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet,
    pFIBDataSet, cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, cxClasses, Ibase,
    FIBDatabase, pFIBDatabase, pFibStoredProc, rxmemDs, ActnList, dxBar,
  dxBarExtItems, FIBQuery, pFIBQuery;

type
    TfrmSpSigners = class(TForm)
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
        ItemsGrid: TcxGrid;
        ReportDataView: TcxGridDBTableView;
        ReportDataViewDBColumn1: TcxGridDBColumn;
        ReportDataViewDBColumn2: TcxGridDBColumn;
        cxGridLevel5: TcxGridLevel;
        SignersDS: TpFIBDataSet;
        dsSiognersDSet: TDataSource;
        WorkDatabase: TpFIBDatabase;
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
        procedure btn3Click(Sender: TObject);
        procedure RefreshButtonClick(Sender: TObject);
    procedure ExitActExecute(Sender: TObject);
    procedure InsActExecute(Sender: TObject);
    procedure EditActExecute(Sender: TObject);
    procedure DelActExecute(Sender: TObject);
    procedure SelectActExecute(Sender: TObject);
    procedure RefreshActExecute(Sender: TObject);
    procedure ReportDataViewDblClick(Sender: TObject);
    private
    { Private declarations }
        id_type_signer: Integer;
        OutPut:TRxMemoryData;
    public
    { Public declarations }
        signer_fio: string;
        signer_post: string;
        constructor Create(AOwner: TComponent; OutPut:TRxMemoryData; DbHandle: TISC_DB_HANDLE; IdType, ModeEdit:Integer); reintroduce;
        procedure SignersDSetCloseOpen(IdType:Integer);
    end;

implementation

{$R *.dfm}

uses UpEditSigners, BaseTypes;

{ TfrmSpSigners }

constructor TfrmSpSigners.Create(AOwner: TComponent; OutPut:TRxMemoryData; DbHandle: TISC_DB_HANDLE; IdType, ModeEdit:Integer);
begin
    inherited Create(AOwner);
    Self.Output:=OutPut;
    id_type_signer:=IdType;
    WorkDatabase.Handle := DbHandle;
    SignersDSetCloseOpen(6);
    If ModeEdit=0 then
    begin
       btnAdd.Visible:=ivNever;
       btnEdit.Visible:=ivNever;
       btnDel.Visible:=ivNever;
    end;
end;

procedure TfrmSpSigners.SignersDSetCloseOpen(IdType:Integer);
begin
   SignersDS.Close;
   SignersDS.SelectSQL.Text := 'select * from  up_get_text_shablon(' + IntToStr(IdType) + ')';
   SignersDS.Open;
end;

procedure TfrmSpSigners.btn3Click(Sender: TObject);
begin
    ModalResult := mrNo;
end;

procedure TfrmSpSigners.RefreshButtonClick(Sender: TObject);
begin
    SignersDSetCloseOpen(id_type_signer);
end;

procedure TfrmSpSigners.ExitActExecute(Sender: TObject);
begin
   Close;
end;

procedure TfrmSpSigners.InsActExecute(Sender: TObject);
var frm: TfrmEditSignInfo;
    ID_SHABLON: Integer;
begin
    frm := TfrmEditSignInfo.Create(self);
    frm.Caption:='Додати';
    if frm.ShowModal = mrOk then
    begin
        StorProc.StoredProcName := 'UP_DT_TEXT_SHABLONS_INS_UPD';
        StorProc.Transaction.StartTransaction;
        StorProc.Prepare;
        StorProc.ParamByName('ID_SH').Value := null;
        StorProc.ParamByName('TEXT1').AsString := frm.FioText.Text;
        StorProc.ParamByName('TEXT2').AsString := frm.PostText.Text;
        StorProc.ParamByName('ID_SHABLON_TYPE').AsInteger := id_type_signer;
        try
          StorProc.ExecProc;
          ID_SHABLON := StorProc.ParamByName('ID_SHABLON').AsInteger;
          StorProc.Transaction.Commit;
        except on e:Exception
               do begin
                    agMessageDlg('Увага!', e.Message, mtInformation, [mbOK]);
                    StorProc.Transaction.Rollback;
               end;
        end;
        SignersDSetCloseOpen(id_type_signer);
        SignersDS.Locate('ID_SHABLON', ID_SHABLON, []);
    end;
    frm.Free;
end;

procedure TfrmSpSigners.EditActExecute(Sender: TObject);
var frm: TfrmEditSignInfo;
    ID_SHABLON: Integer;
begin
    frm := TfrmEditSignInfo.Create(self);
    frm.Caption:='Змінити';
    frm.FioText.EditValue := SignersDS.FieldByName('TEXT1').Value;
    frm.PostText.EditValue := SignersDS.FieldByName('TEXT2').Value;
    if frm.ShowModal = mrOk then
    begin
        StorProc.Transaction.StartTransaction;
        StorProc.StoredProcName := 'UP_DT_TEXT_SHABLONS_INS_UPD';
        StorProc.Prepare;
        ID_SHABLON := SignersDS['ID_SHABLON'];
        StorProc.ParamByName('ID_SH').AsInteger := ID_SHABLON;
        StorProc.ParamByName('TEXT1').AsString := frm.FioText.Text;
        StorProc.ParamByName('TEXT2').AsString := frm.PostText.Text;
        StorProc.ParamByName('ID_SHABLON_TYPE').AsInteger := id_type_signer;
        try
          StorProc.ExecProc;
          StorProc.Transaction.Commit;
        except on e:Exception
               do begin
                     agMessageDlg('Увага!', e.Message, mtInformation, [mbOK]);
                     StorProc.Transaction.Rollback;
               end;
        end;       
        SignersDSetCloseOpen(id_type_signer);
        SignersDS.Locate('ID_SHABLON', ID_SHABLON, []);
    end;
    frm.Free;
end;

procedure TfrmSpSigners.DelActExecute(Sender: TObject);
begin
    if (SignersDS.RecordCount > 0)
        then begin
        if agMessageDlg('Увага!', 'Ви бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo]) = mrYes then
        begin
            StorProc.Transaction.StartTransaction;
            StorProc.StoredProcName := 'UP_DT_TEXT_SHABLONS_DEL';
            StorProc.Prepare;
            StorProc.ParamByName('ID_SHABLON').Value := SignersDS.FieldByName('ID_SHABLON').Value;
            StorProc.ExecProc;
            StorProc.Transaction.Commit;
            SignersDSetCloseOpen(id_type_signer);
        end;
    end;
end;

procedure TfrmSpSigners.SelectActExecute(Sender: TObject);
begin
   If SignersDS.IsEmpty then Exit;
   if Output <> nil then
   begin
      Output.Open;
      Output.Append;
      OutPut['Id_Shablon']:=SignersDS['Id_Shablon'];
      Output['Name_Fio']:=SignersDS['Text1'];
      Output['Name_Post']:=SignersDS['Text2'];
      Output.Post;
   end;
   ModalResult:=mrOk;
end;

procedure TfrmSpSigners.RefreshActExecute(Sender: TObject);
begin
   SignersDSetCloseOpen(id_type_signer);
end;

procedure TfrmSpSigners.ReportDataViewDblClick(Sender: TObject);
begin
   if not SignersDS.IsEmpty then SelectActExecute(Self);
end;

end.
