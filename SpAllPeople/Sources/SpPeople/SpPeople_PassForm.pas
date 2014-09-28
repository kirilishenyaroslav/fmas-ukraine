unit SpPeople_PassForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, StdCtrls,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookAndFeelPainters, cxButtons,
  ExtCtrls, DB, FIBDataSet, pFIBDataSet, cxLookupEdit, IBase,
  cxDBLookupEdit, cxDBLookupComboBox, SpPeople_Types, FIBDatabase,
  pFIBDatabase, SpPeople_SpGranted, SpCommon;

type
  TfPassEdit = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    PasportPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    VidanDateEdit: TcxDateEdit;
    Label9: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    VidanEdit: TcxTextEdit;
    FamiliaEdit: TcxMaskEdit;
    ImyaEdit: TcxMaskEdit;
    OtchestvoEdit: TcxMaskEdit;
    RusOtchEdit: TcxMaskEdit;
    RusImyaEdit: TcxMaskEdit;
    RusFamEdit: TcxMaskEdit;
    NomerEdit: TcxMaskEdit;
    SeriaEdit: TcxMaskEdit;
    Label11: TLabel;
    PassTypeComboBox: TcxLookupComboBox;
    PassTypeDataSet: TpFIBDataSet;
    PassTypeDataSetID_PASS_TYPE: TFIBIntegerField;
    PassTypeDataSetPASS_TYPE_NAME: TFIBStringField;
    PassTypeDataSource: TDataSource;
    SelectVidanBtn: TcxButton;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    GrantPanel: TPanel;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure SelectVidanBtnClick(Sender: TObject);
  private
   function CheckData:Boolean;
  public
    FMode:TEditMode;
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AEditMode:TEditMode;APassInfo:TPassRec);reintroduce;
  end;

  function GetPassInfo(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AEditMode:TEditMode;var APassInfo:TPassRec):Boolean;
  // Возвращает TRUE, если изменения приняты, и в APassInfo - новые значения,
  // иначе - FALSE.

implementation

{$R *.dfm}

function GetPassInfo(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AEditMode:TEditMode;var APassInfo:TPassRec):Boolean;
var ViewForm:TfPassEdit;
begin
  Result:=False;
  ViewForm:=TfPassEdit.Create(AOwner,ADB_Handle,AEditMode,APassInfo);
  if ViewForm.ShowModal=mrOk then
  if (AEditMode=emNew) or (AEditMode=emModify)then
    begin
      APassInfo.Familia:=ViewForm.FamiliaEdit.Text;
      APassInfo.Imya:=ViewForm.ImyaEdit.Text;
      APassInfo.Otchestvo:=ViewForm.OtchestvoEdit.Text;
      APassInfo.RusFamilia:=ViewForm.RusFamEdit.Text;
      APassInfo.RusImya:=ViewForm.RusImyaEdit.Text;
      APassInfo.RusOtchestvo:=ViewForm.RusOtchEdit.Text;
      APassInfo.Seria:=ViewForm.SeriaEdit.Text;
      APassInfo.Number:=StrToInt(ViewForm.NomerEdit.Text);
      APassInfo.IdPassType:=ViewForm.PassTypeComboBox.EditValue;
      APassInfo.GrantDate:=ViewForm.VidanDateEdit.Date;
      APassInfo.GrantedBy:=ViewForm.VidanEdit.Text;
      Result:=True;
    end;
  ViewForm.Free;
end;

constructor TfPassEdit.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;AEditMode:TEditMode;APassInfo:TPassRec);
begin
  inherited Create(AOwner);
//******************************************************************************
  DB.Handle:=ADB_Handle;
  FMode:=AEditMode;
//******************************************************************************
  PassTypeDataSet.Open;
  if FMode=emView then
   begin
    PasportPanel.Enabled:=False;
    OkButton.Visible:=False;
   end;
  if FMode=emModify then
   begin
     VidanDateEdit.Properties.ReadOnly:=True;
   end;
//******************************************************************************
  case FMode of
    emNew    : Caption:='Паспортні дані:Додати';
    emModify : Caption:='Паспортні дані:Редагувати';
    emView   : begin
                 Caption:='Паспортні дані:Перегляд';
                 PasportPanel.Enabled:=False;
               end;
  end;
//******************************************************************************
  FamiliaEdit.Text:=APassInfo.Familia;
  ImyaEdit.Text:=APassInfo.Imya;
  OtchestvoEdit.Text:=APassInfo.Otchestvo;
  RusFamEdit.Text:=APassInfo.RusFamilia;
  RusImyaEdit.Text:=APassInfo.RusImya;
  RusOtchEdit.Text:=APassInfo.RusOtchestvo;
  SeriaEdit.Text:=APassInfo.Seria;
  NomerEdit.Text:=IntToStr(APassInfo.Number);
  VidanDateEdit.Date:=APassInfo.GrantDate;
  VidanEdit.Text:=APassInfo.GrantedBy;
  PassTypeComboBox.EditValue:=APassInfo.IdPassType;
end;

function TfPassEdit.CheckData:Boolean;
begin
   CheckData:=True;
   if FamiliaEdit.Text='' then
        begin
        MessageDlg('Не задано необхіднe поле'+''' Фамілія''',mtError,[mbOk],0);
        CheckData:=False;
        FamiliaEdit.SetFocus;
        Exit;
        end;
   if ImyaEdit.Text='' then
        begin
        MessageDlg('Не задано необхіднe поле'+''' Ім''я''',mtError,[mbOk],0);
        CheckData:=False;
        ImyaEdit.SetFocus;
        Exit;
        end;
   if OtchestvoEdit.Text='' then
        begin
        MessageDlg('Не задано необхіднe поле'+''' По батькові''',mtError,[mbOk],0);
        CheckData:=False;
        OtchestvoEdit.SetFocus;
        Exit;
        end;
    if RusFamEdit.Text='' then
        begin
        MessageDlg('Не задано необхіднe поле'+''' Фамилия''',mtError,[mbOk],0);
        CheckData:=False;
        RusFamEdit.SetFocus;
        Exit;
        end;
   if RusImyaEdit.Text='' then
        begin
        MessageDlg('Не задано необхіднe поле'+''' Имя''',mtError,[mbOk],0);
        CheckData:=False;
        RusImyaEdit.SetFocus;
        Exit;
        end;
   if RusOtchEdit.Text='' then
        begin
        MessageDlg('Не задано необхіднe поле'+''' Отчество''',mtError,[mbOk],0);
        CheckData:=False;
        RusOtchEdit.SetFocus;
        Exit;
        end;
   if (SeriaEdit.Text='') and (PassTypeComboBox.EditValue=1) then
        begin
        MessageDlg('Не задано необхіднe поле'+''' Серія''',mtError,[mbOk],0);
        CheckData:=False;
        SeriaEdit.SetFocus;
        Exit;
        end;
    if (NomerEdit.Text='') and (PassTypeComboBox.EditValue=1) then
        begin
        MessageDlg('Не задано необхіднe поле'+''' Номер''',mtError,[mbOk],0);
        CheckData:=False;
        NomerEdit.SetFocus;
        Exit;
        end;
    if (VidanEdit.Text='') and ( PassTypeComboBox.EditValue=1) then
        begin
        MessageDlg('Не задано необхіднe поле'+''' Ким виданий''',mtError,[mbOk],0);
        CheckData:=False;
        RusOtchEdit.SetFocus;
        Exit;
        end;
end;

procedure TfPassEdit.OkButtonClick(Sender: TObject);
begin
  if CheckData=True then
    begin
      ModalResult:=mrOk;
    end;
end;

procedure TfPassEdit.CancelButtonClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfPassEdit.SelectVidanBtnClick(Sender: TObject);
var s:String;
begin
  s:=GetVidanPlace(Self,DB.Handle);
  if s<>'' then
    VidanEdit.Text:=s;
end;

end.
