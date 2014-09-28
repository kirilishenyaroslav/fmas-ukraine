unit USmModifyWay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxRadioGroup, cxSpinEdit, cxTextEdit,
  cxCheckBox, cxMaskEdit, cxButtonEdit, Ibase, FIBDatabase, pFIBDatabase,
  pFibDataSet, pFibStoredProc, cxDropDownEdit, cxCalc;

type
  TfrmSmModifyWay = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxRadioGroup1: TcxRadioGroup;
    Panel2: TPanel;
    Label1: TLabel;
    cxButtonEdit1: TcxButtonEdit;
    cxCheckBox1: TcxCheckBox;
    cxTextEdit1: TcxTextEdit;
    Label6: TLabel;
    Label2: TLabel;
    cxSpinEdit1: TcxSpinEdit;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    Panel3: TPanel;
    cxCalcEdit1: TcxCalcEdit;
    Label3: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
    LocalId_user:Int64;
    BaseIdPlan:Int64;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;id_user:Int64);reintroduce;
  end;


implementation

uses DateUtils, GlobalSpr, basetypes;

{$R *.dfm}

constructor TfrmSmModifyWay.Create(AOwner: TComponent; DbHandle: TISC_DB_HANDLE; id_user: Int64);
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DbHandle;
     ReadTransaction.StartTransaction;
     cxSpinEdit1.Value:=YearOf(Date);
     LocalId_user:=Id_user;
     BaseIdPlan:=-1;
end;

procedure TfrmSmModifyWay.cxButton1Click(Sender: TObject);
var ModifySP:TpFibStoredProc;
begin
     if (BaseIdPlan>0) and (cxCalcEdit1.EditValue<>0)
     then begin
               ModifySP:=TpFibStoredProc.Create(self);
               ModifySP.Database:=WorkDatabase;
               ModifySP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               ModifySP.StoredProcName:='BU_MODIFY_BUDGET';
               ModifySP.Prepare;
               ModifySP.ParamByName('id_base_plan').asInt64:=BaseIdPlan;
               ModifySP.ParamByName('id_user').asInt64:=LocalId_user;
               ModifySP.ParamByName('algoritm').Value:=cxRadioGroup1.ItemIndex;
               ModifySP.ParamByName('modify_value').Value:=cxCalcEdit1.EditValue;
               ModifySP.ParamByName('create_new_budget').Value:=integer(cxCheckBox1.Checked);
               ModifySP.ParamByName('note').Value:=cxTextEdit1.EditValue;
               ModifySP.ParamByName('new_year').Value:=cxSpinEdit1.EditValue;
               ModifySP.ExecProc;
               ModifySP.Close;
               ModifySP.Free;
               WriteTransaction.Commit;
               agShowMessage('Модифікацію бюджету завершено!');

               ModalResult:=mrYes;
     end
     else agShowMessage('Увага! Не задані параметри корегування бюджету!');
end;

procedure TfrmSmModifyWay.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmSmModifyWay.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
    Filter:TSmetaFilterValues;
    GetInfoDataSet:TpFibDataSet;
begin
     Res:=NULL;
     Filter.DateFilter:=false;
     Filter.GroupFilter:=false;
     Filter.NOTEqual:=-1;
     Res:=GlobalSpr.WIZARD_GetPlan(self,
                      WorkDatabase.Handle,
                      fsNormal,
                      Date,
                      Filter,
                      LocalId_user);
     if Res>0
     then begin
               GetInfoDataSet:=TpFibDataSet.Create(self);
               GetInfoDataSet.Database:=WorkDatabase;
               GetInfoDataSet.Transaction:=ReadTransaction;
               GetInfoDataSet.SelectSQL.Text:='SELECT * FROM BU_GET_INFO_BY_PLAN('+VarToStr(Res)+')';
               GetInfoDataSet.Open;
               if (GetInfoDataSet.RecordCount>0)
               then begin
                         cxButtonEdit1.Text:=GetInfoDataSet.FieldByName('RESULT_STRING').AsString;
                         BaseIdPlan:=VarAsType(Res,varInt64);
               end;
               GetInfoDataSet.Close;
               GetInfoDataSet.Free;
     end;
end;

procedure TfrmSmModifyWay.cxCheckBox1PropertiesChange(Sender: TObject);
begin
     cxTextEdit1.Enabled:=cxCheckBox1.Checked;
     cxSpinEdit1.Enabled:=cxCheckBox1.Checked;
     Label2.Enabled:=cxCheckBox1.Checked;
     Label6.Enabled:=cxCheckBox1.Checked;     
end;

end.
