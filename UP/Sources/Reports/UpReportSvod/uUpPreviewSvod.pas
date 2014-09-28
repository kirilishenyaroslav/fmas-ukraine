unit uUpPreviewSvod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxCheckBox, cxGroupBox;

type
  TfmPrev = class(TForm)
    ActionList1: TActionList;
    OKAction: TAction;
    CancelAction: TAction;
    cxButtonParam: TcxButton;
    cxButtonDraft: TcxButton;
    cbFund: TcxCheckBox;
    Panel1: TPanel;
    cbZpCat: TcxCheckBox;
    cbHol: TcxCheckBox;
    cbPodNal: TcxCheckBox;
    cbProgul: TcxCheckBox;
    cbChPersCat: TcxCheckBox;
    cbWorkTime: TcxCheckBox;
    cbPersZp: TcxCheckBox;
    cbCertificate: TcxCheckBox;
    gbZvit: TcxGroupBox;
    UnCheck: TcxButton;
    Check: TcxButton;
    gbZvitReal: TcxGroupBox;
    UnCheckReal: TcxButton;
    CheckReal: TcxButton;
    cbProgulReal: TcxCheckBox;
    cbChPersCatReal: TcxCheckBox;
    cbWorkTimeReal: TcxCheckBox;
    cbCertificateReal: TcxCheckBox;
    cbRachNach: TcxCheckBox;
    procedure UnCheckClick(Sender: TObject);
    procedure CheckClick(Sender: TObject);
    procedure UnCheckRealClick(Sender: TObject);
    procedure CheckRealClick(Sender: TObject);
    procedure OKActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrev: TfmPrev;

implementation

{$R *.dfm}

procedure TfmPrev.UnCheckClick(Sender: TObject);
begin
    cbFund.Checked:=False;
    cbZpCat.Checked:=False;
    cbHol.Checked:=False;
    cbPodNal.Checked:=False;
    cbProgul.Checked:=False;
    cbChPersCat.Checked:=False;
    cbWorkTime.Checked:=False;
    cbPersZp.Checked:=False;
    cbCertificate.Checked:=False;
end;

procedure TfmPrev.CheckClick(Sender: TObject);
begin
    cbFund.Checked:=True;
    cbZpCat.Checked:=True;
    cbHol.Checked:=True;
    cbPodNal.Checked:=True;
    cbProgul.Checked:=True;
    cbChPersCat.Checked:=True;
    cbWorkTime.Checked:=True;
    cbPersZp.Checked:=True;
    cbCertificate.Checked:=True;
end;

procedure TfmPrev.UnCheckRealClick(Sender: TObject);
begin
    cbProgulReal.Checked:=False;
    cbChPersCatReal.Checked:=False;
    cbWorkTimeReal.Checked:=False;
    cbCertificateReal.Checked:=False;
end;

procedure TfmPrev.CheckRealClick(Sender: TObject);
begin
    cbProgulReal.Checked:=True;
    cbChPersCatReal.Checked:=True;
    cbWorkTimeReal.Checked:=True;
    cbCertificateReal.Checked:=True;
end;

procedure TfmPrev.OKActionExecute(Sender: TObject);
begin
    ModalResult:=mrOk;
end;

procedure TfmPrev.CancelActionExecute(Sender: TObject);
begin
    ModalResult:=mrNo;
end;

end.
