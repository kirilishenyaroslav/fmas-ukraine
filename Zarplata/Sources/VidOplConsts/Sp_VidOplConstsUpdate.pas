unit Sp_VidOplConstsUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxMaskEdit, cxButtonEdit, ibase,
  Unit_ZGlobal_Consts, ZTypes, pFIBDatabase, FIBDatabase,
  cxLabel, ZProc, PackageLoad;

type
  TZFVidOplUpdate = class(TForm)
    EditVidOpl: TcxButtonEdit;
    CancelBtn: TcxButton;
    YesBtn: TcxButton;
    DB: TpFIBDatabase;
    RTransaction: TpFIBTransaction;
    cxLabel1: TcxLabel;
    LabelVidOplData: TcxLabel;    procedure Action1Execute(Sender: TObject);
    procedure EditVidOplClick(Sender: TObject);
  private

  public
    ID:variant;
    constructor Create(AOwner: TComponent;ComeDB:TISC_DB_HANDLE);reintroduce;
  end;

implementation
uses
  Sp_VidOplConsts;

{$R *.dfm}
constructor TZFVidOplUpdate.Create(AOwner: TComponent;ComeDB:TISC_DB_HANDLE);
begin
inherited Create(Aowner);

self.YesBtn.Caption                       := YesBtn_Caption[1];
self.CancelBtn.Caption                    := CancelBtn_Caption[1];
//******************************************************************************
DB.Handle := ComeDB;
RTransaction.StartTransaction;
end;

procedure TZFVidOplUpdate.Action1Execute(Sender: TObject);
begin
If EditVidOpl.Text<>'' then
begin
  ModalResult:=mrYes;
end
else EditVidOpl.SetFocus
end;

procedure TZFVidOplUpdate.EditVidOplClick(Sender: TObject);
var
  VidOpl:Variant;
begin
VidOPl:=LoadVidOpl(self,
                   DB.Handle,zfsModal,
                   ValueFieldZSetup(DB.Handle,'ID_VO_PROP_CURRENT'),
                   ValueFieldZSetup(DB.Handle,'Z_ID_SYSTEM'));
 if VarArrayDimCount(VidOpl)>0 then
  begin
   ID:=VidOpl[0];
   LabelVidOplData.Caption := VidOpl[1];
   EditVidOpl.Text := IntToStr(VidOpl[2]);
  end
 else
  EditVidOpl.SetFocus;
end;

end.
