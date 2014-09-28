unit gar_Filter_Comulative_HelpList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxSpinEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxControls, cxContainer, cxEdit,
  cxLabel, Dates, ActnList, Unit_zGlobal_Consts, IBase,
  zMessages, zProc, cxCheckBox, cxButtonEdit, cxGroupBox, ExtCtrls, Gar_Types,
  gar_LoadPackageGarage, gar_GarageProc, cxCalendar;

type
  TFFilterComulativeList_FIO = class(TForm)
    Actions: TActionList;
    ActionYesF10: TAction;
    Panel1: TPanel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    Action1: TAction;
    cxGroupBox3: TcxGroupBox;
    LabelVidopl: TcxLabel;
    cxLabel2: TcxLabel;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    act1: TAction;
    procedure ActionYesF10Execute(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    pParam:Tgar_ComulativeList_Period;
    pLanguageIndex:byte;
  public
    constructor Create(Param:Tgar_ComulativeList_Period);reintroduce;

  end;
implementation

{$R *.dfm}

constructor TFFilterComulativeList_FIO.Create(Param:Tgar_ComulativeList_Period);
var KodSetup:integer;
begin
 inherited Create(Param.Owner);
 pLanguageIndex := LanguageIndex;
 pParam:=Param;

 YesBtn.Caption      := YesBtn_Caption[pLanguageIndex];
 CancelBtn.Caption   := CancelBtn_Caption[pLanguageIndex];
 Caption             := 'Ведомость за период';  //FilterBtn_Caption[pLanguageIndex];
 //MonthesList.Properties.Items.Text    := MonthesList_Text[pLanguageIndex];

 KodSetup := Global_Kod_Setup(Param.DB_Handle);
 pParam.Kod_Setup:=KodSetup;

 cxDateEdit1.EditValue:=ConvertKodToDate(KodSetup);
 cxDateEdit2.EditValue:=ConvertKodToDate(KodSetup+1)-1;
end;

procedure TFFilterComulativeList_FIO.ActionYesF10Execute(Sender: TObject);
begin
 pParam.DATE_BEG:=cxDateEdit1.Date;
 pParam.DATE_END:=cxDateEdit2.Date;
 ModalResult:=mrYes;
end;

procedure TFFilterComulativeList_FIO.CancelBtnClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFFilterComulativeList_FIO.Action1Execute(Sender: TObject);
begin
      if  YesBtn.Focused Then ActionYesF10Execute(Sender);
      if  CancelBtn.Focused Then CancelBtnClick(Sender);
      SendKeyDown(Self.ActiveControl,VK_TAB,[]);
end;

procedure TFFilterComulativeList_FIO.FormShow(Sender: TObject);
begin
YesBtn.SetFocus;
end;

end.
