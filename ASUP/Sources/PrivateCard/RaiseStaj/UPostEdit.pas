unit UPostEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, StdCtrls, cxButtons, cxRadioGroup,
  cxButtonEdit;

type
  TfrmPostEdit = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label3: TLabel;
    cxLookupComboBox2: TcxLookupComboBox;
    Label1: TLabel;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    PostSpr: TcxButtonEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxRadioButton1Click(Sender: TObject);
    procedure cxRadioButton2Click(Sender: TObject);
    procedure PostSprPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
     Id_Post_Salary:Variant;
    { Public declarations }
  end;

var
  frmPostEdit: TfrmPostEdit;

implementation

uses uUnivSprav, RxMemds, RaiseStajData;

{$R *.dfm}

procedure TfrmPostEdit.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrOk;
end;

procedure TfrmPostEdit.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

procedure TfrmPostEdit.cxRadioButton1Click(Sender: TObject);
begin
     if cxRadioButton1.Checked
     then begin
               cxLookupComboBox2.Enabled:=True;
               PostSpr.Enabled:=false;
     end;
end;

procedure TfrmPostEdit.cxRadioButton2Click(Sender: TObject);
begin
     if cxRadioButton2.Checked
     then begin
               PostSpr.Enabled:=True;
               cxLookupComboBox2.Enabled:=false;
     end;

end;

procedure TfrmPostEdit.PostSprPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Params.FormCaption := 'Довідник типів персонала';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'UP_POST_CONFIG_SELECT';
    Params.Fields := 'Name_Post,Post_Code,SALARY_MIN,SALARY_MAX,ID_POST_SALARY';
    Params.FieldsName := 'Назва,розряд,тип,мін,макс';
    Params.KeyField := 'ID_POST_SALARY';
    Params.ReturnFields := 'Name_Post,ID_POST_SALARY';
    Params.DBHandle := Integer(dm.DB.Handle);
    OutPut := TRxMemoryData.Create(self);
    if GetUnivSprav(Params, OutPut)
        then begin
        Id_Post_Salary:= output['ID_POST_SALARY'];
        PostSpr.Text:=VarToStr(output['Name_Post']);
    end;
end;

end.
