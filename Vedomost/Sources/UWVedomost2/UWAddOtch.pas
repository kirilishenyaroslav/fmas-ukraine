unit UWAddOtch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxButtonEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxLabel,AArray, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,UWLoaderUnit,
  Mask, ToolEdit, CurrEdit, cxCheckBox, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TFormAddOtch = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    EditNumDog: TEdit;
    cxDateDogEdit: TcxDateEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxGridBudgetDBTableView1: TcxGridDBTableView;
    cxGridBudgetLevel1: TcxGridLevel;
    cxGridBudget: TcxGrid;
    cxGridBudgetDBTableView1DB_ALL_KOD: TcxGridDBColumn;
    cxGridBudgetDBTableView1DB_KEKV_KOD: TcxGridDBColumn;
    cxGridBudgetDBTableView1DB_SUMMA: TcxGridDBColumn;
    LabelPIB: TLabel;
    cxButtonEditTypeViplat: TcxButtonEdit;
    DSetBudget: TpFIBDataSet;
    Database: TpFIBDatabase;
    Trans: TpFIBTransaction;
    DSourceBudget: TDataSource;
    StyleRepository: TcxStyleRepository;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxLabel3: TcxLabel;
    LabelCard: TLabel;
    cxGridBudgeti: TcxGrid;
    cxGridBudgetiTableView1: TcxGridTableView;
    cxGridBudgetiTableView1_ALL_KOD: TcxGridColumn;
    cxGridBudgetiTableView1_KEKV_KOD: TcxGridColumn;
    cxGridBudgetiTableView1_SUMMA: TcxGridColumn;
    cxGridBudgetiLevel1: TcxGridLevel;
    cxGridBudgetiTableView1_ID_ALL_PROV: TcxGridColumn;
    TransWrite: TpFIBTransaction;
    pFIBStoredProc: TpFIBStoredProc;
    cxGridBudgetiTableView1_id_sm: TcxGridColumn;
    cxGridBudgetiTableView1_id_razd: TcxGridColumn;
    cxGridBudgetiTableView1_id_st: TcxGridColumn;
    cxGridBudgetiTableView1_ID_KEKV: TcxGridColumn;
    LabelNumDateDoc: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    LabelTypeDoc: TLabel;
    LabelSummaDoc: TLabel;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButtonEditTypeViplatPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    id_type_viplat : Int64;
    procedure SelectAll;
  end;

var
  FormAddOtch: TFormAddOtch;

implementation

{$R *.dfm}

procedure TFormAddOtch.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormAddOtch.cxButton1Click(Sender: TObject);
var
  i : Integer;
begin
  //сохраняем проводки во временную таблицу
 { TransWrite.DefaultDatabase := Database;
  pFIBStoredProc.Database    := Database;
  pFIBStoredProc.Transaction := TransWrite;

  TransWrite.StartTransaction;
  for i :=0 to cxGridBudgetiTableView1.DataController.RecordCount - 1 do
  begin
    pFIBStoredProc.StoredProcName := 'UW_ADD_VEDOMOST_BUDGET_TMP_INS';
    pFIBStoredProc.ParamByName('ID_DT_DOC').AsInt64   := StrToInt64(DSetAll.fieldbyname('r_id_dt_doc').AsString);
    pFIBStoredProc.ParamByName('key_session').AsInt64 := key_session;
    pFIBStoredProc.ParamByName('id_sm').AsInt64       := cxGridBudgetiTableView1_id_sm.DataBinding.DataController.Values[i, 4];
    pFIBStoredProc.ParamByName('id_razd').AsInt64     := cxGridBudgetiTableView1_id_razd.DataBinding.DataController.Values[i, 5];
    pFIBStoredProc.ParamByName('id_st').AsInt64       := cxGridBudgetiTableView1_id_st.DataBinding.DataController.Values[i, 6];
    pFIBStoredProc.ParamByName('id_kekv').AsInt64     := cxGridBudgetiTableView1_ID_KEKV.DataBinding.DataController.Values[i, 7];
    pFIBStoredProc.ParamByName('summa').value         := cxGridBudgetiTableView1_SUMMA.DataBinding.DataController.Values[i, 8];
    pFIBStoredProc.ExecProc;
  end;
  TransWrite.Commit;  }

  ModalResult := mrok;
end;

procedure TFormAddOtch.cxButtonEditTypeViplatPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UWspTypeViplat.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant      := fsNormal;
    UWLoaderUnit.ShowAllUwBpl(self, InputParam);
    id_type_viplat          := InputParam['OutPut']['ID_SP_TYPE_VIPLAT'].AsInt64;
    if id_type_viplat <> -1 then
    begin
        cxButtonEditTypeViplat.Text := InputParam['OutPut']['NAME_TYPE'].AsString;
    end;
    InputParam.Free;
end;

procedure TFormAddOtch.SelectAll;
var
  i : Integer;
begin
  cxGridBudgetiTableView1.DataController.RecordCount := DSetBudget.RecordCount;
  for i :=0 to cxGridBudgetiTableView1.DataController.RecordCount - 1 do
  begin
    cxGridBudgetiTableView1_ALL_KOD.DataBinding.DataController.Values[i, 0]     := DSetBudget.FBN('ALL_KOD').AsString;
    cxGridBudgetiTableView1_KEKV_KOD.DataBinding.DataController.Values[i, 1]    := DSetBudget.FBN('KEKV_KOD').AsInteger;
    cxGridBudgetiTableView1_SUMMA.DataBinding.DataController.Values[i, 2]       := DSetBudget.FBN('SUMMA').AsFloat;
    cxGridBudgetiTableView1_ID_ALL_PROV.DataBinding.DataController.Values[i, 3] := DSetBudget.FBN('ID_ALL_PROV').AsString;
    cxGridBudgetiTableView1_id_sm.DataBinding.DataController.Values[i, 4]       := DSetBudget.FBN('id_sm').AsInteger;
    cxGridBudgetiTableView1_id_razd.DataBinding.DataController.Values[i, 5]     := DSetBudget.FBN('id_razd').AsInteger;
    cxGridBudgetiTableView1_id_st.DataBinding.DataController.Values[i, 6]       := DSetBudget.FBN('id_st').AsInteger;
    cxGridBudgetiTableView1_ID_KEKV.DataBinding.DataController.Values[i, 7]     := DSetBudget.FBN('ID_KEKV').AsInteger;
    DSetBudget.Next;
  end;
end;

procedure TFormAddOtch.FormCreate(Sender: TObject);
begin
  cxGridBudgetiTableView1_ALL_KOD.DataBinding.ValueTypeClass     := TcxStringValueType;
  cxGridBudgetiTableView1_KEKV_KOD.DataBinding.ValueTypeClass    := TcxIntegerValueType;
  cxGridBudgetiTableView1_SUMMA.DataBinding.ValueTypeClass       := TcxFloatValueType;
  cxGridBudgetiTableView1_ID_ALL_PROV.DataBinding.ValueTypeClass := TcxStringValueType;
  cxGridBudgetiTableView1_id_sm.DataBinding.ValueTypeClass       := TcxIntegerValueType;
  cxGridBudgetiTableView1_id_razd.DataBinding.ValueTypeClass     := TcxIntegerValueType;
  cxGridBudgetiTableView1_id_st.DataBinding.ValueTypeClass       := TcxIntegerValueType;
  cxGridBudgetiTableView1_ID_KEKV.DataBinding.ValueTypeClass     := TcxIntegerValueType;
end;

end.
