//***********************************************************************
//* Проект "Студгородок"                                                *
//* Добавление льготы                                                   * 
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit uSp_lgota_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCalendar,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxControls, cxGridCustomView, cxGridDBTableView, cxGrid,
  Buttons, cxCheckBox, cxTextEdit, cxLabel, cxContainer, cxGroupBox,
  StdCtrls, cxButtons, FIBDataSet, pFIBDataSet, st_ConstUnit,
  uSp_lgota_Persent_AE, uSp_Lgota_DM, st_common_funcs, iBase,
  st_Common_Messages, st_Consts_Messages, st_common_types, cxMaskEdit,
  cxDropDownEdit;

type
  Tfrm_Lgota_AE = class(TForm)
    cxGroupBox1: TcxGroupBox;
    KodLabel: TcxLabel;
    ShortEdit: TcxTextEdit;
    ShortNameLabel: TcxLabel;
    NameLabel: TcxLabel;
    NameEdit: TcxTextEdit;
    KodEdit: TcxTextEdit;
    GosCheck: TcxCheckBox;
    MedCheck: TcxCheckBox;
    cxGroupBox2: TcxGroupBox;
    TempDataSet: TpFIBDataSet;
    cxGroupBox3: TcxGroupBox;
    EditButton: TSpeedButton;
    AddButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    Label_percent: TcxLabel;
    CurrencyEdit_procent: TcxCurrencyEdit;
    Label_sum: TcxLabel;
    CurrencyEdit_sum: TcxCurrencyEdit;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure KodEditKeyPress(Sender: TObject; var Key: Char);
    procedure ShortEditKeyPress(Sender: TObject; var Key: Char);
    procedure GosCheckKeyPress(Sender: TObject; var Key: Char);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure MedCheckKeyPress(Sender: TObject; var Key: Char);
    procedure DeleteButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    id_lgot : Int64;
    procedure FormIniLanguage;
  public
    aHandle : TISC_DB_HANDLE;
    is_admin : Boolean;
    DM : TfrmLgot_DM;
    constructor Create(aOwner : TComponent; aHandle : TISC_DB_HANDLE; id_lgot : int64);reintroduce;
  end;

var
  frm_Lgota_AE: Tfrm_Lgota_AE;

implementation

uses cxButtonEdit;
{$R *.dfm}

procedure Tfrm_Lgota_AE.FormIniLanguage();
begin
  // индекс языка (1-укр, 2 - рус)
  PLanguageIndex:=            stLanguageIndex;

  //названия кнопок
  OKButton.Caption       := st_ConstUnit.st_Accept[PLanguageIndex];
  CancelButton.Caption   := st_ConstUnit.st_Cancel[PLanguageIndex];
  KodLabel.Caption       := st_ConstUnit.st_LgCode[PLanguageIndex];
  ShortNameLabel.Caption := st_ConstUnit.st_ShortLable[PLanguageIndex];
  NameLabel.Caption      := st_ConstUnit.st_NameLable[PLanguageIndex];
  Label_percent.Caption  := st_ConstUnit.st_Percent[PLanguageIndex];

  GosCheck.Properties.Caption := st_ConstUnit.st_Gos[PLanguageIndex];
  MedCheck.Properties.Caption := st_ConstUnit.st_Med[PLanguageIndex];
  cxGroupBox2.Caption         := st_ConstUnit.st_LgPerc[PLanguageIndex];

  AddButton.Hint:=       st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
  EditButton.Hint:=      st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
  DeleteButton.Hint:=    st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];

  cxGrid1DBTableView1DBColumn1.Caption     := st_ConstUnit.st_NameLable[PLanguageIndex];
  cxGrid1DBTableView1DBColumn2.Caption  := st_ConstUnit.st_PercentOnly[PLanguageIndex];
end;

procedure Tfrm_Lgota_AE.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Lgota_AE.FormShow(Sender: TObject);
begin
  KodEdit.SetFocus;
end;

procedure Tfrm_Lgota_AE.FormCreate(Sender: TObject);
var
  i : Integer; 
begin
  cxGrid1DBTableView1.DataController.DataSource := DM.DataSource_MD;

  FormIniLanguage();
end;

procedure Tfrm_Lgota_AE.OKButtonClick(Sender: TObject);
var
  i : integer;
  proc : Double;
begin
  // проверка корректности заполнения формы
  if not IntegerCheck(KodEdit.Text) then
   begin
    ShowMessage(pchar(st_ConstUnit.st_mess_Code_need[PLanguageIndex]));
    KodEdit.SetFocus;
    exit;
   end;

  if frmLgota_Procent_AE.Caption = st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex] then
   begin
    TempDataSet.Active := true;
    if TempDataSet.Locate('NUM_LG',StrToInt(KodEdit.Text), []) = true then
     begin
      ShowMessage(pchar(st_ConstUnit.st_LgCodeExists[PLanguageIndex]));
      KodEdit.SetFocus;
      TempDataSet.Active:=false;
      exit;
     end;
     TempDataSet.Active:=false;
   end;

  If ShortEdit.Text = '' then
   begin
    ShowMessage(pchar(st_ConstUnit.st_mess_ShortName_need[PLanguageIndex]));
    ShortEdit.SetFocus;
    exit;
   end;

  If NameEdit.Text = '' then
   begin
    ShowMessage(pchar(st_ConstUnit.st_mess_FullName_need[PLanguageIndex]));
    NameEdit.SetFocus;
    exit;
   end;

  If DM.MemoryData.RecordCount = 0 then
   Begin
    ShowMessage('Небхідно обрати послугу!');
    exit;
   end;

  proc := 0; DM.MemoryData.First;
  For i := 0 to DM.MemoryData.RecordCount - 1 do
   Begin
    if  DM.MemoryData['md_procent'] <> null
     then proc := proc + DM.MemoryData['md_procent'];
    DM.MemoryData.Next;
   End;
   proc := proc / DM.MemoryData.RecordCount;

  if CurrencyEdit_procent.EditValue <> proc then
   begin
    ShowMessage('Відсоток не співпадає!');
    CurrencyEdit_procent.SetFocus;
    exit;
   end;

  if CurrencyEdit_sum.EditValue <> cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[0] then
   begin
    ShowMessage('Сума не співпадає!');
    CurrencyEdit_sum.SetFocus;
    exit;
   end;

  ModalResult := mrOK;
end;

procedure Tfrm_Lgota_AE.AddButtonClick(Sender: TObject);
var 
  i: integer;
  ViewForm : TfrmLgota_Procent_AE;
  aParameter : TstSimpleParams;
  res : Variant;
begin
  ViewForm := TfrmLgota_Procent_AE.Create(Self);
  ViewForm.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];

  ViewForm.aHandle := aHandle;
  ViewForm.is_admin := is_admin;
  
  If ViewForm.ShowModal = mrOK then
   begin
    DM.MemoryData.Open;
    DM.MemoryData.Insert;
    DM.MemoryData.FieldByName('md_id_serves').AsInteger    := ViewForm.id_serves;
    DM.MemoryData.FieldByName('md_name_serves').AsString   := ViewForm.Button_name.Text;
    if ViewForm.RadioButton_procent.Checked
     then
      begin
       DM.MemoryData.FieldByName('md_procent').AsFloat := ViewForm.PercentEdit.EditValue;
       DM.MemoryData.FieldByName('md_sum').AsVariant   := null;
      End
     else
      begin
       DM.MemoryData.FieldByName('md_sum').AsFloat       := ViewForm.PercentEdit.EditValue;
       DM.MemoryData.FieldByName('md_procent').AsVariant := null;
      End;
    DM.MemoryData.Post;

    EditButton.Enabled := True;
    DeleteButton.Enabled := True;
   end;
   
  ViewForm.Free;
end;

procedure Tfrm_Lgota_AE.KodEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then ShortEdit.SetFocus;
end;

procedure Tfrm_Lgota_AE.ShortEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then NameEdit.SetFocus;
end;

procedure Tfrm_Lgota_AE.GosCheckKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then MedCheck.SetFocus;
end;

procedure Tfrm_Lgota_AE.NameEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then GosCheck.SetFocus;
end;

procedure Tfrm_Lgota_AE.MedCheckKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then OKButton.SetFocus;
end;

procedure Tfrm_Lgota_AE.DeleteButtonClick(Sender: TObject);
var
  i : byte;
begin
  i := st_Common_Messages.stShowMessage(st_Confirmation_Caption[PLanguageIndex], st_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  DM.MemoryData.Delete;

  if DM.MemoryData.RecordCount = 0 then
   begin
    EditButton.Enabled   := False;
    DeleteButton.Enabled := False;
   end;
end;

procedure Tfrm_Lgota_AE.EditButtonClick(Sender: TObject);
var
  i : integer;
  ViewForm : TfrmLgota_Procent_AE;
begin
  ViewForm := TfrmLgota_Procent_AE.Create(Self);

  ViewForm.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
  ViewForm.aHandle := aHandle;
  ViewForm.is_admin := is_admin;

  ViewForm.Button_name.Text      := DM.MemoryData['md_name_serves'];
  ViewForm.id_serves             := DM.MemoryData['md_id_serves'];
  If DM.MemoryData['md_procent'] <> null then
   begin
    ViewForm.PercentEdit.EditValue := DM.MemoryData['md_procent'];
    ViewForm.RadioButton_procent.Checked := True;
   end;

  If DM.MemoryData['md_sum'] <> null then
   begin
    ViewForm.PercentEdit.EditValue := DM.MemoryData['md_sum'];
    ViewForm.RadioButton_sum.Checked := True;
   end;

  If ViewForm.ShowModal = mrOK then
   begin
    DM.MemoryData.Edit;
    DM.MemoryData.FieldByName('md_id_serves').AsInteger    := ViewForm.id_serves;
    DM.MemoryData.FieldByName('md_name_serves').AsString   := ViewForm.Button_name.Text;
    if ViewForm.RadioButton_procent.Checked
     then
      begin
       DM.MemoryData.FieldByName('md_procent').AsFloat := ViewForm.PercentEdit.EditValue;
       DM.MemoryData.FieldByName('md_sum').AsVariant   := null;
      End
     else
      begin
       DM.MemoryData.FieldByName('md_sum').AsFloat       := ViewForm.PercentEdit.EditValue;
       DM.MemoryData.FieldByName('md_procent').AsVariant := null;
      End;
    DM.MemoryData.Post;
   end;
  ViewForm.Free;
end;

constructor Tfrm_Lgota_AE.Create(aOwner: TComponent;
  aHandle: TISC_DB_HANDLE; id_lgot: int64);
var
  i : Integer;
begin
  inherited Create(aOwner);

  self.id_lgot := id_lgot;

  self.aHandle := aHandle;

  DM := TfrmLgot_DM.Create(self);
  DM.DB.Handle := aHandle;
  DM.DB.Connected := True;
  DM.Transaction_Read.StartTransaction;

  DM.DataSet_read.Close;
  DM.DataSet_read.SQLs.SelectSQL.Text := 'Select * from ST_SP_LGOT_SUM_SELECT(:id_lgot)';
  DM.DataSet_read.ParamByName('ID_LGOT').AsInteger := id_lgot;
  DM.DataSet_read.Open;
  DM.DataSet_read.FetchAll;
  DM.DataSet_read.First;

  DM.MemoryData.Open;
  for i := 0 to DM.DataSet_read.RecordCount - 1 do
   begin
    DM.MemoryData.Insert;
    DM.MemoryData['md_ID_SERVES']   := DM.DataSet_read['ID_SERVES'];
    If DM.DataSet_read['procent'] <> 0
     then DM.MemoryData['md_procent'] := DM.DataSet_read['procent']
     else DM.MemoryData['md_procent'] := null;

    if DM.DataSet_read['SUMMA'] <> 0
     then DM.MemoryData['md_sum'] := DM.DataSet_read['SUMMA']
     else DM.MemoryData['md_sum'] := null;
     
    DM.MemoryData['md_name_serves'] := DM.DataSet_read['Name_serves'];
    DM.MemoryData.Post;

    DM.DataSet_read.next;
   end;
  Dm.MemoryData.First;

  if DM.MemoryData.RecordCount <> 0 then
   Begin
    EditButton.Enabled := True;
    DeleteButton.Enabled := True;
   end;
end;

end.
