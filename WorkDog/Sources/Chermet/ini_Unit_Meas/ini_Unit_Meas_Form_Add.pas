{******************************************************************************}
{               Автоматизированная система «Формирование планов основного      }
{                          производства ГПП «Укрпромводчермет»                 }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{               Модуль "Добавление и изменение единиц измерения"               }
{   Добавление и изменение единиц измерения                                    }
{                                               ответственный: Андрей Таганский}

unit ini_Unit_Meas_Form_Add;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, BaseTypes, ActnList, ExtCtrls, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, cxButtons,
  dogLoaderUnit;

type
  Tini_Unit_Meas_Form_Add1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ActionList1: TActionList;
    ActionExit: TAction;
    Label4: TLabel;
    Bevel1: TBevel;
    Name_Group_UnitM: TcxButtonEdit;
    Name_Unit_Meas: TcxTextEdit;
    Short_Name: TcxTextEdit;
    Coefficient: TcxTextEdit;
    Button1: TcxButton;
    Button2: TcxButton;
    procedure Name_Group_UnitMButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Name_Group_UnitMKeyPress(Sender: TObject; var Key: Char);
    procedure Name_Unit_MeasKeyPress(Sender: TObject; var Key: Char);
    procedure Short_NameKeyPress(Sender: TObject; var Key: Char);
    procedure ActionExitExecute(Sender: TObject);
    procedure CoefficientKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
   id_Group_UnitM : integer;
   destructor Destroy; override;
  end;

var
  ini_Unit_Meas_Form_Add1 : Tini_Unit_Meas_Form_Add1;

implementation

uses ini_Unit_Meas_Form;

{$R *.DFM}

destructor Tini_Unit_Meas_Form_Add1.Destroy;
begin
 ini_Unit_Meas_Form_Add1 := nil;
 inherited;
end;

procedure Tini_Unit_Meas_Form_Add1.Name_Group_UnitMButtonClick(Sender: TObject);
var
 i, o : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i.Values['DataBase'] := Integer((Owner as Tini_unit_meas_Form1).WorkDatabase.Handle);
 i.Values['ReadTransaction'] := Integer((Owner as Tini_unit_meas_Form1).ReadTransaction.Handle);
 i.Values['WriteTransaction'] := Integer((Owner as Tini_unit_meas_Form1).WriteTransaction.Handle);
 i.Values['FormStyle'] := fsNormal;
 LoadSprav('WorkDog\ini_Group_unitM.bpl', Self, i, o);
 if o.Values['ModalResult'] = mrOk then begin
  Name_Group_UnitM.Text := o.Values['name_Group_UnitM'];
  id_Group_UnitM        := o.Values['id_Group_UnitM'];
 end;
end;

procedure Tini_Unit_Meas_Form_Add1.Button1Click(Sender: TObject);
begin
 if Name_Group_UnitM.Text = '' then begin
  ShowMessage('Ви не обрали групу одиниць виміру');
  Exit;
 end;
 if Name_Unit_Meas.Text = 'Ви не ввели назву одиниці виміру' then begin
  ShowMessage('');
  Exit;
 end;
 if Short_Name.Text = '' then begin
  ShowMessage('Ви не ввели стислу назву одиниці виміру');
  Exit;
 end;

 if Coefficient.Text = '' then begin
  ShowMessage('Ви не ввели коефіцієнт одиниці виміру');
  Exit;
 end;

 ModalResult := mrOk;
end;

procedure Tini_Unit_Meas_Form_Add1.Button2Click(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure Tini_Unit_Meas_Form_Add1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure Tini_Unit_Meas_Form_Add1.Name_Group_UnitMKeyPress(
  Sender: TObject; var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  Name_Unit_Meas.SetFocus;
 end;
end;

procedure Tini_Unit_Meas_Form_Add1.Name_Unit_MeasKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  Short_Name.SetFocus;
 end;
end;

procedure Tini_Unit_Meas_Form_Add1.Short_NameKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  Coefficient.SetFocus;
 end;
end;

procedure Tini_Unit_Meas_Form_Add1.ActionExitExecute(Sender: TObject);
begin
 Button2Click(Sender);
end;

procedure Tini_Unit_Meas_Form_Add1.CoefficientKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  Button1.SetFocus;
  Exit;
 end;

 if not (Key in ['0'..'9', #8, #9]) then Key := #0;
end;

end.
