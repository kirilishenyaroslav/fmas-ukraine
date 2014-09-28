unit ini_Unit_Meas_Form_Add;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ActnList, ExtCtrls, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, cxButtons,
  Variants, Ibase;

type
  Tini_Unit_Meas_Form_Add1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ActionList1: TActionList;
    ActionExit: TAction;
    Label4: TLabel;
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
   DBHandle:TISC_DB_HANDLE;
   destructor Destroy; override;
  end;

var
  ini_Unit_Meas_Form_Add1 : Tini_Unit_Meas_Form_Add1;

implementation

uses ini_Group_UnitM_Form, ini_Unit_Meas_Form, GlobalSpr, pUtils;

{$R *.DFM}

destructor Tini_Unit_Meas_Form_Add1.Destroy;
begin
 ini_Unit_Meas_Form_Add1 := nil;
 inherited;
end;

procedure Tini_Unit_Meas_Form_Add1.Name_Group_UnitMButtonClick(Sender: TObject);
var
 Res : Variant;

begin
 Res := ShowGroupUnitMeas(Self, DBHandle, fsNormal, id_Group_UnitM);
 if not VarIsNull(res) then begin
  Name_Group_UnitM.Text := Res[1];
  id_Group_UnitM        := Res[0];
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

 if not (Key in [Decimalseparator,'0'..'9', #8, #9]) then Key := #0;
end;

end.
