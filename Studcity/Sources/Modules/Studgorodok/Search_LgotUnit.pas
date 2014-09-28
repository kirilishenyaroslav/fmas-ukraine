//***********************************************************************
//* Проект "Студгородок"                                                *
//* Форма поиска для справочника льгот                                  *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit Search_LgotUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, cxButtons, cxContainer,
  cxTextEdit, Lgota_Unit;

type
  TSearch_LgotForm = class(TForm)
    Naim_Edit: TcxTextEdit;
    T_Label: TLabel;
    Find_Button: TcxButton;
    Cancel_Button: TcxButton;
    procedure Cancel_ButtonClick(Sender: TObject);
    procedure Find_ButtonClick(Sender: TObject);
    procedure Naim_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
   procedure WMNCHitTest(var M: TWMNCHitTest); message wm_NCHitTest;

  public
    FindFlag, FindClosed : boolean;

  end;

var
  Search_LgotForm: TSearch_LgotForm;

implementation

{$R *.dfm}
procedure TSearch_LgotForm.WMNCHitTest(var M: TWMNCHitTest);
begin
inherited; { вызов унаследованного обработчика }
if M.Result = htClient then{ Мышь сидит на окне? }
M.Result := htCaption; { Если да - то пусть Windows думает, что мышь на caption bar }
end;


procedure TSearch_LgotForm.Cancel_ButtonClick(Sender: TObject);
begin
FindClosed:= true;
close;
end;

procedure TSearch_LgotForm.Find_ButtonClick(Sender: TObject);
begin
FindFlag:=true;
ModalResult:=mrOk;
end;

procedure TSearch_LgotForm.Naim_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key <> #13 then Search_LgotForm.ModalResult:=mrOk;
if key = #13 then FindFlag:= true;
end;

procedure TSearch_LgotForm.FormCreate(Sender: TObject);
begin
FindClosed:= false;
FindFlag:=false;
end;

end.
