unit dt_IntMoving_Plan_Editor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls,
  cxInplaceContainer, cxTextEdit, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  DB, FIBDataSet, pFIBDataSet;

type
  Tdt_IntMoving_Plan_EditorForm = class(TForm)
    TreeList: TcxTreeList;
    id_Object_Column: TcxTreeListColumn;
    id_Dep_Column: TcxTreeListColumn;
    Name_Column: TcxTreeListColumn;
    id_Cat_Cust_Column: TcxTreeListColumn;
    id_Product_Column: TcxTreeListColumn;
    Volume_Column: TcxTreeListColumn;
    Charge_Column: TcxTreeListColumn;
    DateBegEdit: TcxDateEdit;
    DateEndEdit: TcxDateEdit;
    CalcButton: TcxButton;
    DataSet: TpFIBDataSet;
    procedure CalcButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ConstructTreeList;
  end;

var
  dt_IntMoving_Plan_EditorForm: Tdt_IntMoving_Plan_EditorForm;

implementation

uses tagBaseTypes, DataModule, DateUtils;

{$R *.dfm}

procedure Tdt_IntMoving_Plan_EditorForm.CalcButtonClick(Sender: TObject);
begin
 TreeList.Clear;

 if DateBegEdit.Text = '' then begin
  ShowMessage('Уведіть коректно дату початку періоду!');
  Exit;
 end;

 if DateEndEdit.Text = '' then begin
  ShowMessage('Уведіть коректно дату закінчення періоду!');
  Exit;
 end;

 if DateBegEdit.Date > DateEndEdit.Date then begin
  ShowMessage('Дата початку періоду не може бути меншою ніж дата його закінчення!');
  Exit;
 end;

 ConstructTreeList;
end;

procedure Tdt_IntMoving_Plan_EditorForm.ConstructTreeList;
begin
 DataSet.SelectSQL.Text := 'select * from PL_SP_OBJECT_SEL_DEP';
 DataSet.Open;

 while not DataSet.Eof do begin
  with TreeList.Add do begin
   Values[0] := DataSet['ID_DEPARTMENT'];
   Values[4] := DataSet['NAME_SHORT'];
  end;

  DataSet.Next;
 end;

 DataSet.Close;
end;

procedure Tdt_IntMoving_Plan_EditorForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 SetFormParams(Self);
 Action := caFree;
end;

procedure Tdt_IntMoving_Plan_EditorForm.FormShow(Sender: TObject);
begin
 GetFormParams(Self);

 DateBegEdit.Date := StartOfTheMonth(Date);
 DateEndEdit.Date := EndOfTheMonth(Date);
end;

end.
