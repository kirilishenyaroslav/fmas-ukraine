{******************************************************************************}
{               Автоматизированная система «Формирование планов основного      }
{                          производства ГПП «Укрпромводчермет»                 }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{           Модуль "Добавление и изменение типов планов"                       }
{   Добавление и изменение типов планов                                        }
{                                               ответственный: Андрей Таганский}

unit dt_Plan_Type_Form_Add;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ActnList, tagBaseTypes, cxLookAndFeelPainters,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit;

type
  Tdt_Plan_Type_Form_Add1 = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    ActionList1: TActionList;
    ActionExit: TAction;
    Name_Plan_Type: TcxTextEdit;
    ApplyButton: TcxButton;
    Button2: TcxButton;
    procedure ApplyButtonClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Name_Plan_TypeKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionExitExecute(Sender: TObject);
  private
    { Private declarations }
  public
   destructor Destroy; override;
  end;

var
  dt_Plan_Type_Form_Add1 : Tdt_Plan_Type_Form_Add1;
implementation

uses dt_Plan_Type_Form, DataModule;

{$R *.DFM}

destructor Tdt_Plan_Type_Form_Add1.Destroy;
begin
 dt_Plan_Type_Form_Add1 := nil;
 inherited;
end;

procedure Tdt_Plan_Type_Form_Add1.ApplyButtonClick(Sender: TObject);
begin
 if Name_Plan_Type.Text = '' then begin
  ShowMessage('Введить вірно назву групи одиниць виміру');
  Exit;
 end;
 ModalResult := mrOk;
end;

procedure Tdt_Plan_Type_Form_Add1.Button2Click(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure Tdt_Plan_Type_Form_Add1.Name_Plan_TypeKeyPress(
  Sender: TObject; var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  ApplyButton.SetFocus;
 end;
end;

procedure Tdt_Plan_Type_Form_Add1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure Tdt_Plan_Type_Form_Add1.ActionExitExecute(Sender: TObject);
begin
 Button2Click(Sender);
end;

end.

