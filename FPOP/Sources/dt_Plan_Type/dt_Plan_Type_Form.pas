{******************************************************************************}
{               Автоматизированная система «Формирование планов основного      }
{                          производства ГПП «Укрпромводчермет»                 }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{                           Модуль "Справочник типов планов"                   }
{   Отображение, добавление, изменение, удаление типов планов                  }
{                                               ответственный: Андрей Таганский}

unit dt_Plan_Type_Form;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolWin, ComCtrls, Db, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, tagBaseTypes, Menus, ActnList, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGridLevel,
  cxGrid, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxTextEdit, FR_DSet, FR_DBSet, FR_Class,
  dxBar, dxBarExtItems;

type
  Tdt_Plan_Type_Form1 = class(TForm)
    DataSet: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    DataSource1: TDataSource;
    PopupMenu: TPopupMenu;
    AddPopup: TMenuItem;
    EditPopup: TMenuItem;
    DelPopup: TMenuItem;
    N4: TMenuItem;
    RefreshPopup: TMenuItem;
    SelectPopup: TMenuItem;
    ActionList: TActionList;
    ActionMod: TAction;
    ActionDel: TAction;
    ActionAdd: TAction;
    ActionSel: TAction;
    ActionRefresh: TAction;
    ActionExit: TAction;
    DBGrid1: TcxGrid;
    DBGrid1Level1: TcxGridLevel;
    TableView: TcxGridDBTableView;
    id_Plan_Type_Column: TcxGridDBColumn;
    NAME_Plan_Type_Column: TcxGridDBColumn;
    Report: TfrReport;
    frDataSet: TfrDBDataSet;
    Query: TpFIBQuery;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    DelButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    PreviewButton: TdxBarLargeButton;
    PrintButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    CloseButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    procedure FormCreate(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddPopupClick(Sender: TObject);
    procedure EditPopupClick(Sender: TObject);
    procedure DelPopupClick(Sender: TObject);
    procedure RefreshPopupClick(Sender: TObject);
    procedure SelectPopupClick(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionModExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionSelExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PreviewButtonClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
   destructor Destroy; override;
   function tagShow(SpravOptions : TSpravOptions) : TResultArray;
  end;

var
  dt_Plan_Type_Form1 : Tdt_Plan_Type_Form1;
  Options               : TSpravOptions;

  implementation

uses DataModule, dt_Plan_Type_Form_Add;

{$R *.DFM}

destructor Tdt_Plan_Type_Form1.Destroy;
begin
 dt_Plan_Type_Form1 := nil;
 inherited;
end;

function Tdt_Plan_Type_Form1.tagShow(SpravOptions : TSpravOptions) : TResultArray;
var
 mr      : integer;
 idVar   : integer;
 TextVar : string;

 Sprav   : Tdt_Plan_Type_Form1;
begin
 if dt_Plan_Type_Form1 <> nil then begin
  if not SpravOptions.isModal then dt_Plan_Type_Form1.Show;
  Exit;
 end;

 Options := SpravOptions;

 SetLength(Result, 0);
 if Options.isModal then begin
  Sprav := Tdt_Plan_Type_Form1.Create(Self);
  mr := Sprav.ShowModal;
  if mr = mrOK then begin
   idVar   := Sprav.DataSet.FieldByName('ID_PLAN_TYPE').asInteger;
   TextVar := Sprav.DataSet.FieldByName('NAME_PLAN_TYPE').asString;

   SetLength(Result, 2);
   
   Result[0] := idVar;
   Result[1] := TextVar;

   Sprav.DataSet.Close;
  end;
 end else begin
  Application.CreateForm(Tdt_Plan_Type_Form1, dt_Plan_Type_Form1);
  dt_Plan_Type_Form1.FormStyle := fsMDIChild;
  dt_Plan_Type_Form1.Show;
 end;
end;

procedure Tdt_Plan_Type_Form1.FormCreate(Sender: TObject);
begin
 if Options.isModal then begin
  BorderStyle := bsSingle;
  BorderIcons := BorderIcons - [biMaximize];
 end
 else begin
  DBGrid1.Align := alClient;
  BorderStyle := bsSizeable;
 end;

 if Options.canAdd then AddButton.Visible := ivAlways else AddButton.Visible := ivNever;
 if Options.canEdit then EditButton.Visible := ivAlways else EditButton.Visible := ivNever;
 if Options.canDelete then DelButton.Visible := ivAlways else DelButton.Visible := ivNever;
 if Options.canSelect then SelectButton.Visible := ivAlways else SelectButton.Visible := ivNever;
 
 BarManager.Bars[0].Visible := not(Options.HideButtons);

 AddPopup.Visible    := Options.canAdd;
 SelectPopup.Visible := Options.canSelect;
 EditPopup.Visible   := Options.canEdit;
 DelPopup.Visible    := Options.canDelete;
end;

procedure Tdt_Plan_Type_Form1.RefreshButtonClick(Sender: TObject);
var
 id_Key : integer;
begin
 id_Key := DataSet['ID_PLAN_TYPE'];

 DataSet.Active := False;
 DataSet.Active := True;

 TableView.DataController.LocateByKey(id_Key);
end;

procedure Tdt_Plan_Type_Form1.CloseButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrCancel;
end;

procedure Tdt_Plan_Type_Form1.AddButtonClick(Sender: TObject);
var
 id_Key : integer;
begin
 if dt_Plan_Type_Form_Add1 <> nil then exit;
 Application.CreateForm(Tdt_Plan_Type_Form_Add1, dt_Plan_Type_Form_Add1);
 dt_Plan_Type_Form_Add1.Caption := 'Додати тип плану';
 dt_Plan_Type_Form_Add1.ShowModal;
 if dt_Plan_Type_Form_Add1.ModalResult = mrOk then begin
  StoredProc.Transaction := dm.WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PROC_DT_PLAN_TYPE_ADD', [dt_Plan_Type_Form_Add1.Name_Plan_Type.Text]);
  id_key := StoredProc.Fields[0].AsInteger;
  StoredProc.Transaction.Commit;

  DataSet.CloseOpen(False);
  TableView.DataController.LocateByKey(id_Key);
 end;
end;

procedure Tdt_Plan_Type_Form1.EditButtonClick(Sender: TObject);
var
 id_Key : integer;
begin
 if DataSet.Fields[0].AsString = '' then Exit;
 if dt_Plan_Type_Form_Add1 <> nil then exit;

 Application.CreateForm(Tdt_Plan_Type_Form_Add1, dt_Plan_Type_Form_Add1);
 dt_Plan_Type_Form_Add1.Caption := 'Змінити тип планів';
 dt_Plan_Type_Form_Add1.Name_Plan_Type.Text := DataSet.Fields[1].AsString;
 dt_Plan_Type_Form_Add1.ShowModal;

 if dt_Plan_Type_Form_Add1.ModalResult = mrOk then begin
  id_Key := DataSet.Fields[0].AsInteger;

  StoredProc.Transaction := dm.WriteTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.ExecProcedure('PROC_DT_PLAN_TYPE_MODIFY', [id_Key,
  dt_Plan_Type_Form_Add1.Name_Plan_Type.Text]);
  StoredProc.Transaction.Commit;

  DataSet.CloseOpen(False);
  TableView.DataController.LocateByKey(id_Key);
 end;
end;

procedure Tdt_Plan_Type_Form1.DelButtonClick(Sender: TObject);
begin
 if DataSet.Fields[0].AsString = '' then Exit;

 Query.Close;
 Query.SQL.Text := 'select id_Plan from dt_Plans where id_Plan_Type='
 + IntToStr(DataSet.Fields[0].AsInteger);
 Query.ExecQuery;

 if Query.RecordCount > 0 then begin
  Query.Close;
  ShowMessage('Неможна видалити цей тип планів оскільки він використовується'
  + ' у довіднику планів основного виробництва!');
  Exit;
 end
 else Query.Close;

 if MessageDlg('Знищення запису', 'Ви дійсно бажаєте знищити цей запис?', mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

 StoredProc.Transaction := dm.WriteTransaction;
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PROC_DT_PLAN_TYPE_DEL', [DataSet.Fields[0].AsInteger]);
 StoredProc.Transaction.Commit;
 RefreshButtonClick(Sender);
end;

procedure Tdt_Plan_Type_Form1.SelectButtonClick(Sender: TObject);
begin
 ModalResult := mrOk;
end;

procedure Tdt_Plan_Type_Form1.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #27 then CloseButtonClick(Sender);
 if (SelectButton.Visible = ivAlways) and (Key = #13) then SelectButtonClick(Sender);
end;

procedure Tdt_Plan_Type_Form1.DBGrid1DblClick(Sender: TObject);
begin
 if SelectButton.Visible = ivAlways then SelectButtonClick(Sender);
end;

procedure Tdt_Plan_Type_Form1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure Tdt_Plan_Type_Form1.AddPopupClick(Sender: TObject);
begin
 AddButtonClick(Sender);
end;

procedure Tdt_Plan_Type_Form1.EditPopupClick(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure Tdt_Plan_Type_Form1.DelPopupClick(Sender: TObject);
begin
 DelButtonClick(Sender);
end;

procedure Tdt_Plan_Type_Form1.RefreshPopupClick(Sender: TObject);
begin
 RefreshButtonClick(Sender);
end;

procedure Tdt_Plan_Type_Form1.SelectPopupClick(Sender: TObject);
begin
 SelectButtonClick(Sender);
end;

procedure Tdt_Plan_Type_Form1.DBGrid1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_F5 then RefreshButtonClick(Sender);
end;

procedure Tdt_Plan_Type_Form1.ActionModExecute(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure Tdt_Plan_Type_Form1.ActionDelExecute(Sender: TObject);
begin
 DelButtonClick(Sender);
end;

procedure Tdt_Plan_Type_Form1.ActionAddExecute(Sender: TObject);
begin
 AddButtonClick(Sender);
end;

procedure Tdt_Plan_Type_Form1.ActionSelExecute(Sender: TObject);
begin
 DBGrid1DblClick(Sender); 
end;

procedure Tdt_Plan_Type_Form1.ActionRefreshExecute(Sender: TObject);
begin
 RefreshButtonClick(Sender);
end;

procedure Tdt_Plan_Type_Form1.ActionExitExecute(Sender: TObject);
begin
 CloseButtonClick(Sender);
end;

procedure Tdt_Plan_Type_Form1.FormShow(Sender: TObject);
begin
 DataSet.Open;
end;

procedure Tdt_Plan_Type_Form1.PreviewButtonClick(Sender: TObject);
begin
 Report.LoadFromFile('Reports\FPOP\dt_Plan_Type.frf');

 Report.ShowReport;
end;

procedure Tdt_Plan_Type_Form1.PrintButtonClick(Sender: TObject);
begin
 Report.LoadFromFile('Reports\FPOP\dt_Plan_Type.frf');

 Report.PrepareReport;
 Report.PrintPreparedReportDlg; 
end;

end.
