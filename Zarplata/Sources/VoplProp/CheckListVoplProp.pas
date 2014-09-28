unit CheckListVoplProp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxCheckListBox, cxCheckBox, Unit_Sp_VidOpl_Consts,
  ActnList;

type
  TFCheckList = class(TForm)
    CheckListBox: TcxCheckListBox;
    Panel1: TPanel;
    CheckAllBtn: TcxButton;
    UnCheckAllBtn: TcxButton;
    Panel2: TPanel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    ActionList1: TActionList;
    Action1: TAction;
    procedure CheckAllBtnClick(Sender: TObject);
    procedure UnCheckAllBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFCheckList.CheckAllBtnClick(Sender: TObject);
var i:Word;
begin
for i:=0 to CheckListBox.Items.Count-1 do
 begin
  CheckListBox.Items.Items[i].State:=cbsChecked;
 end;
end;

procedure TFCheckList.UnCheckAllBtnClick(Sender: TObject);
var i:Word;
begin
for i:=0 to CheckListBox.Items.Count-1 do
 begin
  CheckListBox.Items.Items[i].State:=cbsUnchecked;
 end;
end;

procedure TFCheckList.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFCheckList.FormCreate(Sender: TObject);
begin
self.CheckAllBtn.Caption   := FSpVoplIniPropGroupControl_CheckAllBtn_Caption;
self.UnCheckAllBtn.Caption := FSpVoplIniPropGroupControl_UnCheckAllBtn_Caption;
self.YesBtn.Caption        := YesBtn_Caption;
self.CancelBtn.Caption     := CancelBtn_Caption;
end;

procedure TFCheckList.Action1Execute(Sender: TObject);
begin
ModalResult:=mrYes;
end;

end.
