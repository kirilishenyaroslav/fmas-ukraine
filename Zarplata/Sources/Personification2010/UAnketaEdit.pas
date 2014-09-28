unit UAnketaEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxMaskEdit, cxButtonEdit, Ibase, ZProc, PackageLoad;

type
  TfrmAnketaEdit = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButtonEdit1: TcxButtonEdit;
    cxTextEdit1: TcxTextEdit;
    cxDateEdit1: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    TINText: TcxTextEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxTextEdit1Exit(Sender: TObject);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FDbHandle:TISC_DB_HANDLE;
    FIDMan:Int64;
    procedure GetMan;
  public
    { Public declarations }
    TIN:string[10];
    constructor Create(AOwner:TComponent;adate:TdateTime;DBHandle:TISC_DB_HANDLE);reintroduce;
  end;


implementation

uses DateUtils;

{$R *.dfm}

constructor TfrmAnketaEdit.Create(AOwner: TComponent; adate:TdateTime; DBHandle:TISC_DB_HANDLE);
begin
     inherited Create(Aowner);
     FDbHandle:=DBHandle;
     cxDateEdit1.EditValue:=DateUtils.StartOfTheMonth(IncMonth(date,-1));
end;

procedure TfrmAnketaEdit.GetMan;
var Man:Variant;
begin
      if cxTextEdit1.Text<>''
      then begin
                Man:=ManByTn(StrToInt(cxTextEdit1.Text),FDbHandle);
                if VarArrayDimCount(Man)>0
                then begin
                          try
                              FIDMan:=Man[0];
                              TIN   :=Man[3];
                              TINText.Text:=Man[3];
                              cxButtonEdit1.Text   :=Man[2];
                          except
                          end;
                end;
      end;
end;


procedure TfrmAnketaEdit.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmAnketaEdit.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmAnketaEdit.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Man:Variant;
begin
Man:=LoadPeopleModal(Self,FDbHandle);
if VarArrayDimCount(Man)> 0 then
If Man[0]<>NULL
then begin
          try
              FIDMan:=Man[0];
              TIN   :=Man[5];
              TINText.Text:=Man[5];
              cxButtonEdit1.Text   :=VarToStr(Man[1])+' '+VarToStr(Man[2])+' '+VarToStr(Man[3]);
              cxTextEdit1.Text     :=Man[4];
          except
          end
end;
end;

procedure TfrmAnketaEdit.cxTextEdit1Exit(Sender: TObject);
begin
     GetMan;
end;

procedure TfrmAnketaEdit.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
     if Key=#13 then GetMan;
end;

end.
