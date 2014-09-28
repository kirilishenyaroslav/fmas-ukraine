unit SelectForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxMemo, ExtCtrls, DB, ADODB, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TSelect_Form = class(TForm)
    SearchPanel: TPanel;
    SelectBtn: TcxButton;
    cxLookupComboBoxSpec: TcxLookupComboBox;
    Label1: TLabel;
    SPCnOnMS: TADOStoredProc;
    DSCnOnMS: TDataSource;
    procedure SelectBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(aOwner: TComponent; TC: TADOConnection; CaptionLabel,ProcName,ParamName: String; ParamVal: Int64);overload;
  end;

function SelCNid(AOwner:TComponent; TC: TADOConnection; CaptionLabel,ProcName,ParamName: String; ParamVal: Int64):Int64;

implementation

{$R *.dfm}

function SelCNid(AOwner:TComponent; TC: TADOConnection; CaptionLabel,ProcName,ParamName: String; ParamVal: Int64):Int64;
var ViewForm:TSelect_Form;
begin
  ViewForm:=TSelect_Form.Create(AOwner,TC,CaptionLabel,ProcName,ParamName,ParamVal);

  if ViewForm.ShowModal=mrOk then
    if ViewForm.SPCnOnMS.FieldValues['res']<>Null then
      Result:=ViewForm.SPCnOnMS.FieldValues['res']
    else
      Result:=-1;

  ViewForm.Release;
end;

constructor TSelect_Form.Create(AOwner: TComponent; TC: TADOConnection; CaptionLabel,ProcName,ParamName: String; ParamVal: Int64);
begin
  inherited Create(AOwner);

  self.Caption := CaptionLabel;
  self.Label1.Caption := CaptionLabel;

  SPCnOnMS.Connection := TC;

  SPCnOnMS.close;
  SPCnOnMS.ProcedureName := ProcName;
  SPCnOnMS.Parameters.Refresh;
  SPCnOnMS.Parameters.ParamByName(ParamName).Value := ParamVal;
  SPCnOnMS.ExecProc;
  SPCnOnMS.Open;
end;

procedure TSelect_Form.SelectBtnClick(Sender: TObject);
begin

  SPCnOnMS.Locate(cxLookupComboBoxSpec.Properties.ListFieldNames,
                            cxLookupComboBoxSpec.Text,
                            [loCaseInsensitive]);
  ModalResult:=mrOk;
end;

end.
