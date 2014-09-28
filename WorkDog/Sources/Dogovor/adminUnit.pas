unit adminUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxContainer, cxEdit, cxLabel, cxControls, cxGroupBox, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, FIBDataSet, pFIBDataSet,
  ExtCtrls, cxTL, ComCtrls, cxCheckBox;

type
  TadminForm = class(TForm)
    cxButton4: TcxButton;
    pFIBDataSet1: TpFIBDataSet;
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    cxGroupBox4: TcxGroupBox;
    cxGrid2: TcxGrid;
    cxGridLevel1: TcxGridLevel;
    cxGrid2TableView1: TcxGridTableView;
    cxGrid2TableView1Column1: TcxGridColumn;
    cxGrid2TableView1Column2: TcxGridColumn;
    cxGrid2TableView1Column3: TcxGridColumn;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    cbClose: TcxCheckBox;
    cxButton8: TcxButton;
    Panel1: TPanel;
    Image1: TImage;
    procedure cxButton4Click(Sender: TObject);
    procedure BlockButtonClick(Sender: TObject);
    procedure UnBlockButtonClick(Sender: TObject);
    procedure SendButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    RefreshTime : Integer;
  end;

var
  adminForm: TadminForm;

implementation
uses DogUnit, DataModule, dogLoaderUnit, LoadDogManedger;
{$R *.dfm}

procedure TadminForm.cxButton4Click(Sender: TObject);
begin
 Close;
end;

procedure TadminForm.BlockButtonClick(Sender: TObject);
begin
// if MessageDlg('Увага!', 'Заблокировать систему?', mtConfirmation, [mbYes, mbNo]) = mrNo then Exit;
// MainForm.DisableApplication(BlockEdit.Text, BlockTimeEdit.Text);
{ MainForm.Color := $aaaaff;
 SendMessage(MainForm.Handle, WM_NCPAINT, 0, 0);
 Application.ProcessMessages;}
end;

procedure TadminForm.UnBlockButtonClick(Sender: TObject);
begin
// MainForm.EnableApplication;
end;

procedure TadminForm.SendButtonClick(Sender: TObject);
begin
// MainForm.BroadcastMessage(MessageEdit.Text);
end;

procedure TadminForm.FormCreate(Sender: TObject);
begin
 cxGrid2TableView1.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid2TableView1.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid2TableView1.Items[2].DataBinding.ValueTypeClass := TcxStringValueType;
 PageControl1.ActivePageIndex := 0;
end;

procedure TadminForm.cxButton3Click(Sender: TObject);
begin
 if MessageDlg('Увага!', 'Закрыть все запущенные приложения договоров?', mtConfirmation, [mbYes, mbNo]) = mrNo then Exit;
// MainForm.CloseAllDogovor;
end;

procedure TadminForm.cxButton5Click(Sender: TObject);
var
 res : Variant;
 i   : Integer;
 k   : integer;
 cnt : integer;
begin
 res := WorkTypeDogSPR(Self, dm.Database.Handle, fsNormal, 'fulfil', nil, SYS_ID_GROUP_DOG_VIEW, nil);
 if VarArrayDimCount(Res) > 0 then
 begin
   cnt := VarArrayHighBound(res, 1);
   k := cxGrid2TableView1.DataController.RecordCount;
   cxGrid2TableView1.DataController.RecordCount := cxGrid2TableView1.DataController.RecordCount + cnt + 1;
   for i := 0 to cnt do
   begin
     cxGrid2TableView1.DataController.Values[k + i, 0] := res[i][0];
     cxGrid2TableView1.DataController.Values[k + i, 1] := res[i][1];
     cxGrid2TableView1.DataController.Values[k + i, 2] := res[i][2];
   end;
 end;
end;

procedure TadminForm.cxButton8Click(Sender: TObject);
var
 i, do_close : Integer;
begin
 if cxGrid2TableView1.DataController.RecordCount = 0 then
 begin
   ShowMessage('Вначале выберите типы по которым необходимо сделать пересчет.');
   Exit;
 end;
 Panel1.Visible := True;
 Application.ProcessMessages;
 if cbClose.Checked then do_close := 1 else do_close := 0;
 for i := 0 to cxGrid2TableView1.DataController.RecordCount - 1 do
 begin
   dm.pFIBStoredProc1.Transaction.StartTransaction;
   dm.pFIBStoredProc1.ExecProcedure('PROC_DOG_DT_DOCUMENT_RECALC_PF', [cxGrid2TableView1.DataController.Values[i, 0], do_close]);
   dm.pFIBStoredProc1.Transaction.Commit;
 end;
 Panel1.Visible := False;
end;

procedure TadminForm.cxButton6Click(Sender: TObject);
begin
 if cxGrid2TableView1.DataController.RecordCount = 0 then Exit;
 cxGrid2TableView1.DataController.DeleteRecord(cxGrid2TableView1.DataController.FocusedRecordIndex);
end;

procedure TadminForm.cxButton7Click(Sender: TObject);
begin
 cxGrid2TableView1.DataController.RecordCount := 0; 
end;

end.
