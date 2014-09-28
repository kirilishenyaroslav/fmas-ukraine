unit EmailAddr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, Ibase,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxButtonEdit;

type
  TfrmEmailAddr = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    cxDateEdit2: TcxDateEdit;
    cxDateEdit1: TcxDateEdit;
    Label3: TLabel;
    cxButtonEdit1: TcxButtonEdit;
    cxButton3: TcxButton;
    Label4: TLabel;
    cxTextEdit1: TcxTextEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    FDbHandle:TISC_DB_HANDLE;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;dbhandle:TISC_DB_HANDLE;id_user:Int64);reintroduce;
  end;


implementation

uses DateUtils;

{$R *.dfm}

constructor TfrmEmailAddr.Create(AOwner: TComponent; dbhandle: TISC_DB_HANDLE; id_user: Int64);
begin
     inherited Create(AOwner);
     FDbHandle:=dbhandle;
     cxDateEdit1.Date:=StartOfTheYear(date);
     cxDateEdit2.Date:=StrToDate('31.12.9999');
end;

procedure TfrmEmailAddr.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmEmailAddr.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmEmailAddr.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
    /// <author></author>
end;

end.
