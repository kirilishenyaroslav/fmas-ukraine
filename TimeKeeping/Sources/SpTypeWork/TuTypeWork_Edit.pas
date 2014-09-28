unit TuTypeWork_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxCheckBox, cxMaskEdit, cxSpinEdit,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, ActnList, StdCtrls,
  cxButtons, ExtCtrls, cxGroupBox, TuCommonTypes,TuMessages,TuCommonProc;
 type TTypeWorkParam=class(TObject)
      Owner:TComponent;
      CFStyle:TTuControlFormStyle;
      KodSetup:variant;
      ID:integer;
 end ;


type
  TFormTypeWork_Edit = class(TForm)
    Panel1: TPanel;
    ButtonYes: TcxButton;
    ButtonCancel: TcxButton;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    cxLabel1: TcxLabel;
    EditName: TcxTextEdit;
    cxGroupBox1: TcxGroupBox;
    CheckBoxPaid: TcxCheckBox;
    CheckBoxVihod: TcxCheckBox;
    EditShorName: TcxTextEdit;
    EditNum: TcxSpinEdit;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(Param:TTypeWorkParam);reintroduce;
  end;

function View_TypeWorkEdit(Param:TTypeWorkParam):Boolean  ;

implementation

uses TuTypeWork_DM;

function View_TypeWorkEdit(Param:TTypeWorkParam):Boolean ;
var Form:TFormTypeWork_Edit;
k,T:Integer;
begin
  Result:=False;
  if Param.CFStyle=tcfsDelete then
  begin
    k:=TuShowMessage(GetConst('Delete','Error'),GetConst('DeleteText','Error'),
                  mtWarning, [mbYes,mbNo]);
    if   k=6 then
    begin
        DM.StProc.Transaction.StartTransaction;
        DM.StProc.StoredProcName:='SP_VIHOD_DELETE';
        DM.StProc.Prepare;
        DM.StProc.ParamByName('ID_VIHOD').asinteger:=DM.DSetMain['ID_VIHOD'];
        DM.StProc.ExecProc;
        DM.StProc.Transaction.Commit;
        Result:=True;
    end;
    Exit;
  end;
  Form:=TFormTypeWork_Edit.Create(Param);
  if Form.ShowModal=mrYes then
  with DM.StProc do
  begin
    Transaction.StartTransaction;
    if Param.CFStyle=tcfsUpdate then
       StoredProcName:='SP_VIHOD_UPDATE'
    else
      StoredProcName:='SP_VIHOD_INSERT';
    Prepare;
    ParamByName('NAME_FULL').AsString:=Form.EditName.text;
    ParamByName('NAME_SHORT').AsString:=Form.EditShorName.text;
    ParamByName('IS_WORK').AsString:=Form.CheckBoxVihod.EditValue;
    ParamByName('IS_PAID').AsString:=Form.CheckBoxPaid.EditValue;
    ParamByName('NAME_NUM').asinteger:=Form.EditNum.Value;
    if Param.CFStyle=tcfsUpdate then   ParamByName('ID_VIHOD').asinteger:=DM.DSetMain['ID_VIHOD'];
    ExecProc;
    if Param.CFStyle=tcfsInsert then Param.ID:=ParamByName('ID').asinteger;
    Transaction.Commit;
    Result:=True;
  end;
end;


{$R *.dfm}

{ TFormTypeWork_Edit }

constructor TFormTypeWork_Edit.Create(Param: TTypeWorkParam);
begin
  inherited create(Param.Owner);
   if Param.CFStyle=tcfsUpdate then
   begin
     EditName.Text:=DM.DSetMain['NAME_FULL'];
     EditShorName.text:=DM.DSetMain['NAME_SHORT'];
     if not VarIsNull(DM.DSetMain['NAME_NUM'] ) then
        EditNum.Value:=DM.DSetMain['NAME_NUM'];
     CheckBoxPaid.EditValue:=DM.DSetMain['IS_PAID'];
     CheckBoxVihod.EditValue:=DM.DSetMain['IS_WORK'];
   end;

end;

procedure TFormTypeWork_Edit.ActionYesExecute(Sender: TObject);
begin
ModalResult:=mrYes;
end;

procedure TFormTypeWork_Edit.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=MrCancel ;
end;

end.
