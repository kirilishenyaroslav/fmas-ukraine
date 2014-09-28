unit gar_Filter_ComulativeList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxSpinEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxControls, cxContainer, cxEdit,
  cxLabel, Dates, ActnList, Unit_zGlobal_Consts, IBase,
  zMessages, zProc, cxCheckBox, cxButtonEdit, cxGroupBox, ExtCtrls, Gar_Types,
  gar_LoadPackageGarage, gar_GarageProc;

type
  TFFilterComulativeList = class(TForm)
    Actions: TActionList;
    ActionYesF10: TAction;
    ActionYesCtrlEnd: TAction;
    Panel1: TPanel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    cxGroupBox11: TcxGroupBox;
    MonthesList: TcxComboBox;
    YearSpinEdit: TcxSpinEdit;
    cxGroupBox2: TcxGroupBox;
    cxButtonEdit1: TcxButtonEdit;
    cxLabel1: TcxLabel;
    procedure ActionYesF10Execute(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit1PropertiesEditValueChanged(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    pParam:TgatFilter_ComulativeList;
    pLanguageIndex:byte;
  public
    constructor Create(Param:TgatFilter_ComulativeList);reintroduce;

  end;
implementation

{$R *.dfm}

constructor TFFilterComulativeList.Create(Param:TgatFilter_ComulativeList);
var KodSetup:integer;
begin
 inherited Create(Param.Owner);
 pLanguageIndex := LanguageIndex;
 pParam:=Param;

 YesBtn.Caption      := YesBtn_Caption[pLanguageIndex];
 CancelBtn.Caption   := CancelBtn_Caption[pLanguageIndex];
 Caption             := 'Ќакопительна€ карточка машины за период';  //FilterBtn_Caption[pLanguageIndex];
 MonthesList.Properties.Items.Text    := MonthesList_Text[pLanguageIndex];

 KodSetup := CurrentKodSetup(Param.DB_Handle);

 MonthesList.ItemIndex:=YearMonthFromKodSetup(KodSetup,False)-1;
 YearSpinEdit.Value:=YearMonthFromKodSetup(KodSetup);
end;

procedure TFFilterComulativeList.ActionYesF10Execute(Sender: TObject);
begin
 pParam.Kod_Setup:=PeriodToKodSetup(YearSpinEdit.Value, MonthesList.ItemIndex+1);
 ModalResult:=mrYes;
end;

procedure TFFilterComulativeList.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var avto:variant;
param:TgarSimpleParamMode;
begin
  param:=TgarSimpleParamMode.Create;
  param.DB_Handle:=pParam.DB_Handle;
  Param.Owner:=self;
  Param.fs:=garfsSelect;
  avto:=LoadPackageGarage(Param, Name_Gar_Sp_Avto);
  if VarArrayDimCount(avto)>0 then
   begin
     if avto[0]<>NULL then
      begin
        pParam.ParamAvto.id:=avto[0];
        pParam.ParamAvto.Tn:=VarToStr(avto[1]);
        pParam.ParamAvto.Caption:=VarToStr(avto[2]);
        cxLabel1.Caption := VarToStrDef(pParam.ParamAvto.Caption, '');
        cxButtonEdit1.Text := VarToStrDef(pParam.ParamAvto.Tn, '');
      end;
   end;
end;

procedure TFFilterComulativeList.cxButtonEdit1PropertiesEditValueChanged(
  Sender: TObject);
var avto:Variant;
begin
if cxButtonEdit1.Text<>'' then
 begin
  if cxButtonEdit1.Text=pParam.ParamAvto.Tn then Exit;
  avto:=Gar_Avto_By_NOM_GOS(cxButtonEdit1.EditValue,pParam.DB_Handle);
  if VarArrayDimCount(avto)>0 then
   begin
    pParam.ParamAvto.Id:=avto[0];
    pParam.ParamAvto.Tn:=VarToStrDef(avto[1],'0');
    pParam.ParamAvto.Caption:=VarToStrDef(avto[2],'');
    cxButtonEdit1.EditValue:=pParam.ParamAvto.Tn;
    cxLabel1.Caption := pParam.ParamAvto.Caption;
   end
  else
   SetFocus;
 end;
end;


procedure TFFilterComulativeList.CancelBtnClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
