unit ReCountFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxRadioGroup, Unit_ZGlobal_Consts,
  ZProc;

type
  TFRecountFilter = class(TForm)
    ItemsFilter: TcxRadioGroup;
    CancelBtn: TcxButton;
    YesBtn: TcxButton;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    PlanguageIndex:Byte;
  public
    constructor Create(AOwner:TComponent);reintroduce;
  end;

function ViewFilter(AOwner:TComponent;AItemIndex:byte=1):byte;

implementation

{$R *.dfm}
function ViewFilter(AOwner:TComponent;AItemIndex:byte=1):byte;
var FormView:TFRecountFilter;
begin
 FormView:=TFRecountFilter.Create(AOwner);
 FormView.ItemsFilter.ItemIndex := AItemIndex-1;
 if FormView.ShowModal=mrYes then Result:=FormView.ItemsFilter.ItemIndex+1
 else Result:=0;
 FormView.Destroy;
end;

constructor TFRecountFilter.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
 PlanguageIndex:=LanguageIndex;
//******************************************************************************
 Caption := FilterBtn_Caption[PlanguageIndex];
 YesBtn.Caption := YesBtn_Caption[PlanguageIndex];
 CancelBtn.Caption := CancelBtn_Caption[PlanguageIndex];
 YesBtn.Hint := YesBtn.Caption;
 CancelBtn.Hint := CancelBtn.Caption;
//******************************************************************************
 ItemsFilter.Properties.Items[0].Caption:=NotFilter_Const[PlanguageIndex];
 ItemsFilter.Properties.Items[1].Caption:=SumMoreNull_Const[PlanguageIndex];
 ItemsFilter.Properties.Items[2].Caption:=SumLessNull_Const[PlanguageIndex];
 ItemsFilter.Properties.Items[3].Caption:=SumEqualNull_Const[PlanguageIndex];
 ItemsFilter.Properties.Items[4].Caption:=SumIsNull_Const[PlanguageIndex];
end;

procedure TFRecountFilter.ActionYesExecute(Sender: TObject);
begin
ModalResult:=mrYes;
end;

procedure TFRecountFilter.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

end.
