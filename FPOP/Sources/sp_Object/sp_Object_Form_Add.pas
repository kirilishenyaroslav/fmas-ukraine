{******************************************************************************}
{               Автоматизированная система «Формирование планов основного      }
{                          производства ГПП «Укрпромводчермет»                 }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{               Модуль "Добавление типов объктов и объектов водоснабжения"     }
{       Добавление и изменение типов объктов и объектов водоснабжения по       }
{       подраздлениям                                                          }
{                                               ответственный: Андрей Таганский}

unit sp_Object_Form_Add;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, tagBaseTypes, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, cxButtons,
  cxRadioGroup, FIBQuery, pFIBQuery, ActnList, cxCheckBox;

type
  Tsp_Object_Form_Add1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Name_Department: TcxButtonEdit;
    Edit1: TcxTextEdit;
    LevelRadioGroup: TcxRadioGroup;
    KindRadioGroup: TcxRadioGroup;
    OK_Btn: TcxButton;
    Cancel_Btn: TcxButton;
    Query: TpFIBQuery;
    ActionList: TActionList;
    ActionExit: TAction;
    ForPlanCheckBox: TcxCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OK_BtnClick(Sender: TObject);
    procedure Name_DepartmentPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionExitExecute(Sender: TObject);
    procedure LevelRadioGroupPropertiesChange(Sender: TObject);
    procedure KindRadioGroupPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    HasPlanCh : boolean;
    _is_Edit  : boolean;
    destructor Destroy; override;
  end;

var
  sp_Object_Form_Add1  : Tsp_Object_Form_Add1;
  Id_Department        : integer;
  Name_Depart          : string;

implementation

{$R *.DFM}
uses sp_Object_Form, DataModule, Variants{, uDepartmentsMain};

procedure Tsp_Object_Form_Add1.BitBtn2Click(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure Tsp_Object_Form_Add1.FormShow(Sender: TObject);
begin
 Edit1.SetFocus;
end;

procedure Tsp_Object_Form_Add1.OK_BtnClick(Sender: TObject);
begin
 if Edit1.Text = '' then begin
  if KindRadioGroup.ItemIndex = 0 then
   ShowMessage('Заповніть поле із назвою типу об''єктів')
  else
   ShowMessage('Заповніть поле із назвою об''єкту');

  Exit;
 end;

 if KindRadioGroup.ItemIndex < 0 then begin
  ShowMessage('Оберіть вид об''єкту, що бажаєте додати');
  Exit;
 end;

 if LevelRadioGroup.ItemIndex < 0 then begin
  ShowMessage('Оберіть, на якому рівні Ви бажаєте додати ооб''єкт');
  Exit;
 end;

 if (KindRadioGroup.ItemIndex = 1) and (Name_Department.Text = '') then begin
  ShowMessage('Оберіть підрозділ, до якого належить об''єкт!');
  Exit;
 end;

 ModalResult := mrOk;
end;

procedure Tsp_Object_Form_Add1.Name_DepartmentPropertiesButtonClick(
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

destructor Tsp_Object_Form_Add1.Destroy;
begin
 sp_Object_Form_Add1 := nil;
 inherited;
end;

procedure Tsp_Object_Form_Add1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure Tsp_Object_Form_Add1.ActionExitExecute(Sender: TObject);
begin
 BitBtn2Click(Sender);
end;

procedure Tsp_Object_Form_Add1.LevelRadioGroupPropertiesChange(
  Sender: TObject);
begin
 if LevelRadioGroup.ItemIndex = 0 then begin
  if sp_Object_Form1.TreeList.FocusedNode.Level = 0 then begin
   KindRadioGroup.Enabled := False;
   KindRadioGroup.ItemIndex := 0;
  end;
  if (sp_Object_Form1.TreeList.FocusedNode.Parent <> nil) then begin
   if not VarIsNull(sp_Object_Form1.TreeList.FocusedNode.Parent.Values[1]) then begin
    KindRadioGroup.Enabled := False;
    KindRadioGroup.ItemIndex := 1;
   end
   else KindRadioGroup.Enabled := True and not _is_Edit;
  end;
 end;

 if LevelRadioGroup.ItemIndex = 1 then begin
  if sp_Object_Form1.TreeList.FocusedNode.Level = 0 then begin
   KindRadioGroup.Enabled := True and not _is_Edit;
  end;
  if not VarIsNull(sp_Object_Form1.TreeList.FocusedNode.Values[1]) then begin
   KindRadioGroup.Enabled := False;
   KindRadioGroup.ItemIndex := 1;
  end;
 end;

 if not VarIsNull(sp_Object_Form1.TreeList.FocusedNode.Values[1]) and HasPlanCh then begin
  LevelRadioGroup.Enabled := False;
  LevelRadioGroup.ItemIndex := 0;
  KindRadioGroup.Enabled := False;
  KindRadioGroup.ItemIndex := 1;
 end;
end;

procedure Tsp_Object_Form_Add1.KindRadioGroupPropertiesChange(
  Sender: TObject);
begin
 if KindRadioGroup.ItemIndex = 0 then begin
  if (sp_Object_Form1.TreeList.FocusedNode <> nil) then
   if not VarIsNull(sp_Object_Form1.TreeList.FocusedNode.Values[1]) then begin
    LevelRadioGroup.Enabled := False;
    LevelRadioGroup.ItemIndex := 0;
   end;
 end
 else LevelRadioGroup.Enabled := True and not _is_Edit;

 if KindRadioGroup.ItemIndex = 0 then begin
  Label4.Visible             := False;
  Name_Department.Visible    := False;
  ForPlanCheckBox.Visible    := False;
  sp_Object_Form_Add1.Height := 207;

  Label1.Caption := 'Назва типу об''єктів:';

  if _is_Edit then
   Caption := 'Модифікація типу об''єктів'
  else
   Caption := 'Додавання типу об''єктів';
 end
 else if KindRadioGroup.ItemIndex = 1 then begin
  Label4.Visible             := True;
  Name_Department.Visible    := True;
  ForPlanCheckBox.Visible    := True;
  sp_Object_Form_Add1.Height := 276;

  Label1.Caption := 'Назва об''єкту:';
  if _is_Edit then
   Caption := 'Модифікація об''єкту'
  else
   Caption := 'Додавання об''єкту';
 end;
end;

end.
