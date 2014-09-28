unit dogDisabled;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxLookAndFeelPainters, cxButtons, jpeg,
  cxControls, cxContainer, cxEdit, cxLabel;

type
  TfrmDisabled = class(TForm)
    Image1: TImage;
    cxButton1: TcxButton;
    NoteCaption: TcxLabel;
    TimeCaption: TcxLabel;
    NoteLabel: TcxLabel;
    TimeLabel: TcxLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    cc : Boolean;
    { Public declarations }
  end;

var
  frmDisabled: TfrmDisabled;

implementation

uses DataModule, DogUnit, Math;

{$R *.dfm}
procedure TfrmDisabled.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 CanClose := cc;
end;

procedure TfrmDisabled.FormCreate(Sender: TObject);
begin
 cc := False;
 NoteLabel.Caption := '';
 TimeLabel.Caption := '';
 dm.pFIBQuery1.Close;
 dm.pFIBQuery1.SQL.Text := 'select DOG_DISABLED_NOTE, DOG_ENABLED_TIME from dog_sys_options';
 dm.pFIBQuery1.ExecQuery;

 if dm.pFIBQuery1.RecordCount <> 0 then
 begin
   if not VarIsNull(dm.pFIBQuery1['DOG_DISABLED_NOTE'].Value) then NoteLabel.Caption := dm.pFIBQuery1['DOG_DISABLED_NOTE'].AsString;
   if NoteLabel.Caption = '' then
   begin
     NoteLabel.Visible := False;
     NoteCaption.Visible := False;
   end;
   if not VarIsNull(dm.pFIBQuery1['DOG_ENABLED_TIME'].Value) then TimeLabel.Caption := dm.pFIBQuery1['DOG_ENABLED_TIME'].AsString;
   if TimeLabel.Caption = '' then
   begin
     TimeCaption.Visible := False;
     TimeLabel.Visible := False;
   end;
 end;
end;

procedure TfrmDisabled.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TfrmDisabled.cxButton1Click(Sender: TObject);
begin
 MainForm.Close;
end;

procedure TfrmDisabled.Timer1Timer(Sender: TObject);
begin
{ dtime := dtime - 1;
 if dtime = 0 then
 begin
   Timer1.Enabled := False;
   TimeLabel.Caption := '¬рем€ вышло.';
   TimeCaption.Visible := False;
   TimeLabel.Visible := False;
   Exit;
 end;
 if dTime <= 60 then TimeLabel.Caption := IntToStr(dtime) + ' сек.';
 if (dTime > 60) and (dtime < 60*60) then
 begin
   TimeLabel.Caption := IntToStr(dtime div 60) + ' мин. ';
   if dtime mod 60 <> 0 then TimeLabel.Caption := TimeLabel.Caption + IntToStr(dtime mod 60) + ' сек.';
 end;
 if dtime >= 60 * 60 then
 begin
   TimeLabel.Caption := IntToStr(dtime div 60 div 60) + ' ч. ';
   if dtime div 60 mod 60 <> 0 then TimeLabel.Caption := TimeLabel.Caption + IntToStr(dtime div 60 mod 60) + ' мин. ';
   if dtime mod 60 <> 0 then TimeLabel.Caption := TimeLabel.Caption + IntToStr(dtime mod 60) + ' сек. ';
 end;}
end;

end.
