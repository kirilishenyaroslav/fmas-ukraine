unit UGetEmptyNomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit,
  cxButtonEdit, StdCtrls, cxRadioGroup, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxContainer, cxMaskEdit, cxDropDownEdit,
  cxCalc, cxButtons, ExtCtrls, FIBDataSet, pFIBDataSet, ActnList,
  pFibDataBase;

type
  TfrmGetEmptyNomer = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    MinValue: TcxCalcEdit;
    MaxValue: TcxCalcEdit;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxGrid4: TcxGrid;
    SmView: TcxGridDBTableView;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    EmptyNumsDataSet: TpFIBDataSet;
    EmptyNumsDataSource: TDataSource;
    cxButton3: TcxButton;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
    LocalUseDB:TpFibDataBase;
    LocalUseTransaction:TpFibTransaction;
  public
    { Public declarations }
    EmptyNomer:Integer;
    procedure GetEmptyNums;
    constructor Create(AOwner:TComponent;UseDB:TpFibDataBase;UseTransaction:TpFibTransaction);reintroduce;
  end;

implementation

{$R *.dfm}

procedure TfrmGetEmptyNomer.cxButton1Click(Sender: TObject);
begin
     if EmptyNumsDataSet.RecordCount>0
     then begin
               EmptyNomer:=EmptyNumsDataSet.FieldByName('EMPTY_NUM').AsInteger;
               ModalResult:=Mryes;
     end;
end;

procedure TfrmGetEmptyNomer.cxButton2Click(Sender: TObject);
begin
     ModalResult:=MrNo;
end;

procedure TfrmGetEmptyNomer.GetEmptyNums;
begin
     if EmptyNumsDataSet.Active
     then EmptyNumsDataSet.Close;
     EmptyNumsDataSet.SelectSQL.Text:='SELECT * FROM BU_GET_EMPTY_NUM('+MinValue.Text+','+MaxValue.Text+')';
     EmptyNumsDataSet.Open;
     EmptyNumsDataSet.FetchAll;
end;

procedure TfrmGetEmptyNomer.FormCreate(Sender: TObject);
begin
     EmptyNumsDataSet.Database      :=LocalUseDb;
     EmptyNumsDataSet.Transaction   :=LocalUseTransaction;
     EmptyNumsDataSet.SelectSQL.Text:='SELECT * FROM BU_GET_EMPTY_NUM('+MinValue.Text+','+MaxValue.Text+')';
     EmptyNumsDataSet.Open;
     EmptyNumsDataSet.FetchAll;
end;

procedure TfrmGetEmptyNomer.cxButton3Click(Sender: TObject);
begin
     GetEmptyNums;
end;

constructor TfrmGetEmptyNomer.Create(AOwner: TComponent;
  UseDB: TpFibDataBase; UseTransaction: TpFibTransaction);
begin
     inherited Create(AOwner);
     LocalUseDB         :=UseDB;
     LocalUseTransaction:=UseTransaction;
end;

end.
