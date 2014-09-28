unit UGetSmPeriods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  FIBDatabase, pFIBDatabase, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCheckBox,
  FIBDataSet, pFIBDataSet, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid;

type
  TfrmSmPeriods = class(TForm)
    pnl1: TPanel;
    btn1: TcxButton;
    cxButton1: TcxButton;
    WorkDatabase: TpFIBDatabase;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    SilverStyle: TcxStyle;
    cxGrid3: TcxGrid;
    PeriodsView: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    IsDraft: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    GetPeriodsDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    SmPeriodsDataSource: TDataSource;
    procedure btn1Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ResultValue:Variant;
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Int64;id_smeta:Int64);reintroduce;
  end;



implementation

{$R *.dfm}

{ TfrmSmPeriods }

constructor TfrmSmPeriods.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; id_user, id_smeta: Int64);
begin
     inherited Create(AOwner);
     GetPeriodsDataSet.SelectSQL.Text:='SELECT * FROM BU_GET_SM_PERIODS('+IntToStr(id_smeta)+')';
     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;
     GetPeriodsDataSet.Open;
end;

procedure TfrmSmPeriods.btn1Click(Sender: TObject);
begin
     if (GetPeriodsDataSet.RecordCount>0)
     then begin
               ResultValue:=VarArrayCreate([0,1],varVariant);
               ResultValue[0]:= GetPeriodsDataSet.FieldByName('DATE_BEG').value;
               ResultValue[1]:= GetPeriodsDataSet.FieldByName('DATE_END').value;
               ModalResult:=mrYes;
     end;
end;

procedure TfrmSmPeriods.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.
