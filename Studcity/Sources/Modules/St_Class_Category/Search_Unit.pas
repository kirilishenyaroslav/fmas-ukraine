unit Search_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, st_ConstUnit;

type
  TSearch_Form = class(TForm)
    T_Label: TLabel;
    Naim_Edit: TcxTextEdit;
    Find_Button: TcxButton;
    Cancel_Button: TcxButton;
    procedure Cancel_ButtonClick(Sender: TObject);
    procedure Find_ButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure WMNCHitTest(var M: TWMNCHitTest); message wm_NCHitTest;
    procedure FormIniLanguage();
  public
    PLanguageIndex: byte;
  end;

var
  Search_Form: TSearch_Form;

implementation

{$R *.dfm}

procedure TSearch_Form.FormIniLanguage();
begin
 Caption:=                    st_ConstUnit.st_Search_Name[PLanguageIndex];
 //названия кнопок
 Find_Button.Caption :=       st_ConstUnit.st_FindNow[PLanguageIndex];
 Cancel_Button.Caption :=     st_ConstUnit.st_Cancel[PLanguageIndex];
 T_Label.Caption:=            st_ConstUnit.st_NameLable[PLanguageIndex];
end;

procedure TSearch_Form.WMNCHitTest(var M: TWMNCHitTest);
begin
inherited; { вызов унаследованного обработчика }
if M.Result = htClient then{ Мышь сидит на окне? }
M.Result := htCaption; { Если да - то пусть Windows думает, что мышь на caption bar }
end;

procedure TSearch_Form.Cancel_ButtonClick(Sender: TObject);
begin
close;
end;

procedure TSearch_Form.Find_ButtonClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TSearch_Form.FormShow(Sender: TObject);
begin
FormIniLanguage();
end;

end.
