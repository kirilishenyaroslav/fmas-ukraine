{******************************************************************************}
{               Автоматизированная система «Формирование планов основного      }
{                          производства ГПП «Укрпромводчермет»                 }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{                      Модуль "Добавление документа в план"                    }
{       Добавление и изменение документов плана. Позволяет добавлять документы }
{  на основании существующих, на основании подчиненных, на основании планов по }
{  подраздлениям (для сводного плана); добавлять в создаваемый документ данные }
{  договоров                                                                   }
{                                               ответственный: Андрей Таганский}

unit dt_Doc_Form_Add;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, ActnList, FIBQuery, pFIBQuery, Db, FIBDataSet,
  pFIBDataSet, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxDropDownEdit, cxTL, cxRadioGroup, cxLookAndFeelPainters,
  cxButtons, cxCalendar, cxCheckBox, cxGraphics, cxCustomData, cxStyles,
  cxInplaceContainer, cxMemo, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid;

type
  TPlansRecord = packed record
   _id_Plan   : integer;
   _Name_Plan : string;
  end;

  TDocRecord = packed record
   _id_Plan  : integer;
   _id_Doc   : integer;
   _Name_Doc : string;
   _Date_Doc : TDateTime;
  end;

  TPlansArray = array of TPlansRecord;
  TDocArray  = array of TDocRecord;

  Tdt_Doc_Form_Add1 = class(TForm)
    Label2: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label3: TLabel;
    ActionList1: TActionList;
    ActionExit: TAction;
    Label4: TLabel;
    DataSet: TpFIBDataSet;
    Bevel2: TBevel;
    Label5: TLabel;
    Cost_Unit_Meas: TcxButtonEdit;
    NewCost: TcxCheckBox;
    DocNum: TcxTextEdit;
    Name_Doc: TcxTextEdit;
    DateTimePicker1: TcxDateEdit;
    Button1: TcxButton;
    Button2: TcxButton;
    PopupDoc: TcxPopupEdit;
    RadioGroup: TcxRadioGroup;
    UseContracts: TcxCheckBox;
    Label6: TLabel;
    PopupPlan: TcxPopupEdit;
    DataSource: TDataSource;
    TableView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    Grid: TcxGrid;
    ID_DOC_COLUMN: TcxGridDBColumn;
    ID_TYPE_DOC_COLUMN: TcxGridDBColumn;
    DATE_DOC_COLUMN: TcxGridDBColumn;
    DATE_REG_COLUMN: TcxGridDBColumn;
    NAME_DOC_COLUMN: TcxGridDBColumn;
    ID_UNIT_MEAS_COLUMN: TcxGridDBColumn;
    NAME_UNIT_MEAS_COLUMN: TcxGridDBColumn;
    COEFFICIENT_COLUMN: TcxGridDBColumn;
    IS_SIGNED_COLUMN: TcxGridDBColumn;
    procedure Type_DocButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure DocNumKeyPress(Sender: TObject; var Key: Char);
    procedure Name_DocKeyPress(Sender: TObject; var Key: Char);
    procedure DateTimePicker1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure PopupDocPropertiesPopup(Sender: TObject);
    procedure PopupDocPropertiesCloseUp(Sender: TObject);
    procedure Cost_Unit_MeasPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure TableViewKeyPress(Sender: TObject; var Key: Char);
    procedure TableViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure PopupPlanPropertiesCloseUp(Sender: TObject);
    procedure DepartmentTreeListClick(Sender: TObject);
    procedure PopupPlanPropertiesPopup(Sender: TObject);
  private
    { Private declarations }
  public
   destructor Destroy; override;
  end;

var
  dt_Doc_Form_Add1 : Tdt_Doc_Form_Add1;

  _id_Type_Doc     : integer;
  _Name_Doc        : string;
  _Date_Doc        : TDateTime;
  _id_Sel_Plan     : integer;
  _id_Sel_Doc      : integer;
  _Name_Sel_Plan   : string;
  _Name_Sel_Doc    : string;

  id_unit_meas     : integer;
  Coefficient      : integer;

implementation

uses dt_Type_Doc_Form, tagBaseTypes, tagSys_Options, PlanEditor, DataModule, dt_Plan_Form,
     Variants, fpop_PackageLoader;

{$R *.DFM}

destructor Tdt_Doc_Form_Add1.Destroy;
begin
 dt_Doc_Form_Add1 := nil;
 inherited;
end;

procedure Tdt_Doc_Form_Add1.Type_DocButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
{var
 Opt : TSpravOptions;}
begin
{ opt.canAdd        := True;
 opt.canEdit       := True;
 Opt.canSelect     := True;
 Opt.canDelete     := True;
 Opt.HideButons    := True;

 dt_Type_Doc_Form.Options := Opt;
 Application.CreateForm(Tdt_Type_Doc_Form1, dt_Type_Doc_Form1);
 dt_Type_Doc_Form1.ShowModal;
 if dt_Type_Doc_Form1.ModalResult = mrOk then begin
  Type_Doc.Text := dt_Type_Doc_Form.Name_Type_Doc;
  _id_Type_Doc  := dt_Type_Doc_Form.id_Type_Doc;
 end;

 dt_Type_Doc_Form1.Free;
 dt_Type_Doc_Form1 := nil;{}
end;

procedure Tdt_Doc_Form_Add1.Button1Click(Sender: TObject);
begin
{ if (Type_Doc.Text = '') or (_id_Type_Doc < 0) then begin
  ShowMessage('Ви не обрали тип документу');
  Exit;
 end;}

 if RadioGroup.ItemIndex < 0 then begin
  ShowMessage('Ви не обрали вид документу, що додавати!');
  Exit;
 end;

 if Name_Doc.Text = '' then begin
  ShowMessage('Ви не ввели назву документу');
  Exit;
 end;

 if (RadioGroup.ItemIndex = 1) and (PopupPlan.Text = '') then begin
  ShowMessage('Ви не обрали план, на основі якого створюватиме новий!');
  Exit;
 end;

 if (RadioGroup.ItemIndex = 1) and (PopupDoc.Text = '') then begin
  ShowMessage('Ви не обрали документ, на основі якого створюватиме новий!');
  Exit;
 end;

 if Cost_Unit_Meas.Text = '' then begin
  ShowMessage('Ви не обрали одиницю виміру вартості продукції!');
  Exit;
 end;

 _Name_Doc    := Name_Doc.Text;
 _id_Type_Doc := 1;
 _Date_Doc    := DateTimePicker1.Date;
 ModalResult := mrOk;
end;

procedure Tdt_Doc_Form_Add1.Button2Click(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure Tdt_Doc_Form_Add1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 DataSet.Close;
 Action := caFree;
end;

procedure Tdt_Doc_Form_Add1.FormCreate(Sender: TObject);
begin
 if PlanEditorForm.GridDoc.DataController.RecordCount = 0 then
  DocNum.Text := '1'
 else
  DocNum.Text := IntToStr(PlanEditorForm.GridDoc.DataController.RecordCount + 1);

 Name_Doc.Text        := Name_Doc.Text + DocNum.Text;
 DateTimePicker1.Date := Now;

 IS_SIGNED_COLUMN.DataBinding.ValueTypeClass := TcxIntegerValueType;
end;

procedure Tdt_Doc_Form_Add1.ActionExitExecute(Sender: TObject);
begin
 Button2Click(Sender);
end;

procedure Tdt_Doc_Form_Add1.DocNumKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then Name_Doc.SetFocus;
end;

procedure Tdt_Doc_Form_Add1.Name_DocKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then DateTimePicker1.SetFocus;
end;

procedure Tdt_Doc_Form_Add1.DateTimePicker1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then Button1.SetFocus;
end;

procedure Tdt_Doc_Form_Add1.FormShow(Sender: TObject);
begin
 _Name_Sel_Plan := '';
 _Name_Sel_Doc  := '';

 DataSet.Active := False;
 DataSet.SelectSQL.Text := 'select Short_Name, Coefficient from ini_Unit_Meas where id_Unit_Meas='
 + IntToStr(DEFAULT_COST_UNIT_MEAS);
 DataSet.Active := True;

 Cost_Unit_Meas.Text := DataSet.Fields[0].AsString;
 Coefficient         := DataSet.Fields[1].AsInteger;
 id_unit_meas        := DEFAULT_COST_UNIT_MEAS;

 DataSet.Active := False;

 RadioButton1Click(nil);
end;

procedure Tdt_Doc_Form_Add1.RadioButton1Click(Sender: TObject);
begin
 case RadioGroup.ItemIndex of
 0 :
  begin
   PopupPlan.Text        := '';
   PopupPlan.Enabled     := False;
   PopupDoc.Text         := '';
   PopupDoc.Enabled      := False;
   NewCost.Enabled       := False;
   NewCost.Checked       := False;
   UseContracts.Enabled  := False;
   UseContracts.Checked  := False;
  end;
 1 :
  begin
   PopupPlan.Text        := _Name_Sel_Plan;
   PopupPlan.Enabled     := True;
   PopupDoc.Text         := _Name_Sel_Doc;
   PopupDoc.Enabled      := True;
   NewCost.Enabled       := True;
   NewCost.Checked       := True;
   UseContracts.Enabled  := True;
   UseContracts.Checked  := False;
  end;
 2 :
  begin
   PopupPlan.Text        := '';
   PopupPlan.Enabled     := False;
   PopupDoc.Text         := '';
   PopupDoc.Enabled      := False;
   NewCost.Enabled       := True;
   NewCost.Checked       := True;
   UseContracts.Enabled  := False;
   UseContracts.Checked  := False;
  end;
 3 :
  begin
   TcxRadioButton(RadioGroup.Components[0]).Enabled := False;
   TcxRadioButton(RadioGroup.Components[1]).Enabled := False;

   PopupPlan.Text        := '';
   PopupPlan.Enabled     := False;
   PopupDoc.Text         := '';
   PopupDoc.Enabled      := False;
   NewCost.Enabled       := False;
   NewCost.Checked       := False;
   UseContracts.Enabled  := False;
   UseContracts.Checked  := False;

   TcxRadioButton(RadioGroup.Components[3]).Visible := True;
  end;
 end;
end;

procedure Tdt_Doc_Form_Add1.PopupDocPropertiesPopup(Sender: TObject);
begin
 if (RadioGroup.ItemIndex = 1) and (PopupPlan.Text = '') then begin
  ShowMessage('Ви не обрали план, на основі якого створюватиме новий!');
  PopupDoc.DroppedDown := False;
  Exit;
 end;

 DataSet.Close;
 DataSet.SelectSQL.Text := 'select * from SP_DT_PLAN_DOC_SEL(' + IntToStr(_id_Sel_Plan)
 + ',' + QuotedStr(DateTimeToStr(SYS_MAX_TIMESTAMP)) + ')';
 DataSet.Open;
end;

procedure Tdt_Doc_Form_Add1.PopupDocPropertiesCloseUp(Sender: TObject);
var
 k : integer;
begin
 k := TableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 _id_Sel_Doc   := TableView.DataController.Values[k, 0];
 _Name_Sel_Doc := TableView.DataController.Values[k, 2];
 PopupDoc.Text := _Name_Sel_Doc;

// DataSet.Close;

 if _id_Sel_Plan <> PlanEditorForm.id_Plan then begin
  NewCost.Enabled := False;
  NewCost.Checked := True;
 end
 else begin
  NewCost.Enabled := True;
  NewCost.Checked := True;
 end;
end;

procedure Tdt_Doc_Form_Add1.Cost_Unit_MeasPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o  : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i.Values['DataBase'] := Integer(dm.Database.Handle);
 i.Values['ReadTransaction'] := Integer(dm.ReadTransaction.Handle);
 i.Values['WriteTransaction'] := Integer(dm.WriteTransaction.Handle);
 i.Values['FormStyle'] := fsNormal;
 LoadSprav('FPOP\ini_unit_meas.bpl', Self, i, o);
 if o['ModalResult'] = mrOk then begin
  id_unit_meas        := o.Values['ID_UNIT_MEAS'];
  Cost_Unit_Meas.Text := o.Values['NAME_UNIT_MEAS'];
  Coefficient         := o.Values['KOEF'];
 end;
end;

procedure Tdt_Doc_Form_Add1.TableViewKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = Char(VK_ESCAPE) then begin
  TableView.DataController.FocusedRecordIndex := -1;
  PopupDoc.DroppedDown := False;
 end;
end;

procedure Tdt_Doc_Form_Add1.TableViewCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
 PopupDoc.DroppedDown := False;
end;

procedure Tdt_Doc_Form_Add1.DepartmentTreeListClick(Sender: TObject);
begin
 if dt_Plan_Form1.DepartmentTreeList.FocusedNode = nil then Exit;
 if VarIsNull(dt_Plan_Form1.DepartmentTreeList.FocusedNode.Values[1]) then Exit;

 PopupPlan.DroppedDown := False;
end;

procedure Tdt_Doc_Form_Add1.PopupPlanPropertiesCloseUp(Sender: TObject);
begin
 dt_Plan_Form1.DepartmentTreeList.OnDblClick := dt_Plan_Form1.DepartmentTreeListDblClick;

 if VarIsNull(dt_Plan_Form1.DepartmentTreeList.FocusedNode.Values[1]) then Exit;

 _id_Sel_Plan   := dt_Plan_Form1.DepartmentTreeList.FocusedNode.Values[1];
 _Name_Sel_Plan := dt_Plan_Form1.DepartmentTreeList.FocusedNode.Values[2];

 PopupPlan.Text := _Name_Sel_Plan;

 _id_Sel_Doc    := -1;
 _Name_Sel_Doc  := '';
 PopupDoc.Text  := _Name_Sel_Doc;
end;

procedure Tdt_Doc_Form_Add1.PopupPlanPropertiesPopup(Sender: TObject);
begin
 dt_Plan_Form1.DepartmentTreeList.OnDblClick := DepartmentTreeListClick;
end;

end.
