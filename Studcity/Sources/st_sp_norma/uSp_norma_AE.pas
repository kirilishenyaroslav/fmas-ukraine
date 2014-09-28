//***********************************************************************
//* Проект "Студгородок"                                                *
//* Добавление льготы                                                   * 
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit uSp_norma_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCalendar,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxControls, cxGridCustomView, cxGridDBTableView, cxGrid,
  Buttons, cxCheckBox, cxTextEdit, cxLabel, cxContainer, cxGroupBox,
  StdCtrls, cxButtons, FIBDataSet, pFIBDataSet, st_ConstUnit,
  uSp_norma_DM, st_common_funcs, iBase,
  st_Common_Messages, st_Consts_Messages, st_common_types, cxMaskEdit,
  cxDropDownEdit, cxButtonEdit, St_Loader_Unit, st_common_loader;

type
  Tfrm_norma_AE = class(TForm)
    cxGroupBox1: TcxGroupBox;
    NameLabel: TcxLabel;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    Label_norma: TcxLabel;
    CurrencyEdit_norma: TcxCurrencyEdit;
    ButtonEdit_Builds: TcxButtonEdit;
    DateEdit_beg: TcxDateEdit;
    DateEdit_end: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    Label_headcound: TcxLabel;
    CurrencyEdit_headcound: TcxCurrencyEdit;
    ComboBox_type_norma: TcxComboBox;
    cxLabel4: TcxLabel;
    ButtonEdit_service: TcxButtonEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure MedCheckKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEdit_BuildsPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEdit_servicePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure ComboBox_type_normaPropertiesChange(Sender: TObject);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage;
  public
    aHandle : TISC_DB_HANDLE;
    is_admin : Boolean;
    id_build : Int64;
    id_service : int64;
    id_type_norma: integer;
    DM : Tfrm_norma_DM;
    constructor Create(aOwner : TComponent; aHandle : TISC_DB_HANDLE; id_build : int64);reintroduce;
  end;

var
  frm_norma_AE: Tfrm_norma_AE;

implementation

{$R *.dfm}

procedure Tfrm_norma_AE.FormIniLanguage();
begin
  // индекс языка (1-укр, 2 - рус)
  PLanguageIndex:=            stLanguageIndex;

  //названия кнопок
  OKButton.Caption       := st_ConstUnit.st_Accept[PLanguageIndex];
  CancelButton.Caption   := st_ConstUnit.st_Cancel[PLanguageIndex];
end;

procedure Tfrm_norma_AE.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_norma_AE.OKButtonClick(Sender: TObject);
begin
  if (ButtonEdit_service.Text = '') then
   Begin
    ShowMessage('Необхідно обрати послугу!');
    ButtonEdit_service.SetFocus;
    exit;
   end;

  if (ButtonEdit_Builds.Text = '')  then
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

  if ((CurrencyEdit_norma.EditValue = 0) and (CurrencyEdit_norma.Visible)) then
   Begin
    ShowMessage('Необхідно ввести норму!');
    CurrencyEdit_norma.SetFocus;
    exit;
   end;

  if ((CurrencyEdit_headcound.EditValue = 0) and (CurrencyEdit_headcound.Visible)) then
   Begin
    ShowMessage('Необхідно ввести коеф. чисельності!');
    CurrencyEdit_norma.SetFocus;
    exit;
   end;

  ModalResult := mrOK;
end;

procedure Tfrm_norma_AE.MedCheckKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then OKButton.SetFocus;
end;

constructor Tfrm_norma_AE.Create(aOwner: TComponent;
  aHandle: TISC_DB_HANDLE; id_build: int64);
begin
  inherited Create(aOwner);

  self.id_build := id_build;

  self.aHandle := aHandle;

  DM := Tfrm_norma_DM.Create(self);
  DM.DB.Handle := aHandle;
  DM.DB.Connected := True;
  DM.Transaction_Read.StartTransaction;

  FormIniLanguage;
  
end;

procedure Tfrm_norma_AE.cxButtonEdit_BuildsPropertiesButtonClick(
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

procedure Tfrm_norma_AE.ButtonEdit_servicePropertiesButtonClick(
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

procedure Tfrm_norma_AE.FormShow(Sender: TObject);
var
  i : Integer;
begin
  DM.DataSet_read.Close;
  DM.DataSet_read.SQLs.SelectSQL.Text := 'select * from st_ini_type_norm';
  DM.DataSet_read.Open;
  DM.DataSet_read.FetchAll;
  DM.DataSet_read.First;

  ComboBox_type_norma.Properties.items.Clear;
  for i := 0 to DM.DataSet_read.RecordCount - 1 do
   Begin
    ComboBox_type_norma.Properties.items.Add(DM.DataSet_read['NAME_TYPE_NORMA']);
    DM.DataSet_read.Next;
   end;

  if DM.DataSet_read.RecordCount > 0 then
   Begin
    if id_type_norma = -1
     then ComboBox_type_norma.ItemIndex := 0
     else ComboBox_type_norma.ItemIndex := id_type_norma - 1;                                    
   end;
end;

procedure Tfrm_norma_AE.ComboBox_type_normaPropertiesChange(
  Sender: TObject);
begin
  if ((ComboBox_type_norma.ItemIndex = 0) or (ComboBox_type_norma.ItemIndex = 2)) then
   begin
    Label_norma.Visible := false;
    CurrencyEdit_norma.Visible := false;
    Label_headcound.Visible := false;
    CurrencyEdit_headcound.Visible := False;
   end;

  if ComboBox_type_norma.ItemIndex = 1 then
   begin
    Label_norma.Visible := true;
    CurrencyEdit_norma.Visible := true;
    Label_headcound.Visible := false;
    CurrencyEdit_headcound.Visible := False;
   end;

  if ComboBox_type_norma.ItemIndex = 3 then
   begin
    Label_norma.Visible := true;
    CurrencyEdit_norma.Visible := true;
    Label_headcound.Visible := true;
    CurrencyEdit_headcound.Visible := true;
   end;
end;

end.
