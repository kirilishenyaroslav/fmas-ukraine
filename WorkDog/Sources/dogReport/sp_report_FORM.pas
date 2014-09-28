{******************************************************************************}
{*              Автоматизированная система «Учет и анализ договорных          *}
{*                         обязательств ГПП «Укрпромводчермет»                *}
{*              (c) Донецкий национальный университет, 2002-2003              *}
{******************************************************************************}

{                            Модуль "Справочник отчетов"                       }
{ Осуществляет отображение всех отчетов в системе. Позволяет создавать новые   }
{ отчеты и шаблоны, а также запускать существующие.                            }
{                                                 ответственный: Гнибеда Антон }

unit sp_report_FORM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  pFIBDatabase, Buttons, ToolWin, ComCtrls, ExtCtrls, FIBQuery, FIBDataSet,
  pFIBDataSet, pFIBStoredProc, ActnList, Menus, Grids, Db, DBGrids,
  pFIBQuery, StdCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit,
  cxCheckBox, cxDropDownEdit, IB_EXTERNALS, IBase, FIBDatabase;

type
  TFsp_report = class(TForm)
    Panel1: TPanel;
    AddButton: TSpeedButton;
    DelButton: TSpeedButton;
    ModButton: TSpeedButton;
    SelButton: TSpeedButton;
    ExitButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    ActionList1: TActionList;
    Action_Add: TAction;
    Action_Del: TAction;
    Action_Mod: TAction;
    Action_Refresh: TAction;
    Action_Sel: TAction;
    Action_Exit: TAction;
    PopupMenu1: TPopupMenu;
    PM_AddButton: TMenuItem;
    PM_DelButton: TMenuItem;
    PM_ModButton: TMenuItem;
    N4: TMenuItem;
    PM_RefreshButton: TMenuItem;
    N6: TMenuItem;
    PM_SelButton: TMenuItem;
    N11: TMenuItem;
    PM_ExitButton: TMenuItem;
    DataSet: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    DataSource1: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1ID_REPORT: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_REPORT: TcxGridDBColumn;
    cxGrid1DBTableView1ID_TEMPLATE: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_TEMPLATE: TcxGridDBColumn;
    SelDataSet: TpFIBDataSet;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    N1: TMenuItem;
    N2: TMenuItem;
    SpeedButton4: TSpeedButton;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure ModButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure Action_AddExecute(Sender: TObject);
    procedure Action_DelExecute(Sender: TObject);
    procedure Action_ModExecute(Sender: TObject);
    procedure Action_RefreshExecute(Sender: TObject);
    procedure Action_SelExecute(Sender: TObject);
    procedure Action_ExitExecute(Sender: TObject);
    procedure SelButtonClick(Sender: TObject);
    procedure PM_AddButtonClick(Sender: TObject);
    procedure PM_DelButtonClick(Sender: TObject);
    procedure PM_ModButtonClick(Sender: TObject);
    procedure PM_RefreshButtonClick(Sender: TObject);
    procedure PM_SelButtonClick(Sender: TObject);
    procedure PM_ExitButtonClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    fCanSelect      : boolean;
  public
    id_report        : integer;
    procedure CheckButtonsState;
    procedure SelectAll;
    procedure LocateRecord(const id : integer);
  end;
 TReportFormFunc = function(AppHandle : THandle; dm : TDataModule; dbHandle : PVOID; id_report : integer; id_template : integer) : boolean; stdcall;

 TReportColumn = packed record
  name_column : string;
  name_filed  : string;
  type_filed  : string;
  visible     : boolean;
 end;
 TReportData = array of TReportColumn;


var
  Fsp_report: TFsp_report;

  function GetSpr(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle) : variant; stdcall;
  exports GetSpr;


implementation
uses sp_report_FORM_ADD, sp_report_template_FORM_ADD;
{$R *.DFM}

function GetSpr(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; WTrans : TISC_TR_HANDLE; FS : TFormStyle) : variant; stdcall;
var
 frm :TFsp_report;
begin
 frm := TFsp_report.Create(AOwner);
 frm.Database.Handle := DBHandle;
 frm.ReadTransaction.Handle := RTrans;
 frm.WriteTransaction.Handle := WTrans;
 frm.SelectAll;
 frm.Show;
end;

//////////////////////////////////////////////////////////////
// Standard form procedures
//////////////////////////////////////////////////////////////
(*
procedure TFsp_report.Initialize(_Database : tpFIBDatabase; _ReadTransaction : TpFIBTransaction; _WriteTransaction : TpFIBTransaction; const Options : TSPOptions);
begin
 //Assign database and transactions to internal var's
 if _Database         <> NIL then Database         := _Database         else Database         := common_database;
 if _ReadTransaction  <> NIL then ReadTransaction  := _ReadTransaction  else ReadTransaction  := common_read_transaction;
 if _WriteTransaction <> NIL then WriteTransaction := _WriteTransaction else WriteTransaction := common_write_transaction;
 //Process form options
 fCanSelect := Options.soSel;
 SelButton.Enabled   := Options.soSel;
 AddButton.Enabled   := Options.soAdd;
 DelButton.Enabled   := Options.soDel;
 ModButton.Enabled   := Options.soMod;
 //Assign database and transactions to data access components
 StoredProc.Database    := Database;
 StoredProc.Transaction := WriteTransaction;
 DataSet.Database       := Database;
 DataSet.Transaction    := ReadTransaction;
 //Select all records from table
 SelectAll;
end;
*)
procedure TFsp_report.SelectAll;
begin
 DataSet.Active := false;
 DataSet.SQLs.SelectSQL.Text := 'select * from PROC_SP_REPORT_SEL';
 DataSet.Active := true;
 CheckButtonsState;
end;


//////////////////////////////////////////////////////////////
// Button processing procedures
//////////////////////////////////////////////////////////////

//Add record
procedure TFsp_report.AddButtonClick(Sender: TObject);
var
 add_form      : Tfsp_report_form_add;
 mr : integer;
 i  : integer;
 id_report, id_template : integer;
 str : string;
begin
 add_form := Tfsp_report_form_add.Create(Self);
 add_form.Caption := 'Додати звіт';
 mr := add_form.ShowModal;
 if mr = mrOK then begin
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PROC_SP_REPORT_ADD', [add_form.NameEdit.Text, add_form.DLLEdit.Text]);
  StoredProc.Transaction.Commit;
  id_report := StoredProc['ID_REPORT'].AsInteger;

  //Добавляем шаблон по умолчанию
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PROC_SP_REPORT_TEMPLATE_ADD', [id_report, 'Стандартний шаблон']);
  StoredProc.Transaction.Commit;
  id_template := StoredProc['ID_TEMPLATE'].AsInteger;

  //Добавляем колонки
(*  for i := 0 to add_form.cxGrid1TableView1.DataController.RecordCount - 1 do begin
   str := UpperCase(add_form.cxGrid1TableView1.DataController.Values[i, 1]);
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('PROC_SP_REPORT_COLUMNS_ADD', [id_report, add_form.cxGrid1TableView1.DataController.Values[i, 0], str, add_form.cxGrid1TableView1.DataController.Values[i, 2]]);
   StoredProc.Transaction.Commit;
   //Если видима - добавляем в стандартный шаблон
   if add_form.cxGrid1TableView1.DataController.Values[i, 3] = 'True' then begin
    str := UpperCase(add_form.cxGrid1TableView1.DataController.Values[i, 1]);
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('PROC_SP_REPORT_TEMPLATE_DATA_A', [id_template, str]);
    StoredProc.Transaction.Commit;
   end;
  end;*)
  SelectAll;
  cxGrid1DBTableView1.DataController.Search.Locate(0, IntToStr(id_report));
 end;

 add_form.Free;
end;

//Modify record
procedure TFsp_report.ModButtonClick(Sender: TObject);
var
 mod_form      : Tfsp_report_form_add;
 id_report  : integer;
 name_report : string;
 i  : integer;
begin
 if cxGrid1DBTableView1.Controller.FocusedRecord.Level = 1 then begin
  SpeedButton2Click(Self);
  exit;
 end;
 id_report   := DataSet['ID_REPORT'];
 name_report := DataSet['NAME_REPORT'];

 mod_form := Tfsp_report_form_add.Create(Self);
 mod_form.Caption := 'Змінити звіт';
 mod_form.NameEdit.Text := name_report;
 mod_form.DLLEdit.Text := DataSet['NAME_DLL'];
 mod_form.cxGrid1TableView1.Items[1].Options.Editing := false;
 mod_form.cxGrid1TableView1.OptionsData.Appending := false;
 mod_form.cxGrid1TableView1.OptionsData.Deleting := false;
 mod_form.cxGrid1TableView1.OptionsData.Inserting := false;
 mod_form.cxButton1.Visible := false;

 //Получаем все колонки отчета
(* SelDataSet.SQLs.SelectSQL.Text := 'select * from PROC_SP_REPORT_COLUMNS_SEL(' + IntToStr(id_report) + ')';
 SelDataSet.Active := true;
 if SelDataSet.RecordCount <> 0 then begin
  mod_form.cxGrid1TableView1.DataController.RecordCount := 0;
  mod_form.cxGrid1TableView1.Items[3].Visible := false;
  while not SelDataSet.Eof do begin
   mod_form.cxGrid1TableView1.DataController.RecordCount := mod_form.cxGrid1TableView1.DataController.RecordCount + 1;
   i := mod_form.cxGrid1TableView1.DataController.RecordCount - 1;
   mod_form.cxGrid1TableView1.DataController.Values[i, 0] := SelDataSet['NAME_COLUMN'];
   mod_form.cxGrid1TableView1.DataController.Values[i, 1] := SelDataSet['NAME_FIELD'];
   mod_form.cxGrid1TableView1.DataController.Values[i, 2] := SelDataSet['TYPE_COLUMN'];

   SelDataSet.Next;
  end;
 end;
 SelDataSet.Active := false;*)

 if mod_form.ShowModal = mrOK then begin

  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PROC_SP_REPORT_MOD', [id_report, mod_form.NameEdit.Text, mod_form.DLLEdit.Text]);
  StoredProc.Transaction.Commit;

  //Удаляем все колонки для данного отчета
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PROC_SP_REPORT_COLUMNS_DEL', [id_report]);
  StoredProc.Transaction.Commit;

  //И добавляем изменненые
(*  for i := 0 to mod_form.cxGrid1TableView1.DataController.RecordCount - 1 do begin
   StoredProc.Transaction.StartTransaction;
   StoredProc.ExecProcedure('PROC_SP_REPORT_COLUMNS_ADD', [id_report, mod_form.cxGrid1TableView1.DataController.Values[i, 0],  UpperCase(mod_form.cxGrid1TableView1.DataController.Values[i, 1]), mod_form.cxGrid1TableView1.DataController.Values[i, 2]]);
   StoredProc.Transaction.Commit;
  end*);
  SelectAll;
  cxGrid1DBTableView1.DataController.Search.Locate(0, IntToStr(id_report));
 end;

 mod_form.Free;
end;

//Delete record
procedure TFsp_report.DelButtonClick(Sender: TObject);
var
 id_report   : integer;
 id_template : integer;
// i           : integer;
begin
// i := cxGrid1DBTableView1.Controller.FocusedRecord.Index - 1;
// if i < 0 then i := cxGrid1DBTableView1.Controller.FocusedRecord.Index + 1;
 if MessageDlg('Ви дійсно бажаєте видалити запис?', mtConfirmation,  [mbYes, mbNo], 0) = mrNo then exit;

 if cxGrid1DBTableView1.Controller.FocusedRecord.Level = 0 then begin
  id_report := DataSet['ID_REPORT'];
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PROC_SP_REPORT_DEL', [id_report]);
  StoredProc.Transaction.Commit;
 end else begin
  SelDataSet.SQLs.SelectSQL.Text := 'select * from PROC_SP_REPORT_TEMPLATE_COUNT(' + IntToStr(DataSet['ID_REPORT']) + ')';
  SelDataSet.Active := true;
  if SelDataSet['TEMPLATE_COUNT'] = 1 then begin
   ShowMessage('Не можна видалити даний шаблон. Тому що в звіту повинний існувати принаймні один шаблон.');
   SelDataSet.Active := false;
   exit;
  end;
  SelDataSet.Active := false;
 
  id_template := DataSet['ID_TEMPLATE'];
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PROC_SP_REPORT_TEMPLATE_DEL', [id_template]);
  StoredProc.Transaction.Commit;
 end;

 SelectAll;
// cxGrid1DBTableView1.Controller.FocusedRecordIndex := i;
end;

//Refresh dbgrid
procedure TFsp_report.RefreshButtonClick(Sender: TObject);
//var
// id_country : integer;
begin
// if DataSet.RecordCount <> 0 then id_country := DataSet['ID_COUNTRY'] else id_country := -1;
 SelectAll;
// if id_country <> -1 then LocateRecord(id_country);
end;

//Close form
procedure TFsp_report.ExitButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrCancel;
end;

//Select record
procedure TFsp_report.SelButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrOK;
end;

//////////////////////////////////////////////////////////////
// Other procedures(database dependent)
//////////////////////////////////////////////////////////////
procedure TFsp_report.LocateRecord(const id : integer);
begin
 DataSet.Locate('ID_REPORT', id, []);
end;


//////////////////////////////////////////////////////////////
// Other procedures(database independent)
//////////////////////////////////////////////////////////////
procedure TFsp_report.CheckButtonsState;
begin
 if DataSet.RecordCount = 0 then begin
  DelButton.Enabled  := false;
  ModButton.Enabled  := false;
  SelButton.Enabled  := false;

  PM_DelButton.Enabled  := false;
  PM_ModButton.Enabled  := false;
  PM_SelButton.Enabled  := false;
 end else begin
  DelButton.Enabled  := true;
  ModButton.Enabled  := true;
  SelButton.Enabled  := fCanSelect;

  PM_DelButton.Enabled  := true;
  PM_ModButton.Enabled  := true;
  PM_SelButton.Enabled  := fCanSelect
  //Up and Down Buttons checks in DataSet AfterScroll event:  DataSetAfterScroll
 end;
end;

procedure TFsp_report.FormShow(Sender: TObject);
begin
 if id_report <> -1 then begin
  cxGrid1DBTableView1.DataController.Filter.AddItem(Nil, cxGrid1DBTableView1ID_REPORT, foEqual, id_report, '');
  cxGrid1DBTableView1.DataController.Filter.Active := true;
 end;
end;

procedure TFsp_report.DBGridDblClick(Sender: TObject);
begin
 if SelButton.Enabled then SelButtonClick(Self);
end;


//////////////////////////////////////////////////////////////
// Actions procedures
//////////////////////////////////////////////////////////////
procedure TFsp_report.Action_AddExecute(Sender: TObject);
begin
 AddButtonClick(Self);
end;

procedure TFsp_report.Action_DelExecute(Sender: TObject);
begin
 if DelButton.Enabled then DelButtonClick(Self);
end;

procedure TFsp_report.Action_ModExecute(Sender: TObject);
begin
 if ModButton.Enabled then ModButtonClick(Self);
end;

procedure TFsp_report.Action_RefreshExecute(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFsp_report.Action_SelExecute(Sender: TObject);
begin
 if SelButton.Enabled then SelButtonClick(Self);
end;

procedure TFsp_report.Action_ExitExecute(Sender: TObject);
begin
 ExitButtonClick(Self);
end;


//////////////////////////////////////////////////////////////
// Popup menu procedures
//////////////////////////////////////////////////////////////
procedure TFsp_report.PM_AddButtonClick(Sender: TObject);
begin
 AddButtonClick(Self);
end;

procedure TFsp_report.PM_DelButtonClick(Sender: TObject);
begin
 DelButtonClick(Self);
end;

procedure TFsp_report.PM_ModButtonClick(Sender: TObject);
begin
 ModButtonClick(Self);
end;

procedure TFsp_report.PM_RefreshButtonClick(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFsp_report.PM_SelButtonClick(Sender: TObject);
begin
 SelButtonClick(Self);
end;

procedure TFsp_report.PM_ExitButtonClick(Sender: TObject);
begin
 ExitButtonClick(Self);
end;

procedure TFsp_report.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TFsp_report.SpeedButton1Click(Sender: TObject);
var
 add_form  : TFsp_report_template_form_add;
 id_report : integer;
 i         : integer;
 id_template : integer;
 str : string;
begin
 add_form := TFsp_report_template_form_add.Create(Self);
 add_form.Caption := 'Додати шаблон';
 id_report   := DataSet['ID_REPORT'];

 //Получаем все колонки отчета
(* SelDataSet.SQLs.SelectSQL.Text := 'select * from PROC_SP_REPORT_COLUMNS_SEL(' + IntToStr(id_report) + ')';
 SelDataSet.Active := true;
 if SelDataSet.RecordCount <> 0 then begin
  add_form.cxGrid1TableView1.DataController.RecordCount := 0;
  while not SelDataSet.Eof do begin
   add_form.cxGrid1TableView1.DataController.RecordCount := add_form.cxGrid1TableView1.DataController.RecordCount + 1;
   i := add_form.cxGrid1TableView1.DataController.RecordCount - 1;
   add_form.cxGrid1TableView1.DataController.Values[i, 0] := SelDataSet['NAME_COLUMN'];
   add_form.cxGrid1TableView1.DataController.Values[i, 1] := SelDataSet['NAME_FIELD'];
   add_form.cxGrid1TableView1.DataController.Values[i, 2] := 'True';

   SelDataSet.Next;
  end;
 end;
 SelDataSet.Active := false;*)

 if add_form.ShowModal = mrOK then begin
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PROC_SP_REPORT_TEMPLATE_ADD', [id_report, add_form.NameEdit.Text]);
  StoredProc.Transaction.Commit;
  id_template := StoredProc['ID_TEMPLATE'].AsInteger;
  //Добавляем колонки
(*  for i := 0 to add_form.cxGrid1TableView1.DataController.RecordCount - 1 do begin
   //Если видима - добавляем в шаблон
   if add_form.cxGrid1TableView1.DataController.Values[i, 2] = 'True' then begin
    str := UpperCase(add_form.cxGrid1TableView1.DataController.Values[i, 1]);
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('PROC_SP_REPORT_TEMPLATE_DATA_A', [id_template, str]);
    StoredProc.Transaction.Commit;
   end;
  end;*)
  SelectAll;
  cxGrid1DBTableView1.DataController.Search.Locate(2, IntToStr(id_template));
 end;

end;

procedure TFsp_report.SpeedButton2Click(Sender: TObject);
var
 mod_form  : TFsp_report_template_form_add;
 id_report, id_template : integer;
 i : integer;
 str : string;
begin
 id_template := DataSet['ID_TEMPLATE'];
 id_report := DataSet['ID_REPORT'];
 
 mod_form := TFsp_report_template_form_add.Create(Self);
 mod_form.Caption := 'Змінити шаблон';
 mod_form.NameEdit.Text := DataSet['NAME_TEMPLATE'];

 //Получаем все колонки отчета
(* SelDataSet.SQLs.SelectSQL.Text := 'select * from PROC_SP_REPORT_COLUMNS_SEL(' + IntToStr(id_report) + ')';
 SelDataSet.Active := true;
 if SelDataSet.RecordCount <> 0 then begin
  mod_form.cxGrid1TableView1.DataController.RecordCount := 0;
  while not SelDataSet.Eof do begin
   mod_form.cxGrid1TableView1.DataController.RecordCount := mod_form.cxGrid1TableView1.DataController.RecordCount + 1;
   i := mod_form.cxGrid1TableView1.DataController.RecordCount - 1;
   mod_form.cxGrid1TableView1.DataController.Values[i, 0] := SelDataSet['NAME_COLUMN'];
   mod_form.cxGrid1TableView1.DataController.Values[i, 1] := SelDataSet['NAME_FIELD'];
   mod_form.cxGrid1TableView1.DataController.Values[i, 2] := 'True';
   SelDataSet.Next;
  end;
 end;
 SelDataSet.Active := false;
*)
 //Получаем все видимые поля
(* SelDataSet.SQLs.SelectSQL.Text := 'select * from PROC_SP_REPORT_TEMPLATE_DATA_S(' + IntToStr(id_template) + ')';
 SelDataSet.Active := true;
 if (SelDataSet.RecordCount <> 0) and (mod_form.cxGrid1TableView1.DataController.RecordCount <> 0) then while not SelDataSet.Eof do begin
  for i := 0 to mod_form.cxGrid1TableView1.DataController.RecordCount - 1 do if mod_form.cxGrid1TableView1.DataController.Values[i, 1] = SelDataSet['NAME_FIELD'] then begin
   mod_form.cxGrid1TableView1.DataController.Values[i, 2] := 'True';
   SelDataSet.Next;
   continue;
  end else mod_form.cxGrid1TableView1.DataController.Values[i, 2] := 'False';
  SelDataSet.Next;
 end;
 SelDataSet.Active := false;*)

 if mod_form.ShowModal = mrOK then begin

  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PROC_SP_REPORT_TEMPLATE_MOD', [id_template, mod_form.NameEdit.Text]);
  StoredProc.Transaction.Commit;

  //Удаляем колонки
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PROC_SP_REPORT_TEMPLATE_DATA_D', [id_template]);
  StoredProc.Transaction.Commit;

  //Добавляем колонки
(*  for i := 0 to mod_form.cxGrid1TableView1.DataController.RecordCount - 1 do begin
   //Если видима - добавляем в шаблон
   if mod_form.cxGrid1TableView1.DataController.Values[i, 2] = 'True' then begin
    str := UpperCase(mod_form.cxGrid1TableView1.DataController.Values[i, 1]);
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('PROC_SP_REPORT_TEMPLATE_DATA_A', [id_template, str]);
    StoredProc.Transaction.Commit;
   end;
  end;*)

  SelectAll;
  cxGrid1DBTableView1.DataController.Search.Locate(2, IntToStr(id_template));
 end;

end;

procedure TFsp_report.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 if cxGrid1DBTableView1.Controller.FocusedRecord = NIL then exit; 
 if cxGrid1DBTableView1.Controller.FocusedRecord.Level = 0 then begin
  SpeedButton3.Enabled := false;
  n2.Enabled := false;
  SpeedButton4.Enabled := false;
 end else begin
  SpeedButton3.Enabled := true;
  n2.Enabled := true;
  SpeedButton4.Enabled := true;
 end;
end;

procedure TFsp_report.SpeedButton3Click(Sender: TObject);
var
 mod_form  : TFsp_report_template_form_add;
 id_report, id_template : integer;
 i : integer;
 str : string;
begin
 id_template := DataSet['ID_TEMPLATE'];
 id_report := DataSet['ID_REPORT'];
 
 mod_form := TFsp_report_template_form_add.Create(Self);
 mod_form.Caption := 'Додати шаблон на основі існуючого';
 mod_form.NameEdit.Text := DataSet['NAME_TEMPLATE'];

 //Получаем все колонки отчета
(*/\ SelDataSet.SQLs.SelectSQL.Text := 'select * from PROC_SP_REPORT_COLUMNS_SEL(' + IntToStr(id_report) + ')';
 SelDataSet.Active := true;
 if SelDataSet.RecordCount <> 0 then begin
  mod_form.cxGrid1TableView1.DataController.RecordCount := 0;
  while not SelDataSet.Eof do begin
   mod_form.cxGrid1TableView1.DataController.RecordCount := mod_form.cxGrid1TableView1.DataController.RecordCount + 1;
   i := mod_form.cxGrid1TableView1.DataController.RecordCount - 1;
   mod_form.cxGrid1TableView1.DataController.Values[i, 0] := SelDataSet['NAME_COLUMN'];
   mod_form.cxGrid1TableView1.DataController.Values[i, 1] := SelDataSet['NAME_FIELD'];
   mod_form.cxGrid1TableView1.DataController.Values[i, 2] := 'True';
   SelDataSet.Next;
  end;
 end;
 SelDataSet.Active := false;*)

 //Получаем все видимые поля
(* SelDataSet.SQLs.SelectSQL.Text := 'select * from PROC_SP_REPORT_TEMPLATE_DATA_S(' + IntToStr(id_template) + ')';
 SelDataSet.Active := true;
 if (SelDataSet.RecordCount <> 0) and (mod_form.cxGrid1TableView1.DataController.RecordCount <> 0) then while not SelDataSet.Eof do begin
  for i := 0 to mod_form.cxGrid1TableView1.DataController.RecordCount - 1 do if mod_form.cxGrid1TableView1.DataController.Values[i, 1] = SelDataSet['NAME_FIELD'] then begin
   mod_form.cxGrid1TableView1.DataController.Values[i, 2] := 'True';
   SelDataSet.Next;
   continue;
  end else mod_form.cxGrid1TableView1.DataController.Values[i, 2] := 'False';
  SelDataSet.Next;
 end;
 SelDataSet.Active := false;*)

 if mod_form.ShowModal = mrOK then begin
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PROC_SP_REPORT_TEMPLATE_ADD', [id_report, mod_form.NameEdit.Text]);
  StoredProc.Transaction.Commit;
  id_template := StoredProc['ID_TEMPLATE'].AsInteger;
  //Добавляем колонки
(*  for i := 0 to mod_form.cxGrid1TableView1.DataController.RecordCount - 1 do begin
   //Если видима - добавляем в шаблон
   if mod_form.cxGrid1TableView1.DataController.Values[i, 2] = 'True' then begin
    str := UpperCase(mod_form.cxGrid1TableView1.DataController.Values[i, 1]);
    StoredProc.Transaction.StartTransaction;
    StoredProc.ExecProcedure('PROC_SP_REPORT_TEMPLATE_DATA_A', [id_template, str]);
    StoredProc.Transaction.Commit;
   end;
  end;*)
  SelectAll;
  cxGrid1DBTableView1.DataController.Search.Locate(2, IntToStr(id_template));
 end;

end;

procedure TFsp_report.N1Click(Sender: TObject);
begin
 SpeedButton1Click(Self);
end;

procedure TFsp_report.FormCreate(Sender: TObject);
begin
 id_report := -1;
end;

procedure TFsp_report.SpeedButton4Click(Sender: TObject);
var
 report_dll : string;
 ReportFormFunc : TReportFormFunc;
 HLib : THandle;
begin
 report_dll := DataSet['NAME_DLL'];
 if report_dll = '' then exit;
 HLib := 0;
 try
  HLib := LoadLibrary(PChar(ExtractFilePath(Application.ExeName) + 'Reports\' + report_dll));
  if HLib > HINSTANCE_ERROR then begin
   ReportFormFunc := GetProcAddress(HLib, 'ShowReportForm');
   if Assigned(ReportFormFunc) then begin
    ReportFormFunc(Application.Handle, Nil, DataBase.Handle, DataSet['ID_REPORT'], DataSet['ID_TEMPLATE']);
//    ReportFormFunc(Application.Handle, PCHAR(DB_PATH), PCHAR(DB_USER), PCHAR(DB_PASSWORD), DataSet['ID_REPORT'], DataSet['ID_TEMPLATE']);
   end else ShowMessage('У бібліотеці відсутня процедура "ShowReportForm".');
  end else ShowMessage('Бібліотека ' + report_dll + ' не знайдена.');
 finally
  Application.ProcessMessages;
  if HLib > HINSTANCE_ERROR then FreeLibrary(HLib);
 end;
end;

procedure TFsp_report.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
 if cxGrid1DBTableView1.Controller.FocusedRecord.Level = 0 then exit;
 SpeedButton4Click(Self);
end;

end.
