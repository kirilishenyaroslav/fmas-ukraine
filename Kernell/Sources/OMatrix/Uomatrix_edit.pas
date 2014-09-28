unit Uomatrix_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxRadioGroup, cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit;

type
  TfrmMatrixEdit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    EdKrSchNum: TcxTextEdit;
    EdKrSchTitle: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    EdDBSchNum: TcxTextEdit;
    EdDBSchTitle: TcxTextEdit;
    EdCrProv: TRadioGroup;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    cxCheckBox1: TcxCheckBox;
    GroupBox5: TGroupBox;
    EdDbcrdoc: TcxCheckBox;
    edkrcrdoc: TcxCheckBox;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function CheckData:Boolean;
  end;




implementation

{$R *.dfm}
function TfrmMatrixEdit.CheckData:Boolean;
var Res:Boolean;
begin
     Res:=true;

     if (not EdDbcrdoc.Checked) and (EdCrProv.ItemIndex=1) and Res
     then begin
          ShowMessage('Некорректная настройка корреспонденции.');
          Res:=False;
     end;

     if (not EdKrcrdoc.Checked) and (EdCrProv.ItemIndex=0) and Res
     then begin
          ShowMessage('Некорректная настройка корреспонденции.');
          Res:=False;
     end;

     if (not EdDbcrdoc.Checked) and (not EdKrcrdoc.Checked) and Res
     then begin
          ShowMessage('Некорректная настройка корреспонденции.');
          Res:=False;
     end;

     Result:=Res;

end;

procedure TfrmMatrixEdit.cxButton1Click(Sender: TObject);
begin
     if CheckData
     then ModalResult:=mrYes;
end;

procedure TfrmMatrixEdit.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.
