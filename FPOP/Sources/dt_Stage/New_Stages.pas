{******************************************************************************}
{               Автоматизированная система «Формирование планов основного      }
{                          производства ГПП «Укрпромводчермет»                 }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{                   Модуль "Справочник периодов документа плана"               }
{   Отображение, добавление, изменение, удаление периодов документа плана      }
{                                               ответственный: Андрей Таганский}

unit New_Stages;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, ComCtrls, ToolWin, tagBaseTypes,
  ActnList, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxControls, cxGridCustomView, cxGridLevel, cxGrid, cxLookAndFeelPainters,
  cxButtons, cxCalendar, dxBar, dxBarExtItems, cxCheckBox;

type
  TDelRecord = packed record
   _id_Stage : integer;
  end;
  TNew_Stages_Form = class(TForm)
    Panel1: TPanel;
    ActionList: TActionList;
    ActionMod: TAction;
    ActionDel: TAction;
    ActionAdd: TAction;
    ActionExit: TAction;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    StringGridStage: TcxGridTableView;
    Modified_Column: TcxGridColumn;
    id_Stage_Column: TcxGridColumn;
    Date_Beg_Column: TcxGridColumn;
    Date_End_Column: TcxGridColumn;
    Apply_Button: TcxButton;
    Cancel_Button: TcxButton;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    DelButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    procedure FormCreate(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionModExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Apply_ButtonClick(Sender: TObject);
    procedure Cancel_ButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
   destructor Destroy; override;
  end;

var
  New_Stages_Form : TNew_Stages_Form;
  DelArray        : array of TDelRecord;

implementation

uses dt_Stage_Add, PlanEditor, TagLib, DataModule;

var
 Date_Beg : TDate;
 Date_End : TDate;

{$R *.DFM}

destructor TNew_Stages_Form.Destroy;
begin
 New_Stages_Form := nil;
 inherited;
end;

procedure TNew_Stages_Form.FormCreate(Sender: TObject);
begin
 Modified_Column.DataBinding.ValueTypeClass := TcxStringValueType;
 id_Stage_Column.DataBinding.ValueTypeClass := TcxIntegerValueType;
 Date_Beg_Column.DataBinding.ValueTypeClass := TcxDateTimeValueType;
 Date_End_Column.DataBinding.ValueTypeClass := TcxDateTimeValueType;
end;

procedure TNew_Stages_Form.AddButtonClick(Sender: TObject);
begin
 if dt_Stage_Add_Form <> nil then Exit;

 dt_Stage_Add.DateDawnLimit := Date_Beg;
 dt_Stage_Add.DateUpLimit   := Date_End;

 Application.CreateForm(Tdt_Stage_Add_Form, dt_Stage_Add_Form);
 if StringGridStage.DataController.RecordCount = 0 then
  dt_Stage_Add_Form.DateTimePicker1.Date := dt_Stage_Add.DateDawnLimit
 else dt_Stage_Add_Form.DateTimePicker1.Date := StringGridStage.DataController.Values[StringGridStage.DataController.RecordCount - 1, 3] + 1;

 dt_Stage_Add_Form.ShowModal;

 if dt_Stage_Add_Form.ModalResult <> mrOk then Exit;

 StringGridStage.DataController.RecordCount := StringGridStage.DataController.RecordCount + 1;

 StringGridStage.DataController.BeginUpdate;

 StringGridStage.DataController.Values[StringGridStage.DataController.RecordCount - 1, 0] := 'add';
 StringGridStage.DataController.Values[StringGridStage.DataController.RecordCount - 1, 1] := '-1';
 StringGridStage.DataController.Values[StringGridStage.DataController.RecordCount - 1, 2] := dt_Stage_Add_Form.DateTimePicker1.Date;
 StringGridStage.DataController.Values[StringGridStage.DataController.RecordCount - 1, 3] := dt_Stage_Add_Form.DateTimePicker2.Date;

 StringGridStage.DataController.EndUpdate;
end;

procedure TNew_Stages_Form.DelButtonClick(Sender: TObject);
begin
 if StringGridStage.DataController.Values[StringGridStage.DataController.FocusedRowIndex, 0] = '' then Exit;
 if StringGridStage.DataController.Values[StringGridStage.DataController.FocusedRowIndex, 0] <> 'add' then begin
  SetLength(DelArray, Length(DelArray) + 1);
  DelArray[Length(DelArray) - 1]._id_Stage := StringGridStage.DataController.Values[StringGridStage.DataController.FocusedRowIndex, 1];
 end;

 StringGridStage.DataController.DeleteFocused;
end;

procedure TNew_Stages_Form.EditButtonClick(Sender: TObject);
begin
 if StringGridStage.ViewData.Rows[StringGridStage.DataController.FocusedRowIndex] = nil then Exit;
 if dt_Stage_Add_Form <> nil then Exit;

 dt_Stage_Add.DateDawnLimit := Date_Beg;
 dt_Stage_Add.DateUpLimit   := Date_End;

 Application.CreateForm(Tdt_Stage_Add_Form, dt_Stage_Add_Form);
 dt_Stage_Add_Form.DateTimePicker1.Date := StringGridStage.DataController.Values[StringGridStage.DataController.FocusedRowIndex, 2];
 dt_Stage_Add_Form.DateTimePicker2.Date := StringGridStage.DataController.Values[StringGridStage.DataController.FocusedRowIndex, 3];
 dt_Stage_Add_Form.ShowModal;
 if dt_Stage_Add_Form.ModalResult <> mrOk then Exit;

 if StringGridStage.DataController.Values[StringGridStage.DataController.FocusedRowIndex, 0]
  <> 'add' then StringGridStage.DataController.Values[StringGridStage.DataController.FocusedRowIndex, 0] := 'edit';

 StringGridStage.DataController.BeginUpdate;

 StringGridStage.DataController.Values[StringGridStage.DataController.FocusedRowIndex, 2] := dt_Stage_Add_Form.DateTimePicker1.Date;
 StringGridStage.DataController.Values[StringGridStage.DataController.FocusedRowIndex, 3] := dt_Stage_Add_Form.DateTimePicker2.Date;

 StringGridStage.DataController.EndUpdate;
end;

procedure TNew_Stages_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TNew_Stages_Form.ActionModExecute(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure TNew_Stages_Form.ActionDelExecute(Sender: TObject);
begin
 DelButtonClick(Sender);
end;

procedure TNew_Stages_Form.ActionAddExecute(Sender: TObject);
begin
 AddButtonClick(Sender);
end;

procedure TNew_Stages_Form.ActionExitExecute(Sender: TObject);
begin
 Cancel_ButtonClick(Sender);
end;

procedure TNew_Stages_Form.FormShow(Sender: TObject);
var
 i     : integer;

 BegD  : TDate;
 EndD  : TDate;

 Year  : word;
 Month : word;
 Day   : word;
begin
 if StringGridStage.DataController.RecordCount > 0 then Exit;

 Date_Beg := PlanEditorForm.Plan_Date_Beg;
 Date_End := PlanEditorForm.Plan_Date_End;

 BegD := Date_Beg;

 if isItYear(Date_Beg, Date_End) then
  for i := 1 to 4 do begin
   DecodeDate(BegD, Year, Month, Day);
   if Month + 3 > 12 then begin
    Inc(Year);
    Month := Month + 3 - 12;
   end
   else Inc(Month, 3);

   EndD := EncodeDate(Year, Month, Day) - 1;

   StringGridStage.DataController.RecordCount := StringGridStage.DataController.RecordCount + 1;

   StringGridStage.DataController.Values[StringGridStage.DataController.RecordCount - 1, 0] := 'add';
   StringGridStage.DataController.Values[StringGridStage.DataController.RecordCount - 1, 1] := '-1';
   StringGridStage.DataController.Values[StringGridStage.DataController.RecordCount - 1, 2] := BegD;
   StringGridStage.DataController.Values[StringGridStage.DataController.RecordCount - 1, 3] := EndD;

   BegD := EndD + 1;
  end
 else if isItQuarter(Date_Beg, Date_End) then
  for i := 1 to 3 do begin
   DecodeDate(BegD, Year, Month, Day);

   if Month + 1 > 12 then begin
    Inc(Year);
    Month := Month + 1 - 12;
   end
   else Inc(Month);

   EndD := EncodeDate(Year, Month, Day) - 1;

   StringGridStage.DataController.RecordCount := StringGridStage.DataController.RecordCount + 1;

   StringGridStage.DataController.Values[StringGridStage.DataController.RecordCount - 1, 0] := 'add';
   StringGridStage.DataController.Values[StringGridStage.DataController.RecordCount - 1, 1] := '-1';
   StringGridStage.DataController.Values[StringGridStage.DataController.RecordCount - 1, 2] := BegD;
   StringGridStage.DataController.Values[StringGridStage.DataController.RecordCount - 1, 3] := EndD;

   BegD := EndD + 1;
  end;
end;

procedure TNew_Stages_Form.Apply_ButtonClick(Sender: TObject);
begin
 if StringGridStage.DataController.RecordCount = 0 then begin
  ShowMessage('Ви не додали жодного періоду!');
  Exit;
 end;

 ModalResult := mrOk;
end;

procedure TNew_Stages_Form.Cancel_ButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

end.
