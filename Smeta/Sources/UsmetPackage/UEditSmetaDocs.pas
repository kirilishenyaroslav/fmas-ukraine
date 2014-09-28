unit UEditSmetaDocs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls;

resourcestring
  NumError='Треба ввести номер документа';
  TypeError='Треба ввести тип документа';


type
  TfrmEditSmetaDocs = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Bevel1: TBevel;
    EdNum: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    DocDate: TDateTimePicker;
    cbDocType: TComboBox;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Label3: TLabel;
    Memo1: TMemo;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
     edit_flag : Boolean;
     view_flag : Boolean;
     function IsDataCorrect:Boolean;
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses USmetaDocs;

procedure TfrmEditSmetaDocs.FormShow(Sender: TObject);
begin
     if edit_flag
     then begin
           EdNum.text:=TfrmSDocs(self.owner).DocsDataSet.fieldByName('DATE_NUM').AsString;
           cbDocType.ItemIndex:=TfrmSDocs(self.owner).DocsDataSet.fieldByName('DOC_ACTION').AsInteger;
           Docdate.Date:=TfrmSDocs(self.owner).DocsDataSet.fieldByName('DATE_DOC').AsdateTime;

           if TfrmSDocs(self.owner).DocsDataSet.fieldByName('DOC_STATE').AsInteger=0
           then RadioButton1.Checked :=true;

           if TfrmSDocs(self.owner).DocsDataSet.fieldByName('DOC_STATE').AsInteger=1
           then RadioButton2.checked:=true;

           if TfrmSDocs(self.owner).DocsDataSet.fieldByName('DOC_STATE').AsInteger=2
           then RadioButton3.checked:=true;
     end
     else begin
           DocDate.Date:=date;
     end;
end;

procedure TfrmEditSmetaDocs.Button1Click(Sender: TObject);
begin
    if IsDataCorrect then  ModalResult:=mrYes;
end;

procedure TfrmEditSmetaDocs.Button2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

function TfrmEditSmetaDocs.IsDataCorrect: Boolean;
var Res:Boolean;
begin
    Res:=true;
    if (EdNum.Text='') and Res
    then begin
        ShowMessage(NumError);
        Res:=false;
    end;
    if (cbDocType.ItemIndex=-1) and Res
    then begin
        ShowMessage(TypeError);
        Res:=false;
    end;
    IsDataCorrect:=Res;
end;

end.
