unit PkEdit;

interface

uses
  SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, cxButtons,
  
  cxTextEdit, cxRadioGroup, cxButtonEdit, cxLookAndFeelPainters,
  cxMaskEdit, cxControls, cxContainer, cxEdit;

type
  TfrmSmPkvEdit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label1: TLabel;
    edSmPKVKod: TcxTextEdit;
    Label2: TLabel;
    edSmPKVTitle: TcxTextEdit;
    Label4: TLabel;
    Label5: TLabel;
    cxRadioGroup1: TcxRadioGroup;
    cxButtonEdit1: TcxButtonEdit;
    Label6: TLabel;
    KFK_TEXT: TcxTextEdit;
    KVK_TEXT: TcxTextEdit;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    ID_KEKV:Int64;
    function CheckData:Boolean;
    { Public declarations }
  end;


implementation

uses BaseTypes, GlobalSpr, PkvMain;
{$R *.dfm}

procedure TfrmSmPkvEdit.cxButton2Click(Sender: TObject);
begin
     if CheckData
     then ModalResult:=mrYes;
end;

procedure TfrmSmPkvEdit.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

function TfrmSmPkvEdit.CheckData: Boolean;
var Res:Boolean;
begin
    Res:=true;
    if (edSmPKVKod.Text='') and Res
    then begin
        BaseTypes.agMessageDlg('Увага!','Треба ввести код',mtError,[mbOk]);
        Res:=false;
    end;
    if (edSmPKVTitle.Text='') and Res
    then begin
        BaseTypes.agMessageDlg('Увага!','Треба ввести найменування',mtError,[mbOk]);
        Res:=false;
    end;
    if (KFK_TEXT.Text='') and Res
    then begin
        BaseTypes.agMessageDlg('Увага!','Треба ввести код КФК',mtError,[mbOk]);
        Res:=false;
    end;
    if (KVK_TEXT.Text='') and Res
    then begin
        BaseTypes.agMessageDlg('Увага!','Треба ввести код КВК',mtError,[mbOk]);
        Res:=false;
    end;

    if (ID_KEKV=-1) and Res
    then begin
        BaseTypes.agMessageDlg('Увага!','Треба ввести код видатків.',mtError,[mbOk]);
        Res:=false;
    end;

    Result:=Res;
end;

procedure TfrmSmPkvEdit.FormCreate(Sender: TObject);
begin
     ID_KEKV:=-1;
end;

procedure TfrmSmPkvEdit.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res: Variant;
begin
    Res:=GlobalSpr.GetKEKVSpr(self,TfrmSmPkvMain(self.owner).WorkDatabase.Handle,fsNormal,Date,1);
    if VarArrayDimCount(Res)>0
    then begin
         ID_KEKV:=Res[0][0];
         cxButtonEdit1.Text:=VarToStr(Res[0][2])+' "'+VarToStr(Res[0][1])+'"';
    end;
end;

end.
