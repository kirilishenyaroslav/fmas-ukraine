unit uHydrometerType_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ibase, cxControls, cxContainer, cxEdit, cxTextEdit, StdCtrls,
  cxLookAndFeelPainters, cxButtons, cxMemo, cxGroupBox, uConsts;

type
  TfrmHydrometerType_AE = class(TForm)
    NameLabel: TLabel;
    cxGroupBox1: TcxGroupBox;
    NameEdit: TcxTextEdit;
    CalibrLabel: TLabel;
    CalibrEdit: TcxTextEdit;
    MeasCalibrLabel: TLabel;
    MeasCalibrEdit: TcxTextEdit;
    CapacityLabel: TLabel;
    CapacityEdit: TcxTextEdit;
    AccuracyLabel: TLabel;
    AccuracyEdit: TcxTextEdit;
    NoteMemo: TcxMemo;
    NoteLabel: TLabel;
    FactoryLabel: TLabel;
    FactoryEdit: TcxTextEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure CalibrEditKeyPress(Sender: TObject; var Key: Char);
    procedure MeasCalibrEditKeyPress(Sender: TObject; var Key: Char);
  private
    PLanguageIndex : byte;
    procedure FormIniLanguage();
  public
       ID_NAME : int64;
       DB_Handle : TISC_DB_HANDLE;
       constructor Create(AOwner:TComponent; LanguageIndex : byte);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TfrmHydrometerType_AE.Create(AOwner:TComponent; LanguageIndex : byte);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AOwner);
  PLanguageIndex:= LanguageIndex;
  FormIniLanguage();
  Screen.Cursor:=crDefault;
  DecimalSeparator := ',';
end;

procedure TfrmHydrometerType_AE.FormIniLanguage;
begin
  NameLabel.caption          :=       uConsts.bs_name_hydrometer_type[PLanguageIndex];
  CalibrLabel.caption        :=       uConsts.bs_caliber_hydrometer[PLanguageIndex];
  MeasCalibrLabel.caption    :=       uConsts.bs_id_unit_meas[PLanguageIndex];
  CapacityLabel.caption      :=       uConsts.bs_capacity_hydrometer[PLanguageIndex];
  AccuracyLabel.caption      :=       uConsts.bs_accuracy_hydrometer[PLanguageIndex];
  NoteLabel.caption          :=       uConsts.bs_note_hydrometer[PLanguageIndex];
  FactoryLabel.caption       :=       uConsts.bs_factory_hydrometer[PLanguageIndex];
      
  OkButton.Caption           :=       uConsts.bs_Accept[PLanguageIndex];
  CancelButton.Caption       :=       uConsts.bs_Cancel[PLanguageIndex];
end;

procedure TfrmHydrometerType_AE.CancelButtonClick(Sender: TObject);
begin
    close;
end;

procedure TfrmHydrometerType_AE.OkButtonClick(Sender: TObject);
begin
   if (NameEdit.text = '') then
   begin
       ShowMessage('Необхідно заповнити назву типу водоміра !');
       NameEdit.SetFocus;
       exit;
   end;
   if (CalibrEdit.text = '') then
   begin
       ShowMessage('Необхідно заповнити одиниці калібр водоміра!');
       CalibrEdit.SetFocus;
       exit;
   end;
   if (MeasCalibrEdit.text = '') then
   begin
       ShowMessage('Необхідно заповнити одиниці виміру калібру водоміра!');
       MeasCalibrEdit.SetFocus;
       exit;
   end;
   if (CapacityEdit.text = '') then
   begin
       ShowMessage('Необхідно заповнити розрядність водоміра!');
       CapacityEdit.SetFocus;
       exit;
   end;
   if (AccuracyEdit.text = '') then
   begin
       ShowMessage('Необхідно заповнити точність водоміра!');
       AccuracyEdit.SetFocus;
       exit;
   end;
   if (FactoryEdit.text = '') then
   begin
       ShowMessage('Необхідно заповнити виробнкиа водоміра!');
       FactoryEdit.SetFocus;
       exit;
   end;
   {if (NoteMemo.text = '') then
   begin
       ShowMessage('Необхідно заповнити усі поля!');
       NoteMemo.SetFocus;
       exit;
   end; }

  ModalResult:=mrOk;
end;

procedure TfrmHydrometerType_AE.CalibrEditKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = '.' then Key := DecimalSeparator;

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
    then
        Key := Chr(0);
end;

procedure TfrmHydrometerType_AE.MeasCalibrEditKeyPress(Sender: TObject;
  var Key: Char);
begin
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then
        Key := Chr(0);
end;

end.
