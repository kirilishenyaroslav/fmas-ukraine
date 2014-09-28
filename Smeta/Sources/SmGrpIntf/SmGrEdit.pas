unit SmGrEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, GlobalSpr, ibase;

type
  TfrmGrSmEdit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    edSmGrKod: TcxTextEdit;
    edSmGrTitle: TcxTextEdit;
    edSmGrEnable: TcxCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    cxButtonEdit1: TcxButtonEdit;
    Label3: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    FHandle:TISC_DB_HANDLE;

    { Private declarations }
  public
    { Public declarations }
    id_kekv:Variant;
    function CheckData:Boolean;
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;id_user:Int64);reintroduce;
  end;



implementation

uses BaseTypes;
{$R *.dfm}

function TfrmGrSmEdit.CheckData: Boolean;
var Res:Boolean;
begin
    Res:=true;
    if (edSmGrKod.Text='') and Res
    then begin
        agShowMessage('Треба ввести код групи');
        Res:=false;
    end;
    if (edSmGrTitle.Text='') and Res
    then begin
        agShowMessage('Треба ввести найменування групи');
        Res:=false;
    end;

    Result:=Res;

end;

constructor TfrmGrSmEdit.Create(AOwner: TComponent;
  DB_Handle: TISC_DB_HANDLE; id_user: Int64);
begin
     inherited Create(AOwner);
     FHandle:=DB_Handle;
     id_kekv:=null;
end;

procedure TfrmGrSmEdit.cxButton1Click(Sender: TObject);
begin
     if CheckData
     then ModalResult:=mrYes;
end;

procedure TfrmGrSmEdit.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmGrSmEdit.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res: Variant;
begin
    Res:=GlobalSpr.GetKEKVSpr(self,FHandle,fsNormal,Date,1);
    if VarArrayDimCount(Res)>0
    then begin
         ID_KEKV:=Res[0][0];
         cxButtonEdit1.Text:=VarToStr(Res[0][2])+' "'+VarToStr(Res[0][1])+'"';
    end;end;

end.
