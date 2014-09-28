{******************************************************************************}
{               Автоматизированная система «Формирование планов основного      }
{                          производства ГПП «Укрпромводчермет»                 }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{                       Модуль "Выбор вида добавления"                         }
{   Выбор вида добавления: группы или единицы измерния                         }
{                                               ответственный: Андрей Таганский}

unit ini_Group_UnitM_Unit_Meas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ActnList, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxRadioGroup;

type
  Tini_Group_UnitM_Unit_Meas1 = class(TForm)
    ActionList1: TActionList;
    ActionExit: TAction;
    RadioGroup1: TcxRadioGroup;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
   destructor Destroy; override;
  end;

var
  ini_Group_UnitM_Unit_Meas1 : Tini_Group_UnitM_Unit_Meas1;

implementation

uses ini_Unit_Meas_Form;

{$R *.DFM}

destructor Tini_Group_UnitM_Unit_Meas1.Destroy;
begin
 ini_Group_UnitM_Unit_Meas1 := nil;
 inherited;
end;

procedure Tini_Group_UnitM_Unit_Meas1.Button2Click(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure Tini_Group_UnitM_Unit_Meas1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure Tini_Group_UnitM_Unit_Meas1.FormDestroy(Sender: TObject);
begin
 ini_Group_UnitM_Unit_Meas1 := nil;
end;

procedure Tini_Group_UnitM_Unit_Meas1.ActionExitExecute(Sender: TObject);
begin
 Button2Click(sender);
end;

procedure Tini_Group_UnitM_Unit_Meas1.cxButton1Click(Sender: TObject);
begin
 if RadioGroup1.ItemIndex < 0 then begin
  ShowMessage('Оберіть вид об''єкту, що бажаєте додати');
  Exit;
 end;
 ModalResult := mrOk;
end;

end.
