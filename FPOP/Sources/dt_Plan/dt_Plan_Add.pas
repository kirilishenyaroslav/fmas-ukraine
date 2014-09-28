{******************************************************************************}
{               Автоматизированная система «Формирование планов основного      }
{                          производства ГПП «Укрпромводчермет»                 }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{                      Модуль "Добавление плана"                               }
{       Добавление и изменение годовых и подчиненных планов                    }
{                                               ответственный: Андрей Таганский}

unit dt_Plan_Add;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls,
  ActnList, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxLookAndFeelPainters, cxButtons, cxDropDownEdit,
  cxCalendar, cxMemo, cxRadioGroup;

type
  Tdt_Plan_Add_Form1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel2: TBevel;
    Label4: TLabel;
    ActionList1: TActionList;
    ActionExit: TAction;
    Label5: TLabel;
    Name_Department: TcxButtonEdit;
    PlanKindRadioGroup: TcxRadioGroup;
    LinkToPlanMemo: TcxMemo;
    Name_Plan: TcxMemo;
    Date_Beg: TcxDateEdit;
    Date_End: TcxDateEdit;
    Button1: TcxButton;
    Button2: TcxButton;
    Label6: TLabel;
    Name_Plan_Type: TcxButtonEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Name_PlanKeyPress(Sender: TObject; var Key: Char);
    procedure Date_BegKeyPress(Sender: TObject; var Key: Char);
    procedure Date_EndKeyPress(Sender: TObject; var Key: Char);
    procedure ActionExitExecute(Sender: TObject);
    procedure PlanKindRadioGroupClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Date_BegChange(Sender: TObject);
    procedure Date_EndChange(Sender: TObject);
    procedure Date_BegCloseUp(Sender: TObject);
    procedure Date_EndCloseUp(Sender: TObject);
    procedure Name_DepartmentPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Name_Plan_TypePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
   destructor Destroy; override;
  end;

var
  dt_Plan_Add_Form1 : Tdt_Plan_Add_Form1;
  id_Department     : integer;
  Name_Depart       : string;
  id_Plan_Type      : integer;
  _Date_Beg         : TDate;
  _Date_End         : TDate;
  Link_Name_Plan    : string;
  Link_Name_Depart  : string;
  Link_id_Depart    : integer;
  Link_id_Plan_Type : integer;
  NamePlanType      : string;
  LinkNamePlanType  : string;
  Date_Beg_Limit    : TDate;
  Date_End_Limit    : TDate;

  Edit              : boolean;

implementation

uses datamodule, tagBaseTypes, dt_Plan_Type_Form, Variants;

{$R *.DFM}

destructor Tdt_Plan_Add_Form1.Destroy;
begin
 dt_Plan_Add_Form1 := nil;
 inherited;
end;

procedure Tdt_Plan_Add_Form1.Button1Click(Sender: TObject);
begin
 if PlanKindRadioGroup.ItemIndex = -1 then begin
  ShowMessage('Ви не обрали вид плану, що додавати!');
  Exit;
 end;

 if Name_Plan_Type.Text = '' then begin
  ShowMessage('Ви не обрали тип плану, що додавати!');
  Exit;
 end;

 if Name_Department.Text = '' then begin
  ShowMessage('Ви не обрали підрозділ ДВП "Укрпромводчормет"!');
  Exit;
 end;

 if Date_Beg.Date >= Date_End.Date then begin
  ShowMessage('Дата початку повинна бути меншою дати закінчення');
  Exit;
 end;

 if PlanKindRadioGroup.ItemIndex = 1 then begin
  if Date_Beg.Date < Date_Beg_Limit then begin
   ShowMessage('Дата початку повинна бути не меншою ніж ' + DateToStr(Date_Beg_Limit));
   Exit;
  end;

  if Date_End.Date > Date_End_Limit then begin
   ShowMessage('Дата початку повинна бути не більшою ніж ' + DateToStr(Date_End_Limit));
   Exit;
  end;
  id_Department := Link_id_Depart;
 end;

 Edit := False;
 ModalResult := mrOk;
end;

procedure Tdt_Plan_Add_Form1.Button2Click(Sender: TObject);
begin
 Edit := False;
 ModalResult := mrCancel;
end;

procedure Tdt_Plan_Add_Form1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure Tdt_Plan_Add_Form1.Name_PlanKeyPress(Sender: TObject;
  var Key: Char);
begin
 if (Length(Name_Plan.Text) > 200) and not(Key in [#13, #8])
 then Key := #0;
 if Key = #13 then Date_Beg.SetFocus;
end;

procedure Tdt_Plan_Add_Form1.Date_BegKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  Date_End.SetFocus;
 end;
end;

procedure Tdt_Plan_Add_Form1.Date_EndKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  Button1.SetFocus;
 end;
end;

procedure Tdt_Plan_Add_Form1.ActionExitExecute(Sender: TObject);
begin
 Button2Click(Sender);
end;

procedure Tdt_Plan_Add_Form1.PlanKindRadioGroupClick(Sender: TObject);
var
 Year, Month, Day : word;
begin
 if PlanKindRadioGroup.ItemIndex = 0 then begin
  LinkToPlanMemo.Enabled    := False;
  LinkToPlanMemo.Text       := 'Немає підпорядкування';
  Name_Department.Enabled   := True;
  if Name_Depart <> '' then Name_Department.Text := Name_Depart
  else Name_Department.Text := Link_Name_Depart;
  DecodeDate(Date_Beg.Date, Year, Month, Day);
  Date_Beg.Date := EncodeDate(Year, 1, 1);
  Date_End.Date := EncodeDate(Year, 12, 31);

  Name_Plan_Type.Enabled                := True;
  dt_Plan_Add_Form1.Name_Plan_Type.Text := NamePlanType;
 end
 else begin
  LinkToPlanMemo.Enabled  := True;
  LinkToPlanMemo.Text     := Link_Name_Plan;
  Name_Department.Text    := Link_Name_Depart;
  Name_Department.Enabled := False;
  if Edit then begin
   Date_Beg.Date       := _Date_Beg;
   Date_End.Date       := _Date_End;
  end
  else begin
   Date_Beg.Date       := Date_Beg_Limit;
   Date_End.Date       := Date_End_Limit;
  end;

  Name_Plan_Type.Enabled := False;
  Name_Plan_Type.Text    := LinkNamePlanType;
 end;
end;

procedure Tdt_Plan_Add_Form1.FormShow(Sender: TObject);
begin
 PlanKindRadioGroupClick(Sender);
 id_Department := Link_id_Depart;
 Name_Depart   := Link_Name_Depart;
end;

procedure Tdt_Plan_Add_Form1.Date_BegChange(Sender: TObject);
var
 Year, Month, Day : word;
begin
 if PlanKindRadioGroup.ItemIndex = 1 then Exit;
 DecodeDate(Date_Beg.Date, Year, Month, Day);
 Date_Beg.Date := EncodeDate(Year, 1, 1);
 Date_End.Date := EncodeDate(Year, 12, 31);
end;

procedure Tdt_Plan_Add_Form1.Date_EndChange(Sender: TObject);
var
 Year, Month, Day : word;
begin
 if PlanKindRadioGroup.ItemIndex = 1 then Exit;
 DecodeDate(Date_End.Date, Year, Month, Day);
 Date_Beg.Date := EncodeDate(Year, 1, 1);
 Date_End.Date := EncodeDate(Year, 12, 31);
end;

procedure Tdt_Plan_Add_Form1.Date_BegCloseUp(Sender: TObject);
begin
 Date_BegChange(Sender);
end;

procedure Tdt_Plan_Add_Form1.Date_EndCloseUp(Sender: TObject);
begin
 Date_EndChange(Sender);
end;

procedure Tdt_Plan_Add_Form1.Name_DepartmentPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
{var
    sp: TDepartmentsSprav;}
begin
     // создать справочник
{ sp :=  TDepartmentsSprav.Create;
 if sp <> nil then begin
         // заполнить входные параметры
  with sp.Input do begin
   Append;
   FieldValues['DBHandle'] := Integer(DM.Database.Handle);
       // модальный показ
   FieldValues['ShowStyle'] := 0;
       // единичная выборка
   FieldValues['Select'] := 1;

   FieldValues['Root_Department'] := 2612;
   FieldValues['Actual_Date'] := Date;
   Post;
  end;
 end;
     // показать справочник и проанализировать результат (выбор одного подр.)
 sp.Show;

 if sp.Output = nil then ShowMessage('Ошибка!: Выходные параметры пусты!!!')
 else
 if not sp.Output.IsEmpty then begin
  Id_Department        := sp.Output['Id_Department'];
  if not VarIsNull(sp.Output['Name_Short']) then Name_Depart := sp.Output['Name_Short'];
  if not VarIsNull(sp.Output['Name_Full'])  then Name_Department.Text := sp.Output['Name_Full'];
 end;

 sp.Free;}
end;

procedure Tdt_Plan_Add_Form1.Name_Plan_TypePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 opt    : TSpravOptions;
 Result : TResultArray;
begin
 opt.canAdd        := True;
 opt.canEdit       := True;
 Opt.canSelect     := True;
 Opt.canDelete     := True;
 Opt.HideButtons    := False;
 Opt.isModal       := True;

 Result := dt_Plan_Type_Form1.tagShow(opt);
 if Length(Result) > 0 then begin
  id_Plan_Type        := Result[0];
  Name_Plan_Type.Text := Result[1];
  NamePlanType        := Result[1];
 end;
end;

end.

