unit TimeNorm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, dxStatusBar, cxGridLevel, cxControls,
  cxGridCustomView, cxGrid, cxClasses, dxBar, dxBarExtItems, IBase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, TimeNormAdd, cxTextEdit, FIBDatabase;

type
  TfrmYearTimeNorm = class(TForm)
    dxBarManager1: TdxBarManager;
    InsertBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    UPDBtn: TdxBarLargeButton;
    Styles: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxStatusBar1: TdxStatusBar;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    ExitBtn: TdxBarLargeButton;
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    DSource: TDataSource;
    procedure ExitBtnClick(Sender: TObject);
    procedure UPDBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InsertBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(Component:TComponent; HANDLE:TISC_DB_HANDLE);reintroduce;
  end;

var
  frmYearTimeNorm: TfrmYearTimeNorm;

function View_ZYearTimeNorm_Sp( AOwner:TComponent; DB:TISC_DB_HANDLE ):Variant; stdcall;
 exports View_ZYearTimeNorm_Sp;

implementation


{$R *.dfm}

function View_ZYearTimeNorm_Sp( AOwner:TComponent; DB:TISC_DB_HANDLE):Variant;
var
  ViewForm: TfrmYearTimeNorm;
begin
    ViewForm := TfrmYearTimeNorm.Create(AOwner, DB);
    ViewForm.ShowModal;
    ViewForm.Free;
    View_ZYearTimeNorm_Sp:=NULL;
end;

constructor TfrmYearTimeNorm.Create(Component:TComponent; HANDLE:TISC_DB_HANDLE);
begin
    inherited Create(Component);

    DB.Handle := HANDLE;
end;

procedure TfrmYearTimeNorm.ExitBtnClick(Sender: TObject);
begin
    close;
end;

procedure TfrmYearTimeNorm.UPDBtnClick(Sender: TObject);
begin
    DSet.Close;
    DSet.SelectSQL.Text := 'select year_set, tear_time_norm from Z_YEAR_TIME_NORM';
    DSet.Open;
end;

procedure TfrmYearTimeNorm.FormCreate(Sender: TObject);
begin
    DSet.Close;
    DSet.SelectSQL.Text := 'select year_set, tear_time_norm from Z_YEAR_TIME_NORM';
    DSet.Open;
end;

procedure TfrmYearTimeNorm.InsertBtnClick(Sender: TObject);
var
  DS :TpFIBDataSet;
  F  :TfrmTimeNormAdd;
begin
    F := TfrmTimeNormAdd.Create(Self);
    if F.ShowModal=mryes then
    begin
        DS := TpFIBDataSet.Create(self);
        DS.Database:=DB;
        DS.Transaction:=pFIBTransaction1;
        DS.Transaction.StartTransaction;
        DS.SelectSQL.Text:='insert into Z_YEAR_TIME_NORM values ('+F.cxTextEdit1.Text+','+F.cxTextEdit2.Text+')';
        try
            DS.Open;
            except on E : Exception
            do begin
                ShowMessage(E.Message);
                DS.Transaction.Rollback;
                Exit;
            end;
        end;
        DS.Transaction.Commit;
    end;
    UPDBtnClick(Sender);
end;

procedure TfrmYearTimeNorm.UpdateBtnClick(Sender: TObject);
var
  DS :TpFIBDataSet;
  F  :TfrmTimeNormAdd;
begin
    F := TfrmTimeNormAdd.Create(Self);
    F.cxTextEdit1.Text := DSet.FieldByName('YEAR_SET').AsString;
    F.cxTextEdit2.Text := DSet.FieldByName('TEAR_TIME_NORM').AsString;
    if F.ShowModal=mryes then
    begin
        DS := TpFIBDataSet.Create(self);
        DS.Database:=DB;
        DS.Transaction:=pFIBTransaction1;
        DS.SelectSQL.Text:='update Z_YEAR_TIME_NORM set YEAR_SET='+F.cxTextEdit1.Text+', TEAR_TIME_NORM='+F.cxTextEdit2.Text+' where YEAR_SET='+DSet.FieldByName('YEAR_SET').AsString+' and TEAR_TIME_NORM='+DSet.FieldByName('TEAR_TIME_NORM').AsString;
        DS.Transaction.StartTransaction;
        try
            DS.Open;
            except on E : Exception
            do begin
                ShowMessage(E.Message);
                DS.Transaction.Rollback;
                Exit;
            end;
        end;
        DS.Transaction.Commit;
    end;
    UPDBtnClick(Sender);
end;

procedure TfrmYearTimeNorm.DeleteBtnClick(Sender: TObject);
var
  DS :TpFIBDataSet;
begin
    if MessageBox(Self.Handle,'¬и д≥йсно бажаЇте видалити цей запис?  ','”вага!',MB_YESNO)=IDYES then
    begin
        DS := TpFIBDataSet.Create(self);
        DS.Database:=DB;
        DS.Transaction:=pFIBTransaction1;
        DS.SelectSQL.Text:='delete from Z_YEAR_TIME_NORM where year_set='+DSet.fieldbyname('YEAR_SET').AsString+
                                                   ' and tear_time_norm='+DSet.fieldbyname('tear_time_norm').AsString;
        DS.Transaction.StartTransaction;
        try
            DS.Open;
            except on E : Exception
            do begin
                ShowMessage(E.Message);
                DS.Transaction.Rollback;
                Exit;
            end;
        end;
        DS.Transaction.Commit;
    end;
    UPDBtnClick(Sender);

end;

end.
