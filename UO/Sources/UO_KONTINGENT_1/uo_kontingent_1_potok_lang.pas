unit uo_kontingent_1_potok_lang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxMaskEdit, cxButtonEdit, uo_kontingent_1_potok,
  ActnList;

type
  Tfmuo_kontingent_1_potok_lang = class(TForm)
    cxButtonEdit1: TcxButtonEdit;
    cxTextEdit1: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ActionList1: TActionList;
    Action1: TAction;
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    myform : Tfmuo_kontingent_1_potok;
    id_lang_ : int64;
  public
    { Public declarations }
  end;
function showlang_kontingent(mform : Tfmuo_kontingent_1_potok; var id_lang : int64; var name, kolvo : string) : boolean;

implementation
uses uPrK_Loader,
     uPrK_Resources;

{$R *.dfm}

function showlang_kontingent(mform : Tfmuo_kontingent_1_potok; var id_lang : int64; var name, kolvo : string):boolean;
var
    T : Tfmuo_kontingent_1_potok_lang;
begin
    T := Tfmuo_kontingent_1_potok_lang.Create(nil);
    T.myform                := mform;
    T.id_lang_              := id_lang;
    T.cxButtonEdit1.Text    := name;
    T.cxTextEdit1.Text      := kolvo;
    if T.ShowModal=mrOk then
    begin
        id_lang    := T.id_lang_;
        kolvo      := T.cxTextEdit1.Text;
        Result     := true;
    end
    else
        Result  := false;
    T.Free
end;

procedure Tfmuo_kontingent_1_potok_lang.cxTextEdit1KeyPress(
  Sender: TObject; var Key: Char);
begin
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then
        Key := Chr(0)
end;

procedure Tfmuo_kontingent_1_potok_lang.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self, myform.DB.Handle, PrK_SP_IN_LANG, fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
        id_lang_           := res[0];
        cxButtonEdit1.Text := VarToStr(res[1]) + '(' + VarToStr(res[2]) + ')';
    end;
end;

procedure Tfmuo_kontingent_1_potok_lang.cxButton2Click(Sender: TObject);
begin
    close;
end;

procedure Tfmuo_kontingent_1_potok_lang.cxButton1Click(Sender: TObject);
begin
    if (id_lang_ > 0) and (cxTextEdit1.Text <> '') then ModalResult := mrOk;
end;

procedure Tfmuo_kontingent_1_potok_lang.Action1Execute(Sender: TObject);
begin
    if (id_lang_ > 0) and (cxTextEdit1.Text <> '') then ModalResult := mrOk;
end;

end.
