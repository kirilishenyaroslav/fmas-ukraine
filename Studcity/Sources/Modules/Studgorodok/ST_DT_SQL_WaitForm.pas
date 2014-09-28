//***********************************************************************
//* Проект "Студгородок"                                                *
//* Форма визуализации ожидания выполнения                              *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit ST_DT_SQL_WaitForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, main,
  St_Proc, st_ConstUnit;

type
  TSQL_Wait_Form = class(TForm)
    Zapis_Label: TLabel;
    PleaseWait_Label: TLabel;
    Bevel2: TBevel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public
    Wait_RecordCount: Int64;
  end;

var
  SQL_Wait_Form: TSQL_Wait_Form;

implementation

{$R *.dfm}

procedure TSQL_Wait_Form.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=               St_Proc.cnLanguageIndex;
 //названия кнопок
 Zapis_Label.Caption :=         st_ConstUnit.st_GoingWait[PLanguageIndex];
 //PleaseWait_Label.Caption :=    st_ConstUnit.st_PleaseWait[PLanguageIndex];
end;

procedure TSQL_Wait_Form.FormCreate(Sender: TObject);
begin
Wait_RecordCount:=0;
MainForm.WaitFormHandle :=true;
FormIniLanguage();
end;

procedure TSQL_Wait_Form.FormDestroy(Sender: TObject);
begin
MainForm.WaitFormHandle :=false;
end;

end.
