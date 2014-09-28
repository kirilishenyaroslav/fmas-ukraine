unit Sp_VidOpl_Locate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxGroupBox, cxControls, cxContainer, cxEdit, cxRadioGroup, Unit_Sp_VidOpl_Consts,
  ActnList;

type FieldForLocate = (fflNameVo, fflKodVO, fflConstVO);

type TLocateData = record
 Text:string;
 Field:FieldForLocate;
 Fields:set of FieldForLocate;
end;

function FieldForLocateToName(Field:FieldForLocate):string;

type
  TFVOLocate = class(TForm)
    RadioGroupTypeLocate: TcxRadioGroup;
    GroupBoxLocate: TcxGroupBox;
    TextEditLocate: TcxTextEdit;
    LocateBtn: TcxButton;
    CancelBtn: TcxButton;
    ActionList1: TActionList;
    ActionLocateBtnClick: TAction;
    procedure ActionLocateBtnClickExecute(Sender: TObject);
  private
    Res: TLocateData;
  public
    Constructor Create (AOwner: TComponent; LocateData: TLocateData);reintroduce;
    property Result:TLocateData read Res;
  end;

implementation

{$R *.dfm}

function FieldForLocateToName(Field:FieldForLocate):string;
begin
  case Field of
   fflNameVo: result:='NAME_VIDOPL';
   fflKodVO: result:='KOD_VIDOPL';
   fflConstVO: result:='NAME_VOPL_PROP';
  end;
end;

constructor TFVOLocate.Create (AOwner: TComponent; LocateData: TLocateData);
var FieldsCount:byte;
begin
 inherited Create(AOwner);
 FieldsCount:=0;
 Caption := FVOLocate_Caption;
 RadioGroupTypeLocate.Caption := FVOLocate_RadioGroupTypeLocate_Caption;
 GroupBoxLocate.Caption := FVOLocate_GroupBoxLocate_Caption;
 LocateBtn.Caption      := LocateBtn_Caption;
 CancelBtn.Caption      := CancelBtn_Caption;
 if (fflNameVo in LocateData.Fields) then
  with RadioGroupTypeLocate do
  begin
   Properties.Items.Add;
   Properties.Items[Properties.Items.Count-1].Caption := FVOLocate_RadioGroupTypeLocate_Text1;
   inc(FieldsCount);
  end;
 if (fflKodVo in LocateData.Fields) then
  with RadioGroupTypeLocate do
  begin
   Properties.Items.Add;
   Properties.Items[Properties.Items.Count-1].Caption := FVOLocate_RadioGroupTypeLocate_Text2;
   inc(FieldsCount);
  end;
 if (fflConstVO in LocateData.Fields) then
  with RadioGroupTypeLocate do
  begin
   Properties.Items.Add;
   Properties.Items[Properties.Items.Count-1].Caption := FVOLocate_RadioGroupTypeLocate_Text3;
   inc(FieldsCount);
  end;
 RadioGroupTypeLocate.Properties.Columns:=FieldsCount;
 RadioGroupTypeLocate.ItemIndex := ord(LocateData.Field);
end;

procedure TFVOLocate.ActionLocateBtnClickExecute(Sender: TObject);
begin
 Res.Text:=TextEditLocate.Text;
 if RadioGroupTypeLocate.Properties.Items[RadioGroupTypeLocate.ItemIndex].Caption =
    FVOLocate_RadioGroupTypeLocate_Text1 then res.Field:=fflNameVo;
 if RadioGroupTypeLocate.Properties.Items[RadioGroupTypeLocate.ItemIndex].Caption =
    FVOLocate_RadioGroupTypeLocate_Text2 then res.Field:=fflKodVo;
 if RadioGroupTypeLocate.Properties.Items[RadioGroupTypeLocate.ItemIndex].Caption =
    FVOLocate_RadioGroupTypeLocate_Text3 then res.Field:=fflConstVO;
 ModalResult:=mrYes;
end;

end.
