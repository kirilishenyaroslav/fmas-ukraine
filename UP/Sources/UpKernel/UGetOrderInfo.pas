unit UGetOrderInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit,
  cxTextEdit, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, Ibase,
  cxPropertiesStore;

type
  TfrmGetOrderInfo = class(TForm)
    pnl1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxtxtdtNum: TcxTextEdit;
    OnDateEx1: TcxDateEdit;
    lbl1: TLabel;
    Label1: TLabel;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    ReadDataSet: TpFIBDataSet;
    cxprprtstr1: TcxPropertiesStore;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    procedure GetIdOrder;
  public
    { Public declarations }
    Id_Order:Int64;
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE); reintroduce;
  end;

implementation

uses BaseTypes;

{$R *.dfm}

{ TfrmGetOrderInfo }

constructor TfrmGetOrderInfo.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE);
begin
     inherited Create(AOwner);
     OnDateEx1.Date:=Date;
     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;
end;

procedure TfrmGetOrderInfo.cxButton1Click(Sender: TObject);
begin
     Id_Order:=-1;
     GetIdOrder;

     if Id_Order<>-1
     then ModalResult:=mrYes
     else agShowMessage('Не знайдено наказ по введеним атрибутам!');
end;

procedure TfrmGetOrderInfo.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmGetOrderInfo.GetIdOrder;
begin
     if ReadDataSet.Active then ReadDataSet.Close;
     ReadDataSet.SelectSQL.Text:='SELECT FIRST 1 * FROM UP_DT_ORDERS WHERE NUM_PROJECT='+cxtxtdtNum.Text+' AND DATE_PROJECT='+''''+DateToStr(OnDateEx1.Date)+'''';
     ReadDataSet.Open;
     if ReadDataSet.RecordCount>0
     then begin
               Id_Order:=TFibBCDField(ReadDataSet.FieldByName('ID_ORDER')).AsInt64;
     end;
     ReadDataSet.Close;
end;

end.
