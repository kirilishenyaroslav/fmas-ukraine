{******************************************************************************}
{                                                                              }
{                           (c) Klug , 2002-2004                               }
{                                                                              }
{******************************************************************************}

{                      Пакет "Конвертирование данных"                          }
{            Модуль фрейма                                                     }
{                                               ответственный: Тимофеев Антон  }
unit U_ExpImpFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, FIBDatabase, pFIBDatabase, cxControls, IniFiles,
  cxContainer, cxEdit, cxTextEdit, cxMemo, Buttons, Mask, ToolEdit, DMMain,
  Gauges, CheckLst, IBase;

type
  TExpImpFr = class(TFrame)
    CLBSections: TCheckListBox;
    Panel1: TPanel;
    IniName: TFilenameEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    MemoLog: TcxMemo;
    ProgressBar: TGauge;
    procedure BitBtn1Click(Sender: TObject);
    procedure Import(Handle:TISC_DB_HANDLE);
    procedure Stop;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FrameConstrainedResize(Sender: TObject; var MinWidth,
      MinHeight, MaxWidth, MaxHeight: Integer);
  private
    { Private declarations }
  public
    ini:TiniFile;
    { Public declarations }
  end;

var ExpTh: TExpThread;

implementation

{$R *.dfm}

procedure TExpImpFr.BitBtn1Click(Sender: TObject);
begin
  if (IniName.FileName<>'')
   then begin
     BItBtn2.Enabled:=True;
     BItBtn3.Enabled:=True;
     ini:=TIniFile.Create(IniName.FileName);
     ini.ReadSections(CLBSections.Items);
     CLBSections.Items.Delete(0);
   end;

end;

procedure TExpImpFr.Import(Handle:TISC_DB_HANDLE);
var textlog:string;
begin
  CLBSections.Enabled:=False;
  ExpTh:=TExpThread.create(IniName.FileName,ProgressBar,MemoLog,CLBSections,Handle,Self);
  BItBtn1.Enabled:=False;
  BItBtn2.Enabled:=False;
  BItBtn3.Enabled:=False;
  //ExpTh.Execute;
  CLBSections.Enabled:=True;
  BitBtn1.Enabled:=True;
  BitBtn2.Enabled:=True;
  BitBtn3.Enabled:=True;
  try
    DateTimeToString(textlog,'dd-mm-yyy_hh-nn-ss',now);
    textlog := 'exporter ' + textlog;
    Memolog.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+textlog+'.log');
  except
  end;
end;

procedure TExpImpFr.Stop;
var textlog:string;
begin
  if ExpTh<>nil then
   ExpTh.Terminate;
  try
    DateTimeToString(textlog,'dd-mm-yyy_hh-nn-ss',now);
    textlog := 'exporter ' + textlog;
    Memolog.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+textlog+'.log');
  except
  end;
  CLBSections.Enabled:=True;
  BitBtn1.Enabled:=True;
  BitBtn2.Enabled:=True;
  BitBtn3.Enabled:=True;
end;

procedure TExpImpFr.BitBtn2Click(Sender: TObject);
VAR   i, scol:integer;
begin
  scol:=CLBSections.Items.Count;
  for i:=0 to scol-1 do
    CLBSections.Checked[i]:=True;
end;

procedure TExpImpFr.BitBtn3Click(Sender: TObject);
VAR   i, scol:integer;
begin
  scol:=CLBSections.Items.Count;
  for i:=0 to scol-1 do
    CLBSections.Checked[i]:=False;
end;

procedure TExpImpFr.FrameConstrainedResize(Sender: TObject; var MinWidth,
  MinHeight, MaxWidth, MaxHeight: Integer);
begin
  IniName.InitialDir:=ExtractFilePath(Application.ExeName);
end;

end.
