//***********************************************************************
//* Проект "Студгородок"                                                *
//* Просмотр истории прописки                                           *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit Propiska_History;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxCalendar, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxGroupBox, cxTextEdit,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  St_Proc, st_ConstUnit, DataModule1_Unit;

type
  Tfrm_prp_History = class(TForm)
    prp_StyleRepository: TcxStyleRepository;
    prp_Style_Yellow1: TcxStyle;
    prp_Style_Yellow: TcxStyle;
    prp_Style_Blue: TcxStyle;
    prp_Style_Silver: TcxStyle;
    prp_fs_GroupBox: TcxGroupBox;
    prp_History_Grid: TcxGrid;
    prp_History_GridTableView: TcxGridTableView;
    prp_DateBeg_History_Column: TcxGridColumn;
    prp_History_GridLevel: TcxGridLevel;
    prp_fs_GroupBox2: TcxGroupBox;
    prp_history_CancelButton: TcxButton;
    prp_history_OkButton: TcxButton;
    prp_DateEnd_History_Column: TcxGridColumn;
    prp_State_History_Column: TcxGridColumn;
    DeleteHistory_Button: TcxButton;
    WriteProc: TpFIBStoredProc;
    HistoryTransaction: TpFIBTransaction;
    prp_Date_Vyp_History_Column: TcxGridColumn;
    last_history_flag: TcxGridColumn;
    procedure prp_history_CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure prp_history_OkButtonClick(Sender: TObject);
    procedure prp_History_GridTableViewDblClick(Sender: TObject);
    procedure DeleteHistory_ButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    PLanguageIndex: byte;
  public
    prp_History_DeleteExec : boolean;
  end;

var
  frm_prp_History: Tfrm_prp_History;

implementation

uses Propiska;

{$R *.dfm}

procedure Tfrm_prp_History.prp_history_CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure Tfrm_prp_History.FormCreate(Sender: TObject);
begin
with  prp_History_GridTableView
 do begin
 Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
 Items[2].DataBinding.ValueTypeClass := TcxStringValueType;
 Items[3].DataBinding.ValueTypeClass := TcxStringValueType;
 Items[4].DataBinding.ValueTypeClass := TcxStringValueType;
 end;
 prp_History_DeleteExec:=false;
end;

procedure Tfrm_prp_History.FormShow(Sender: TObject);
begin
if prp_History_GridTableView.DataController.RecordCount <> 0 then
   prp_History_GridTableView.DataController.FocusedRecordIndex:=0;

   if prp_History_GridTableView.DataController.RecordCount = 0 then
   prp_history_OkButton.Visible:=false;
end;

procedure Tfrm_prp_History.prp_history_OkButtonClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure Tfrm_prp_History.prp_History_GridTableViewDblClick(
  Sender: TObject);
begin
   if prp_History_GridTableView.DataController.RecordCount = 0 then exit;
ModalResult:=mrOk;
end;

procedure Tfrm_prp_History.DeleteHistory_ButtonClick(Sender: TObject);
begin
if prp_History_GridTableView.DataController.RecordCount = 0 then exit;
 PLanguageIndex:=               St_Proc.cnLanguageIndex;

if MessageBox(Handle,PChar(st_ConstUnit.st_prp_DelHisPart1[PLanguageIndex]
 + #13+
st_ConstUnit.st_prp_DelHisPart2[PLanguageIndex]),'Увага!',MB_YESNO or MB_ICONQUESTION)= mrNo then
exit;

With WriteProc do
  begin
  Transaction.StartTransaction;
  StoredProcName := 'ST_DT_PROPI_HISTORY_DEL_PERIOD';
  Prepare;
  ParamByName('ID_KOD').AsInt64 := frmPropiska.edit_item_id;
  ParamByName('END_PROPIS').AsDate:= strtodate(prp_History_GridTableView.DataController.Values[prp_History_GridTableView.DataController.FocusedRecordIndex, 1]);

  WriteProc.ExecProc;

  try
  prp_History_GridTableView.DataController.DeleteFocused;
  prp_History_GridTableView.DataController.FocusedRowIndex:=prp_History_GridTableView.DataController.RecordCount - 1;
  Transaction.Commit;
  Close;

  if prp_History_GridTableView.DataController.RecordCount <> 0 then begin
    Transaction.StartTransaction;
    StoredProcName := 'ST_DT_PROPI_HISTORY_TO_STATUS';
    Prepare;
    ParamByName('ID_KOD').AsInt64 := frmPropiska.edit_item_id;
    ParamByName('END_PROPIS').AsDate:= strtodate(prp_History_GridTableView.DataController.Values[prp_History_GridTableView.DataController.FocusedRecordIndex, 1]);
    WriteProc.ExecProc;
    Transaction.Commit;
    Close;
  end;
  if prp_History_GridTableView.DataController.RecordCount = 0 then begin
    Transaction.StartTransaction;
    WriteProc.StoredProcName:='ST_DT_PFIO_STATUS_UPDATE';
    WriteProc.Prepare;
    ParamByName('ID_KOD').AsInt64 := frmPropiska.edit_item_id;
    ParamByName('TYPE_PROPI').AsInt64 := 2;
    WriteProc.ExecProc;
    Transaction.Commit;
    Close;
  end;

  except
  Transaction.Rollback;
  close;
  end;
end;

prp_history_OkButton.Visible:=false;
prp_History_DeleteExec:=true;


end;

procedure Tfrm_prp_History.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if prp_History_DeleteExec then ModalResult:=mrOk;
end;

end.
