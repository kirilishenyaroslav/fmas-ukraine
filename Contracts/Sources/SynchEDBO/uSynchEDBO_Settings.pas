unit uSynchEDBO_Settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxLabel, cxLookAndFeelPainters, StdCtrls, cxButtons, iBase,
  DM_SynchEDBO;

type
  TfrmSynchEDBO_Settings = class(TForm)
    ButtonEdit_season: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxButton1: TcxButton;
    cxLabel2: TcxLabel;
    ButtonEdit_academic_Year: TcxButtonEdit;
    cxLabel3: TcxLabel;
    ButtonEdit_kod_university: TcxButtonEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    DM : TDM_synch;
  public
    constructor create(aOwner :TComponent; DB_Handle : TISC_DB_HANDLE); overload;
  end;

var
  frmSynchEDBO_Settings: TfrmSynchEDBO_Settings;

implementation

{$R *.dfm}

constructor TfrmSynchEDBO_Settings.create(aOwner: TComponent;
  DB_Handle: TISC_DB_HANDLE);
begin
  inherited create(aowner);

  DM := TDM_synch.Create(self);
  DM.DB.Handle := DB_Handle;
  DM.DB.Open;
  DM.ReadTransaction.StartTransaction;
end;

procedure TfrmSynchEDBO_Settings.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmSynchEDBO_Settings.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ButtonEdit_season.Text = '' then Exit;
  DM.WriteTransaction.StartTransaction;
  DM.StProc.StoredProcName := 'CN_WEB_INI_UPDATE';
  DM.StProc.Prepare;
  DM.StProc.ParamByName('ID_SEASON').AsInteger       := StrToInt(ButtonEdit_season.Text);
  DM.StProc.ParamByName('Id_AcademicYear').AsInteger := StrToInt(ButtonEdit_academic_Year.Text);
  DM.StProc.ParamByName('KOD_UNIVERSITY').AsString   := ButtonEdit_kod_university.Text;
  DM.StProc.ExecProc;
  DM.WriteTransaction.Commit;
end;

end.
