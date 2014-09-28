unit USetDefBudget;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, ExtCtrls;

type
  TfrmGetDefBudget = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButtonEdit1: TcxButtonEdit;
    Label1: TLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    DEF_ID_SM:Int64;
    { Public declarations }
  end;


implementation

uses SmGrMain,  GlobalSPR;

{$R *.dfm}

procedure TfrmGetDefBudget.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmGetDefBudget.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmGetDefBudget.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
begin
              Res:=GlobalSPR.GetSmets(self,
                                 TfrmSmetaGroup(Owner).WorkDatabase.Handle,
                                 Date,
                                 psmSmet);
              if (VarArrayDimCount(Res)>0)
              then begin
                                   DEF_ID_SM:=Res[0];
                                   cxButtonEdit1.Text:=VarToStr(Res[3])+' "'+VarToStr(Res[2])+'"';
              end;

end;

end.
