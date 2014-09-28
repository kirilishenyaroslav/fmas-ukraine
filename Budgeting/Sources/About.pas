unit About;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo,
  ComCtrls, Dialogs;

type
  TAboutBox = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Panel2: TPanel;
    OKButton: TButton;
    cxMemo1: TcxMemo;
    Label1: TLabel;
    Label2: TLabel;
    procedure OKButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetVersionStrInfo:string;
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

function TAboutBox.GetVersionStrInfo:string;
var
    VerInfoSize: DWORD;
    VerInfo: Pointer;
    VerValueSize: DWORD;
    VerValue: PVSFixedFileInfo;
    Dummy: DWORD;
    V1,V2,V3,V4:DWORD;
begin
    VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
    if VerInfoSize = 0 then begin
            Dummy := GetLastError;
            ShowMessage(IntToStr(Dummy));
    end; {if}
    GetMem(VerInfo, VerInfoSize);
    GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
    VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
    with VerValue^ do begin
             V1 := dwFileVersionMS shr 16;
             V2 := dwFileVersionMS and $FFFF;
             V3 := dwFileVersionLS shr 16;
             V4 := dwFileVersionLS and $FFFF;
   end;
   FreeMem(VerInfo, VerInfoSize);
   GetVersionStrInfo:=' '+IntToStr(V1)+'.'+IntToStr(V2)+'.'+IntToStr(V3)+'.'+IntToStr(V4)+' ';
end;

procedure TAboutBox.FormCreate(Sender: TObject);
begin
     Label1.Caption:='Версія '+GetVersionStrInfo;
     if FileExists(ExtractFilepath(Application.ExeName)+'\'+'BU_Whats_new.txt')
     then cxMemo1.Lines.LoadFromFile(ExtractFilepath(Application.ExeName)+'\'+'BU_Whats_new.txt');
end;

end.
 
