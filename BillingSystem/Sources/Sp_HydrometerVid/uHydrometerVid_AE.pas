unit uHydrometerVid_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, cxControls, cxGroupBox, cxButtons, ibase, uConsts;

type
  TfrmHydrometerVid_AE = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TLabel;
    NameEdit: TcxTextEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
  private
    PLanguageIndex : byte;
    procedure FormIniLanguage();
  public
       ID_NAME : int64;
       DB_Handle : TISC_DB_HANDLE;
       constructor Create(AOwner:TComponent; LanguageIndex : byte);reintroduce;
  end;

{var
  frmHydrometerVid_AE: TfrmHydrometerVid_AE;}

implementation

{$R *.dfm}

constructor TfrmHydrometerVid_AE.Create(AOwner:TComponent; LanguageIndex : byte);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AOwner);
  PLanguageIndex:= LanguageIndex;
  FormIniLanguage();
  Screen.Cursor:=crDefault;
  DecimalSeparator := ',';
end;

procedure TfrmHydrometerVid_AE.FormIniLanguage;
begin
  NameLabel.caption          :=       uConsts.bs_name_hydrometer_type[PLanguageIndex];
      
  OkButton.Caption           :=       uConsts.bs_Accept[PLanguageIndex];
  CancelButton.Caption       :=       uConsts.bs_Cancel[PLanguageIndex];
end;

procedure TfrmHydrometerVid_AE.CancelButtonClick(Sender: TObject);
begin
   close;
end;

procedure TfrmHydrometerVid_AE.OkButtonClick(Sender: TObject);
begin
   if (NameEdit.text = '') then
   begin
       ShowMessage('Необхідно заповнити назву виду водоміра !');
       NameEdit.SetFocus;
       exit;
   end;


  ModalResult:=mrOk;
end;

end.
