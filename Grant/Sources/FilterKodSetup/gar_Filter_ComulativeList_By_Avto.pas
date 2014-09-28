unit gar_Filter_ComulativeList_By_Avto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxSpinEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxControls, cxContainer, cxEdit,
  cxLabel, Dates, ActnList, Unit_zGlobal_Consts, IBase,
  zMessages, zProc, cxCheckBox, cxButtonEdit, cxGroupBox, ExtCtrls, Gar_Types,
  gar_LoadPackageGarage, gar_GarageProc, cxCalendar;

type
  TFFilterComulativeList = class(TForm)
    Actions: TActionList;
    ActionYesF10: TAction;
    Panel1: TPanel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    cxGroupBox2: TcxGroupBox;
    cxButtonEdit1: TcxButtonEdit;
    cxLabel1: TcxLabel;
    Action1: TAction;
    cxGroupBox3: TcxGroupBox;
    LabelVidopl: TcxLabel;
    cxLabel2: TcxLabel;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    Action2: TAction;
    procedure ActionYesF10Execute(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit1PropertiesEditValueChanged(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    pParam:Tgar_ComulativeList_By_Avto;
    pLanguageIndex:byte;
  public
    constructor Create(Param:Tgar_ComulativeList_By_Avto);reintroduce;

  end;
implementation

{$R *.dfm}

constructor TFFilterComulativeList.Create(Param:Tgar_ComulativeList_By_Avto);
var KodSetup:integer;
begin
 inherited Create(Param.Owner);
 pLanguageIndex := LanguageIndex;
 pParam:=Param;

 YesBtn.Caption      := YesBtn_Caption[pLanguageIndex];
 CancelBtn.Caption   := CancelBtn_Caption[pLanguageIndex];
 Caption             := 'Накопительная карточка машины за период';  //FilterBtn_Caption[pLanguageIndex];
 KodSetup := Global_Kod_Setup(Param.DB_Handle);
 pParam.Kod_Setup:=KodSetup;
 cxDateEdit1.EditValue:=ConvertKodToDate(KodSetup);
 cxDateEdit2.EditValue:=ConvertKodToDate(KodSetup+1)-1;
end;

procedure TFFilterComulativeList.ActionYesF10Execute(Sender: TObject);
begin
 if cxLabel1.Caption='' then
  begin
    showmessage('Автомобиль не выбран!');
    exit;
  end;
 pParam.DateBeg:=  cxDateEdit1.Date;
 pParam.DateEnd:=  cxDateEdit2.Date;

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
if (cxButtonEdit1.Text<>'') and (pParam.ParamAvto.Tn<>cxButtonEdit1.Text) then
 begin
  if cxButtonEdit1.Text=pParam.ParamAvto.Tn then Exit;
  avto:=Gar_Avto_By_NOM_GOS(cxButtonEdit1.EditValue,pParam.DB_Handle);
  if VarArrayDimCount(avto)>0 then
   begin
    pParam.ParamAvto.Id:=avto[0];
    pParam.ParamAvto.Tn:=VarToStr(avto[1]);
    pParam.ParamAvto.Caption:=VarToStr(avto[2]);
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

procedure TFFilterComulativeList.Action1Execute(Sender: TObject);
begin
      if  YesBtn.Focused Then ActionYesF10Execute(Sender);
      if  CancelBtn.Focused Then CancelBtnClick(Sender);
      SendKeyDown(Self.ActiveControl,VK_TAB,[]);
end;

procedure TFFilterComulativeList.FormShow(Sender: TObject);
begin
  cxButtonEdit1.SetFocus;
end;

end.
