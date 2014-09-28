unit uShablonInvVed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxButtonEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, ibase,
  DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, uMatasUtils,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxInplaceContainer, cxTLData,
  cxDBTL, uSpMatSchEx, FIBQuery, pFIBQuery, pFIBStoredProc, cxCurrencyEdit;

type
  TShablonForm = class(TForm)
    cxReport: TcxComboBox;
    lbl1: TLabel;
    lblSch: TLabel;
    cxSchEdit: TcxButtonEdit;
    OkButton: TcxButton;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    ReportDataSet: TpFIBDataSet;
    cxDBTreeList1: TcxDBTreeList;
    StorProc: TpFIBStoredProc;
    ds1: TDataSource;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    ReportDataSetID_SCH: TFIBBCDField;
    ReportDataSetNAME: TFIBStringField;
    ReportDataSetLINKTO: TFIBBCDField;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    procedure FormShow(Sender: TObject);
    procedure cxSchEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure OkButtonClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private

  public
    aReports: Variant;
    ID_SCH:Integer;
    DBHANDLE:TISC_DB_HANDLE;
  end;

var
  ShablonForm: TShablonForm;

implementation

{$R *.dfm}

procedure TShablonForm.FormShow(Sender: TObject);
begin
 WorkDatabase.Close;
 WorkDatabase.Handle:=DBHANDLE;
 LoadReportsTocxComboBox(self, DBHANDLE, 'INV_VED', cxReport, aReports);
 cxReport.ItemIndex:=0;
 ReportDataSet.CloseOpen(False);
end;

procedure TShablonForm.cxSchEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
begin
 Res:=uSpMatSchEx.GetMatSchFull(self, DBHandle, 0, ID_SCH);
 if VarArrayDimCount(Res)>0 then
 begin
   ID_SCH := Res[0];
   cxSchEdit.Text := VarToStr(RES[1]);
 end;
end;

procedure TShablonForm.OkButtonClick(Sender: TObject);
begin
try
 StorProc.Close;
 StorProc.Transaction := WorkTransaction;
 StorProc.Transaction.StartTransaction;
 StorProc.StoredProcName:='MAT_SET_SHABLON';
 StorProc.Prepare;
 StorProc.ParamByName('ID_REPORT').AsInteger:=aReports[cxReport.ItemIndex][0];
 StorProc.ParamByName('ID_SCH').AsInteger:=ID_SCH;
 StorProc.ExecProc;
 StorProc.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  StorProc.Transaction.Rollback;
  exit;
    end;
end;
ReportDataSet.CloseOpen(False);
end;

procedure TShablonForm.cxButton2Click(Sender: TObject);
begin
Close;
end;

procedure TShablonForm.cxButton1Click(Sender: TObject);
begin
 try
 StorProc.Close;
 StorProc.Transaction := WorkTransaction;
 StorProc.Transaction.StartTransaction;
 StorProc.StoredProcName:='MAT_DEL_SHABLON';
 StorProc.Prepare;
 StorProc.ParamByName('ID_SCH').AsInteger:=ReportDataSetID_SCH.AsInteger;
 StorProc.ExecProc;
 StorProc.Transaction.Commit;
except on E : Exception
 do begin
  ShowMessage(E.Message);
  StorProc.Transaction.Rollback;
  exit;
    end;
end;
ReportDataSet.CloseOpen(False);
end;

end.
