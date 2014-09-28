unit EditInfl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, ExtCtrls,
  cxDropDownEdit, cxMaskEdit, cxSpinEdit, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, ZTypes, dates, gr_uCommonConsts, gr_uMessage;

type
  TFInflEdit = class(TForm)
    cxlbl1: TcxLabel;
    cxlbl2: TcxLabel;
    EditYear: TcxSpinEdit;
    EditMonth: TcxComboBox;
    Panel1: TPanel;
    ApplyButton: TcxButton;
    Button2: TcxButton;
    actlst1: TActionList;
    act_Apply: TAction;
    act_Cancel: TAction;
    txtIndex: TcxMaskEdit;
    Action1: TAction;
    procedure act_ApplyExecute(Sender: TObject);
    Function DeleteRecord(param: TZInfl_Hand_Param):boolean;
    procedure act_CancelExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    procedure view_form(param:TZInfl_Hand_Param);
    { Private declarations }
  public
    paramloc:TZInfl_Hand_Param;
    constructor create(param:TZInfl_Hand_Param); reintroduce;

    { Public declarations }
  end;

function View_FInflInd(param:TZInfl_Hand_Param):Boolean;


var FInflEdit: TFInflEdit;


implementation

uses UnitDM;
{$R *.dfm}

constructor TFInflEdit.create(param:TZInfl_Hand_Param);
begin
  inherited create(param.Aowner);
  EditMonth.Properties.Items.Text                 := MonthesList_Text[1];
  paramloc:=param;
end;

function View_FInflInd(param:TZInfl_Hand_Param):Boolean;
begin
  if param.fs=zcfsDelete then
      begin
        View_FInflInd:= FInflEdit.DeleteRecord(param);
      end
  else
    begin
      FInflEdit:=TFInflEdit.Create(param);
      FInflEdit.view_form(param);
      if  FInflEdit.ShowModal= mrYes then
        View_FInflInd:=True
      else  View_FInflInd:=False;
      FInflEdit.Free;
    end;
end;

procedure TFInflEdit.view_form(param: TZInfl_Hand_Param);
begin
  case param.fs of
      zcfsInsert:
      begin
        caption:='Додати';
        EditYear.EditValue:=YearMonthFromKodSetup(param.Kod_Setup);
        EditMonth.ItemIndex:=YearMonthFromKodSetup(param.Kod_Setup,False)-1;
        txtIndex.EditValue:=param.Index_infl;

      end;
    zcfsUpdate:
      begin
        caption:='Редагувати';
        EditYear.EditValue:=YearMonthFromKodSetup(param.Kod_Setup);
        EditMonth.itemindex:=YearMonthFromKodSetup(param.Kod_Setup,False)-1;
        txtIndex.EditValue:=param.Index_infl;


        EditYear.Enabled:=False;
        EditMonth.Enabled:=False;
      end;
  end;
end;

procedure TFInflEdit.act_ApplyExecute(Sender: TObject);
begin
  case paramloc.fs of
    zcfsInsert:
      begin
        Dm.pFIBStoredProc1.Transaction.StartTransaction;
        Dm.pFIBStoredProc1.StoredProcName:='Z_INDEX_INFLYACII_I';
        Dm.pFIBStoredProc1.Prepare;
        Dm.pFIBStoredProc1.ParamByName('KOD_SETUP').asinteger:=PeriodToKodSetup(EditYear.EditValue,EditMonth.ItemIndex+1);
        Dm.pFIBStoredProc1.ParamByName('Z_INDEX_INFL').AsFloat:=txtIndex.EditValue;
        Dm.pFIBStoredProc1.ExecProc;
        Dm.pFIBStoredProc1.Transaction.Commit;
      end;
    zcfsUpdate:
      begin
        Dm.pFIBStoredProc1.Transaction.StartTransaction;
        Dm.pFIBStoredProc1.StoredProcName:='Z_INDEX_INFLYACII_U';
        Dm.pFIBStoredProc1.Prepare;
        Dm.pFIBStoredProc1.ParamByName('KOD_SETUP').asinteger:=PeriodToKodSetup(EditYear.EditValue,EditMonth.ItemIndex+1);
        Dm.pFIBStoredProc1.ParamByName('Z_INDEX_INFL').AsFloat:=txtIndex.EditValue;
        Dm.pFIBStoredProc1.ExecProc;
        Dm.pFIBStoredProc1.Transaction.Commit;
      end;
  end;
  ModalResult:=mrYes;
end;

Function TFInflEdit.DeleteRecord(param: TZInfl_Hand_Param):boolean;
begin
  if grShowMessage(Caption_Delete[1],
                  DeleteRecordQuestion_Text[1],mtConfirmation,[mbYes,mbCancel])=mrYes
  then
    begin
      Dm.pFIBStoredProc1.Transaction.StartTransaction;
      Dm.pFIBStoredProc1.StoredProcName:='Z_INDEX_INFLYACII_D';
      Dm.pFIBStoredProc1.Prepare;
      Dm.pFIBStoredProc1.ParamByName('KOD_SETUP').asinteger:=param.KOD_SETUP;
      Dm.pFIBStoredProc1.ExecProc;
      Dm.pFIBStoredProc1.Transaction.Commit;
      DeleteRecord:=True;
    end
  else
    DeleteRecord:=False;
end;
procedure TFInflEdit.act_CancelExecute(Sender: TObject);
begin
    modalresult:=mrCancel;
end;

procedure TFInflEdit.Action1Execute(Sender: TObject);
begin
 if  Button2.Focused then act_CancelExecute(Sender);
 if  ApplyButton.Focused then act_ApplyExecute(Sender);
 if  txtIndex.Focused then ApplyButton.SetFocus;
 if  EditMonth.Focused then txtIndex.SetFocus;
 if  EditYear.Focused then EditMonth.SetFocus;
end;

end.
