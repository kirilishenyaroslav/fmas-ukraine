unit uSp_Norma_Copy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, iBase,
  St_Loader_Unit, uSp_norma_DM;

type
  Tfrm_Norma_Copy = class(TForm)
    ButtonEdit_build: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure ButtonEdit_buildPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton2Click(Sender: TObject);
  private
    DM : Tfrm_norma_DM;
  public
    id_build : int64;
    constructor Create(aOwner : TComponent; aDB_handle : TISC_DB_HANDLE); reintroduce;
  end;

var
  frm_Norma_Copy: Tfrm_Norma_Copy;

implementation

{$R *.dfm}

procedure Tfrm_Norma_Copy.cxButton1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrm_Norma_Copy.ButtonEdit_buildPropertiesButtonClick(
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
     ButtonEdit_build.Text := ResOpl[2];
   end;
end;

procedure Tfrm_Norma_Copy.cxButton2Click(Sender: TObject);
begin
  if ButtonEdit_build.Text = '' then
   Begin
    ShowMessage('Необхідно обрати гуртожиток!');
    ButtonEdit_build.SetFocus;
    Exit;
   end;
   
  ModalResult := mrOk;
end;

constructor Tfrm_Norma_Copy.Create(aOwner: TComponent;
  aDB_handle: TISC_DB_HANDLE);
begin
  inherited Create(aOwner);

  DM := Tfrm_norma_DM.Create(self);
  DM.DB.Handle := aDB_handle;
  DM.DB.Connected := true;
  DM.Transaction_Read.StartTransaction
end;

end.
