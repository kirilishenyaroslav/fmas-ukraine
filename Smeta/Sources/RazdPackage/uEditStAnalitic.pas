unit uEditStAnalitic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDropDownEdit, cxCalendar, StdCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxButtons, ExtCtrls, Ibase, ActnList;

type
  TfrmStAnaliticInfo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButtonEdit1: TcxButtonEdit;
    Label1: TLabel;
    cxDateEdit1: TcxDateEdit;
    Label2: TLabel;
    cxDateEdit2: TcxDateEdit;
    Label3: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
  private
    { Private declarations }
    DB_Handle:TISC_DB_HANDLE;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE); reintroduce;
  end;


implementation

uses GlobalSPR, DateUtils;

{$R *.dfm}

constructor TfrmStAnaliticInfo.Create(AOwner: TComponent;
  DBHandle: TISC_DB_HANDLE);
begin
     inherited Create(Aowner);
     DB_Handle:=DBHandle;
     cxDateEdit1.Date:=StartOfTheMonth(Date);
end;

procedure TfrmStAnaliticInfo.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
begin
     Res:=GlobalSPR.GetEnums(self,DB_Handle,fsNormal);

     if VarArrayDimCount(Res)>0
     then begin
               cxButtonEdit1.Text:=VarAsType(Res[2], varString)+'"'+VarAsType(Res[1], varString)+'"';
               cxButtonEdit1.Tag:=Res[0];

     end;
end;

procedure TfrmStAnaliticInfo.cxButton1Click(Sender: TObject);
begin
     if cxButtonEdit1.Tag<>0
     then ModalResult:=mrYes;
end;

procedure TfrmStAnaliticInfo.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmStAnaliticInfo.Action3Execute(Sender: TObject);
begin
     cxButtonEdit1PropertiesButtonClick(Self,0);
end;

end.
