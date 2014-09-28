unit uAddPlanComand;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
    cxGridCustomView, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxGrid, StdCtrls, Buttons, ExtCtrls, UpComandFactEditForm;

type
    TfrmAddComandPlan = class(TForm)
        Panel1: TPanel;
        btnOk: TSpeedButton;
        btnCancel: TBitBtn;
        cxGridComandPlanDBTableView: TcxGridDBTableView;
        cxGridComandPlanLevel: TcxGridLevel;
        cxGridComandPlan: TcxGrid;
        colNum_Order: TcxGridDBColumn;
        colDate_Order: TcxGridDBColumn;
        colReg_Num: TcxGridDBColumn;
        colDate_Cert: TcxGridDBColumn;
        colName_Post_Full: TcxGridDBColumn;
        colName_Org_Full: TcxGridDBColumn;
        colSm_Title_Full: TcxGridDBColumn;
        colDate_Beg: TcxGridDBColumn;
        colDate_End: TcxGridDBColumn;
        colDays_Count: TcxGridDBColumn;
        colId_Comand_Plan: TcxGridDBColumn;
        procedure btnOkClick(Sender: TObject);
        procedure btnCancelClick(Sender: TObject);
    procedure cxGridComandPlanDBTableViewDblClick(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
    end;

var
    frmAddComandPlan: TfrmAddComandPlan;

implementation

{$R *.dfm}

procedure TfrmAddComandPlan.btnOkClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfrmAddComandPlan.btnCancelClick(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TfrmAddComandPlan.cxGridComandPlanDBTableViewDblClick(
  Sender: TObject);
begin
    ModalResult := mrOk;
end;

end.

