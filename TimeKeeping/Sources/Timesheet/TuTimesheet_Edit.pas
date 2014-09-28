unit TuTimesheet_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDropDownEdit, cxSpinEdit, StdCtrls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxRadioGroup,
  cxControls, cxGroupBox, cxButtons, ActnList, ExtCtrls,TuCommonLoader,Dates,
  TuCommonTypes, cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  TuCommonProc,TuMessages;

type
  TFormEditTsh = class(TForm)
    Panel1: TPanel;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    GroupBox: TcxGroupBox;
    RadioButtonTemplet: TcxRadioButton;
    RadioButtonDog: TcxRadioButton;
    EditTemOrDog: TcxButtonEdit;
    GroupBoxPeriod: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EditYear: TcxSpinEdit;
    EditMonth: TcxComboBox;
    EditFrom: TcxSpinEdit;
    EditTo: TcxSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure EditTemOrDogPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    FID:variant;
    FTypeID:integer;
    FKodSetup:integer;
    NameFull:string;
    FIdPostMoving:variant;
    constructor create (Aowner:TComponent; PKodSetup: integer);reintroduce;
  end;


implementation

uses TuTimesheet_DM;

{$R *.dfm}

constructor TFormEditTsh.create (Aowner:TComponent; PKodSetup: integer);
var Y, M, D: word;
    date_loc: Tdate;
begin
inherited create(AOwner);
FKodSetup:=PKodSetup;


//******************************************************************************
date_loc:=strtoDate(KodSetupToPeriod(FKodSetup, 6));
decodeDate( date_loc,Y, M, D);
EditYear.Value:=Y;
EditMonth.Properties.Items.Text:=GetConst('MonthJanuary','OtherConsts')+#13+
                                  GetConst('MonthFebruary','OtherConsts')+#13+
                                  GetConst('MonthMarch','OtherConsts')+#13+
                                  GetConst('MonthApril','OtherConsts')+#13+
                                  GetConst('MonthMay','OtherConsts')+#13+
                                  GetConst('MonthJune','OtherConsts')+#13+
                                  GetConst('MonthJuly','OtherConsts')+#13+
                                  GetConst('MonthAutumn','OtherConsts')+#13+
                                  GetConst('MonthSeptember','OtherConsts')+#13+
                                  GetConst('MonthOctober','OtherConsts')+#13+
                                  GetConst('MonthNovember','OtherConsts')+#13+
                                  GetConst('MonthDecember','OtherConsts');
EditMonth.ItemIndex:= M-1;
if DM.DSetTempletOrPeriod.RecordCount<>0 then
begin
  FID:=DM.DSetTempletOrPeriod['ID'];
  EditTemOrDog.text:=DM.DSetTempletOrPeriod['NAME'];
  case DM.DSetTempletOrPeriod['TYPE_ID'] of
   1 :  RadioButtonTemplet.Checked:=true;
   2 : begin
         RadioButtonDog.Checked:=true;
         FIdPostMoving:=DM.DSetTempletOrPeriod['ID_POST_MOVING']
       end;

  end;
end;
  D := 28;
  case M of
    1, 3, 5, 7, 8, 10, 12: D := 31;
    4, 6, 9, 11: D := 30;
    2: if IsLeapYear(Y) then
         D := 29
       else
         D := 28;
  end;
EditTo.Properties.MaxValue:=D;
EditTo.Value:=D;
//******************************************************************************
// EditTypeTsh.Properties.ListSource:=DM.DSourceTypeTsh;
 //EditTypeTsh.EditValue:=DM.DSetTypeTsh['ID_TIMESHEET_TYPE'];
//******************************************************************************

   end;


procedure TFormEditTsh.EditTemOrDogPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res: variant;
  KodSetup_L:integer;
begin
 KodSetup_L:=PeriodToKodSetup(EditYear.Value, EditMonth.itemIndex+1);
 if RadioButtonTemplet.Checked then
 begin
  res:=LoadTuSpTemplet(self, DM.DB.Handle,KodSetup_L,tfsModal,null);
  if VarIsArray(res) then
  begin
    FID:=res[0];
    NameFull:=res[1];
    EditTemOrDog.Text:=NameFull;
    SetFocus;
    FIdPostMoving:=Null;
    FTypeId:=1;
  end
 end
 else
 begin
  Res:=LoadTuSpDog(self,dm.db.Handle, KodSetup_L,Null);
  if Res[0] <>null then
  begin
    EditTemOrDog.Text:=Res[2];
    FID:=Res[0];
    FIdPostMoving:=res[1];
    FTypeId:=2;
  end
 end
end;

procedure TFormEditTsh.ActionYesExecute(Sender: TObject);
begin
if (FID <>null) then
ModalResult:=mrYes
else
TuShowMessage('”вага', 'ќбер≥ть данн≥?', mtInformation, [mbOK]);

end;

procedure TFormEditTsh.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

end.




