unit Jo5_RemnantsInsert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,mainWorkRemnants;

type
  TfmInsert = class(TForm)
    EditComent: TcxTextEdit;
    EditFio: TcxTextEdit;
    cxButton1: TcxButton;
    procedure cxButton1Click(Sender: TObject);


  private
        Coment:string;
  public
     constructor Create(AOwner: TComponent;UserFio:string);reintroduce;

  end;


  function ShowFormInsert(AOwner: TComponent;UserFio:string):variant;
implementation

{$R *.dfm}


function ShowFormInsert(AOwner: TComponent;UserFio:string):variant;
var  fmInsert: TfmInsert;
begin
 fmInsert:=TfmInsert.Create(AOwner,UserFio);
 Result:=fmInsert.ShowModal;
 if Result=mrYes then Result:=fmInsert.Coment
 else Result := NULL;
end;

procedure TfmInsert.cxButton1Click(Sender: TObject);
begin
if EditComent.text<>'' then
begin
  Coment:=EditComent.Text;
  ModalResult:=mrYes;
end
else
  ModalResult:=Null;

end;


constructor TfmInsert.Create(AOwner: TComponent;UserFio:string);
 begin
  inherited Create(AOwner);
  EditFio.Text:=UserFio;

 end;




end.
