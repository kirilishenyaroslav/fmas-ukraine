//***********************************************************************
//* Проект "Студгородок"                                                *
//* Добавление льготы                                                   * 
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit uSp_tarif_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCalendar,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxControls, cxGridCustomView, cxGridDBTableView, cxGrid,
  Buttons, cxCheckBox, cxTextEdit, cxLabel, cxContainer, cxGroupBox,
  StdCtrls, cxButtons, FIBDataSet, pFIBDataSet, st_ConstUnit,
  uSp_tarif_DM, st_common_funcs, iBase,
  st_Common_Messages, st_Consts_Messages, st_common_types, cxMaskEdit,
  cxDropDownEdit, cxButtonEdit, St_Loader_Unit, st_common_loader;

type
  Tfrm_tarif_AE = class(TForm)
    cxGroupBox1: TcxGroupBox;
    NameLabel: TcxLabel;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    Label_koef: TcxLabel;
    CurrencyEdit_tarif: TcxCurrencyEdit;
    ButtonEdit_Builds: TcxButtonEdit;
    DateEdit_beg: TcxDateEdit;
    DateEdit_end: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    CheckBox_dop_service: TcxCheckBox;
    Label_headcound: TcxLabel;
    CurrencyEdit_headcound: TcxCurrencyEdit;
    ButtonEdit_service: TcxButtonEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure MedCheckKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEdit_BuildsPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEdit_servicePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CheckBox_dop_servicePropertiesChange(Sender: TObject);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage;
  public
    aHandle : TISC_DB_HANDLE;
    is_admin : Boolean;
    id_build : Int64;
    id_service : int64;
    DM : Tfrm_tarif_DM;
    constructor Create(aOwner : TComponent; aHandle : TISC_DB_HANDLE; id_build : int64);reintroduce;
  end;

var
  frm_tarif_AE: Tfrm_tarif_AE;

implementation

{$R *.dfm}

procedure Tfrm_tarif_AE.FormIniLanguage();
begin
  // индекс языка (1-укр, 2 - рус)
  PLanguageIndex:=            stLanguageIndex;

  //названия кнопок
  OKButton.Caption       := st_ConstUnit.st_Accept[PLanguageIndex];
  CancelButton.Caption   := st_ConstUnit.st_Cancel[PLanguageIndex];
end;

procedure Tfrm_tarif_AE.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_tarif_AE.OKButtonClick(Sender: TObject);
begin
  if (ButtonEdit_service.Text = '') then
   Begin
    ShowMessage('Необхідно обрати послугу!');
    ButtonEdit_service.SetFocus;
    exit;
   end;

  if ((ButtonEdit_Builds.Text = '') and (ButtonEdit_Builds.Enabled))  then
   Begin
    ShowMessage('Необхідно обрати гуртожиток!');
    ButtonEdit_Builds.SetFocus;
    exit;
   end;

  if DateEdit_end.EditValue <= DateEdit_beg.EditValue then
   Begin
    ShowMessage('Дата початку повинна бути менше дати закінчення!');
    DateEdit_beg.SetFocus;
    exit;
   end;

  if CurrencyEdit_tarif.EditValue = 0 then
   Begin
    ShowMessage('Необхідно ввести тариф!');
    CurrencyEdit_tarif.SetFocus;
    exit;
   end;

  if ((CurrencyEdit_headcound.EditValue = 0) and (CheckBox_dop_service.Checked)) then
   Begin
    ShowMessage('Необхідно ввести коеф. чисельності!');
    CurrencyEdit_headcound.SetFocus;
    exit;
   end;
   
  ModalResult := mrOK;
end;

procedure Tfrm_tarif_AE.MedCheckKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then OKButton.SetFocus;
end;

constructor Tfrm_tarif_AE.Create(aOwner: TComponent;
  aHandle: TISC_DB_HANDLE; id_build: int64);
begin
  inherited Create(aOwner);

  self.id_build := id_build;

  self.aHandle := aHandle;

  DM := Tfrm_tarif_DM.Create(self);
  DM.DB.Handle := aHandle;
  DM.DB.Connected := True;
  DM.Transaction_Read.StartTransaction;

  FormIniLanguage;
  
end;

procedure Tfrm_tarif_AE.cxButtonEdit_BuildsPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  ResOpl:Variant;
  BuildInfo: TBuildsInfo;
begin
  BuildInfo.id_build:= -1;
  BuildInfo.N_Room := '';
  ResOpl:= Load_st_Builds(self, DM.DB.Handle, true, false, BuildInfo);

  if VarArrayDimCount(ResOpl)>0 then
   begin
     id_build := ResOpl[0];
     ButtonEdit_Builds.Text := ResOpl[2];
   end;
end;

procedure Tfrm_tarif_AE.ButtonEdit_servicePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  aParameter : TstSimpleParams;
  res : Variant;
begin
  aParameter                 := TstSimpleParams.Create;
  aParameter.Owner           := self;
  aParameter.Db_Handle       := aHandle;
  AParameter.Formstyle       := fsNormal;
  AParameter.WaitPakageOwner := self;
  aParameter.is_admin        := is_admin;

  res := RunFunctionFromPackage(aParameter, 'Studcity\st_services.bpl', 'getServices');

  If VarArrayDimCount(res) <>0 then
   begin
     id_service              := res[0];
     ButtonEdit_service.Text := res[1];
   End
end;

procedure Tfrm_tarif_AE.CheckBox_dop_servicePropertiesChange(
  Sender: TObject);
begin
  Label_headcound.Visible        := CheckBox_dop_service.Checked;
  CurrencyEdit_headcound.Visible := CheckBox_dop_service.Checked;
  ButtonEdit_Builds.Enabled := not CheckBox_dop_service.Checked;
end;

end.
