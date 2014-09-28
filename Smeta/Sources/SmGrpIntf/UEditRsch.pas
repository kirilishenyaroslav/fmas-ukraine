unit UEditRsch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, LoadDogManedger, cxCheckBox;

type
  TfrmGetSchInfo = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    rateaccounttext: TcxButtonEdit;
    DateBeg: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    mfotext: TcxTextEdit;
    mfoname: TcxTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    DateEnd: TcxDateEdit;
    Label5: TLabel;
    isDefault: TcxCheckBox;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_sch:int64;
  end;



implementation

uses SmGrMain, GlobalSpr, dateutils;

{$R *.dfm}

procedure TfrmGetSchInfo.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmGetSchInfo.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmGetSchInfo.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  ret: Variant;
  rate_acc_un:Variant;
begin
     if VarIsClear(rate_acc_un) then rate_acc_un := -1;

     ret := LoadDogManedger.WorkSpMfoRsch(self, TfrmSmetaGroup(Self.Owner).WorkDatabase.Handle, fsNormal, 'get', rate_acc_un);
     if VarArrayDimCount(ret) > 0 then
     begin
          if ret[0][0] > 0
          then begin
                    id_sch               := ret[0][0];
                    mfotext.Text         := ret[0][2];
                    rateaccounttext.Text := ret[0][3];
                    mfoname.Text         := ret[0][4];
          end;
     end;
end;

procedure TfrmGetSchInfo.FormCreate(Sender: TObject);
begin
     DateBeg.Date:=dateutils.StartOfTheMonth(Date);

end;

end.
