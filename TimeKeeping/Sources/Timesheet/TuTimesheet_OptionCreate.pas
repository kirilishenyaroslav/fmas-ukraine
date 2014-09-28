unit TuTimesheet_OptionCreate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxButtonEdit, cxDropDownEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxGroupBox, StdCtrls, cxRadioGroup, cxControls,
  cxContainer, cxEdit, ActnList, cxButtons, ExtCtrls,TuCommonLoader,TuTimesheet_DM,
  TuTimesheet_Main,  Dates,TuCommonProc,TuCommonTypes,TuMessages,AccMGMT;

type
  TFormOptionCreate = class(TForm)
    Panel1: TPanel;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    GroupBoxPeriod: TcxGroupBox;
    GroupBox: TcxGroupBox;
    EditYear: TcxSpinEdit;
    EditMonth: TcxComboBox;
    RadioButtonAll: TcxRadioButton;
    RadioButtonTemplet: TcxRadioButton;
    RadioButtonDog: TcxRadioButton;
    EditTemOrDog: TcxButtonEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    LabelAcces: TLabel;
    procedure RadioButtonAllClick(Sender: TObject);
    procedure EditTemOrDogPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure RadioButtonDogClick(Sender: TObject);
    procedure EditYearPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    FParam:TParamFilterTsh;
    constructor create(PParam:TParamFilterTsh); reintroduce;
  end;


implementation



{$R *.dfm}
constructor TFormOptionCreate.create(PParam:TParamFilterTsh);
var Y, M, D: word;
    date_loc: Tdate;
begin
  inherited create(PParam.owner);
  FParam:=PParam;
  date_loc:=strtoDate(KodSetupToPeriod(FParam.KodSetup, 6));
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
  EditTemOrDog.Text:=PParam.nameId;
  case PParam.typeId of
    1:RadioButtonTemplet.Checked:=true;
    2:RadioButtonDog.Checked:=true;
    3:RadioButtonAll.Checked:=true;
  end;

end;
procedure TFormOptionCreate.RadioButtonAllClick(Sender: TObject);
begin
 EditTemOrDog.Enabled:=not RadioButtonAll.Checked;
 FParam.TypeId:=3;
 FParam.id:=Null;
 FParam.IdPostMoving:=null;
 FParam.nameId:='';
end;

procedure TFormOptionCreate.EditTemOrDogPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res: variant;
begin
 if RadioButtonTemplet.Checked then
 begin
  res:=LoadTuSpTemplet(self, DM.DB.Handle,FParam.KodSetup,tfsModal,null);
  if varisArray(res) then
  begin
   FParam.ID:=res[0];
   FParam.nameId:=res[1];
   EditTemOrDog.Text:=res[1];
   SetFocus;
   FParam.TypeId:=1;
   FParam.IdPostMoving:=Null;
   FParam.nameId:=res[1];

  end;
 end
 else
 begin
  Res:=LoadTuSpDog(self,dm.db.Handle, FParam.KodSetup, Null);
  if VarIsArray(res)  then
  begin
    EditTemOrDog.Text:=Res[2];
    FParam.ID:=res[0];
    FParam.IdPostMoving:=Res[1];
    FParam.nameId:=Res[2];
    FParam.TypeId:=2;
  end
 end ;
 Res:=null
end;

procedure TFormOptionCreate.ActionYesExecute(Sender: TObject);
var Form:TFormTimesheet_Main;
begin

if( FParam.ID<>null)or (FParam.TypeId=3) then
  ModalResult:=mrYes
else
 TuShowMessage('”вага', 'ќбер≥ть данн≥?', mtInformation, [mbOK]);


end;

procedure TFormOptionCreate.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFormOptionCreate.RadioButtonDogClick(Sender: TObject);
begin
 EditTemOrDog.Enabled:=not RadioButtonAll.Checked;
end;

procedure TFormOptionCreate.EditYearPropertiesChange(Sender: TObject);
begin
FParam.KodSetup:=PeriodToKodSetup(EditYear.Value, EditMonth.itemIndex+1);
end;

end.
