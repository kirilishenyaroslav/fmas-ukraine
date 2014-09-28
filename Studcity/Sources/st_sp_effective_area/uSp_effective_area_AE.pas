//***********************************************************************
//* Проект "Студгородок"                                                *
//* Добавление льготы                                                   * 
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit uSp_effective_area_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCalendar,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxControls, cxGridCustomView, cxGridDBTableView, cxGrid,
  Buttons, cxCheckBox, cxTextEdit, cxLabel, cxContainer, cxGroupBox,
  StdCtrls, cxButtons, FIBDataSet, pFIBDataSet, st_ConstUnit,
  uSp_effective_area_DM, st_common_funcs, iBase,
  st_Common_Messages, st_Consts_Messages, st_common_types, cxMaskEdit,
  cxDropDownEdit, cxButtonEdit, St_Loader_Unit;

type
  Tfrm_effective_area_AE = class(TForm)
    cxGroupBox1: TcxGroupBox;
    NameLabel: TcxLabel;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    Label_koef: TcxLabel;
    CurrencyEdit_koef: TcxCurrencyEdit;
    cxButtonEdit_Builds: TcxButtonEdit;
    DateEdit_beg: TcxDateEdit;
    DateEdit_end: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure MedCheckKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEdit_BuildsPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage;
  public
    aHandle : TISC_DB_HANDLE;
    is_admin : Boolean;
    id_build : Int64;
    DM : Tfrm_effective_area_DM;
    constructor Create(aOwner : TComponent; aHandle : TISC_DB_HANDLE; id_build : int64);reintroduce;
  end;

var
  frm_effective_area_AE: Tfrm_effective_area_AE;

implementation

{$R *.dfm}

procedure Tfrm_effective_area_AE.FormIniLanguage();
begin
  // индекс языка (1-укр, 2 - рус)
  PLanguageIndex:=            stLanguageIndex;

  //названия кнопок
  OKButton.Caption       := st_ConstUnit.st_Accept[PLanguageIndex];
  CancelButton.Caption   := st_ConstUnit.st_Cancel[PLanguageIndex];
end;

procedure Tfrm_effective_area_AE.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_effective_area_AE.OKButtonClick(Sender: TObject);
begin
  if cxButtonEdit_Builds.Text = '' then
   Begin
    ShowMessage('Необхідно обрати гуртожиток!');
    cxButtonEdit_Builds.SetFocus;
    exit;
   end;

  if DateEdit_end.EditValue <= DateEdit_beg.EditValue then
   Begin
    ShowMessage('Дата початку повинна бути менше дати закінчення!');
    DateEdit_beg.SetFocus;
    exit;
   end;

  if CurrencyEdit_koef.EditValue = 0 then
   Begin
    ShowMessage('Необхідно ввести коефіцієнт  житлової площі!');
    CurrencyEdit_koef.SetFocus;
    exit;
   end;
   
  ModalResult := mrOK;
end;

procedure Tfrm_effective_area_AE.MedCheckKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then OKButton.SetFocus;
end;

constructor Tfrm_effective_area_AE.Create(aOwner: TComponent;
  aHandle: TISC_DB_HANDLE; id_build: int64);
begin
  inherited Create(aOwner);

  self.id_build := id_build;

  self.aHandle := aHandle;

  DM := Tfrm_effective_area_DM.Create(self);
  DM.DB.Handle := aHandle;
  DM.DB.Connected := True;
  DM.Transaction_Read.StartTransaction;

  FormIniLanguage;
  
end;

procedure Tfrm_effective_area_AE.cxButtonEdit_BuildsPropertiesButtonClick(
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
     cxButtonEdit_Builds.Text := ResOpl[2];
   end;
end;

end.
