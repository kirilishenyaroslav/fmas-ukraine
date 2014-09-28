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
    procedure FormCreate(Sender: TObject);
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

procedure Tini_Group_UnitM_Unit_Meas1.FormCreate(Sender: TObject);
begin
 if (Owner as Tini_Unit_Meas_Form1).TreeList.FocusedNode.Values[0] < 0 then RadioGroup1.ItemIndex := 1
 else RadioGroup1.ItemIndex := 0;
end;

procedure Tini_Group_UnitM_Unit_Meas1.ActionExitExecute(Sender: TObject);
begin
 Button2Click(sender);
end;

procedure Tini_Group_UnitM_Unit_Meas1.cxButton1Click(Sender: TObject);
begin
 if RadioGroup1.ItemIndex < 0 then begin
  ShowMessage('ќбер≥ть вид об''Їкту, що бажаЇте додати');
  Exit;
 end;
 ModalResult := mrOk;
end;

end.
