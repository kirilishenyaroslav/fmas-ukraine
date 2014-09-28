unit CopyProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxLabel, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxLookAndFeelPainters, cxButtons, RxMemDS, IB_Externals, FIBDatabase,
  pFIBDatabase, ActnList, dxStatusBar, GlobalSpr, pFIBStoredProc,
  cxProgressBar, ComCtrls;

type
  TfrmCopyProp = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    Panel3: TPanel;
    cxLabel2: TcxLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    applyButton: TcxButton;
    cxButton2: TcxButton;
    cxLabel3: TcxLabel;
    cxAddButton: TcxButton;
    RxMemoryData1: TRxMemoryData;
    DataSource1: TDataSource;
    RxMemoryData1ID_sch: TIntegerField;
    RxMemoryData1SCH_number: TStringField;
    RxMemoryData1SCH_title: TStringField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxDelButton: TcxButton;
    ActionList1: TActionList;
    AddAccount: TAction;
    DelAccount: TAction;
    Esc: TAction;
    dxStatusBar1: TdxStatusBar;
    WriteTransaction: TpFIBTransaction;
    pFIBDatabase1: TpFIBDatabase;
    cxLabel4: TcxLabel;
    Panel4: TPanel;
    ProgressBar1: TProgressBar;
    StaticText1: TStaticText;
    constructor Create(AOwner:TComponent; DBhandle:PVoid; sch:int64; cur_date:TDateTime); reintroduce;
    procedure cxAddButtonClick(Sender: TObject);
    procedure cxDelButtonClick(Sender: TObject);
    procedure AddAccountExecute(Sender: TObject);
    procedure DelAccountExecute(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure applyButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    patten_sch: int64;
    ActualDate: TDateTime;
  end;

var
  frmCopyProp: TfrmCopyProp;


implementation

{$R *.dfm}

constructor TfrmCopyProp.Create(AOwner:TComponent; DBhandle:PVoid; sch:int64; cur_date:TDateTime);
begin
  inherited Create(AOwner);
  pFIBDatabase1.Handle:=DBhandle;
  WriteTransaction.StartTransaction;
  patten_sch:=sch;
  ActualDate:=cur_date;
  Panel4.Visible:=false;
end;

procedure TfrmCopyProp.cxAddButtonClick(Sender: TObject);
var
  RES: variant;
  i,j: integer;
  s:   integer;
  sch: int64;
  fl:  boolean;
  ar:  array of int64;
begin
    RES:=GlobalSpr.GetSch( self, pFIBDatabase1.Handle, fsNormal, ActualDate, DEFAULT_ROOT_ID, 0, 0);
    if (VarArrayDimCount(RES)>0) then
    begin
        for i:=0 to VarArrayHighBound(RES,1) do
        if RES[i][0]<>patten_sch then begin

            rxMemoryData1.First;
            fl:=true;
            for j:=0 to rxMemoryData1.RecordCount-1 do
            begin
                if RxMemoryData1ID_sch.AsInteger=RES[i][0] then fl:=false;
                rxMemoryData1.Next;
            end;
            if fl then
            begin
                        rxMemoryData1.Insert;
                        rxMemoryData1.FieldByName('ID_sch').AsInteger:=RES[i][0];
                        rxMemoryData1.FieldByName('SCH_Number').AsString:=RES[i][3];
                        rxMemoryData1.FieldByName('SCH_Title').AsString:=RES[i][1];
                        rxMemoryData1.Post;
            end;
        end;
    end;
end;

procedure TfrmCopyProp.AddAccountExecute(Sender: TObject);
begin
    cxAddButtonClick(Sender);
end;

procedure TfrmCopyProp.cxDelButtonClick(Sender: TObject);
begin
    if not rxMemoryData1.IsEmpty then rxMemoryData1.Delete;
end;

procedure TfrmCopyProp.DelAccountExecute(Sender: TObject);
begin
    cxDelButtonClick(Sender);
end;

procedure TfrmCopyProp.EscExecute(Sender: TObject);
begin
    Close;
end;

procedure TfrmCopyProp.applyButtonClick(Sender: TObject);
var
    Proc: TpFibStoredProc;
    i:  integer;
begin
    if not rxMemoryData1.IsEmpty then
    begin
        ProgressBar1.Min:=1;
        ProgressBar1.Max:=2*rxMemoryData1.RecordCount;
        Panel4.Visible:=true;
        Panel4.Update;
        StaticText1.Visible:=true;
        rxMemoryData1.First;
        for i:=0 to rxMemoryData1.RecordCount-1 do
        begin
            Proc:=TpFibStoredProc.Create(self);
            Proc.Database:=pFIBDatabase1;
            Proc.Transaction:=WriteTransaction;
            WriteTransaction.StartTransaction;
            Proc.StoredProcName:='PUB_COPY_SCH_PROPERTIES';

            try
            Proc.Prepare;
            Proc.ParamByName('P_ACTUAL_DATE').AsDate:=ActualDate;
            Proc.ParamByName('sch_patten').AsInt64:=patten_sch;
            Proc.ParamByName('sch').AsInt64:=StrToInt64(rxMemoryData1.FieldByName('ID_sch').asString);
            ProgressBar1.StepIt;
            Application.ProcessMessages;
            Proc.ExecProc;
            except on E:Exception do
                begin
                   ShowMessage(E.Message+#13+'Помилка на рахунку з кодом '+RxMemoryData1SCH_number.AsString+#13+RxMemoryData1SCH_title.AsString);
                   WriteTransaction.Rollback;
                   exit;
                end;
            end;
            WriteTransaction.Commit;
            ProgressBar1.StepIt;
            Application.ProcessMessages;
            rxMemoryData1.Next;
        end;
        Panel4.Visible:=false;
    end;
end;


end.
