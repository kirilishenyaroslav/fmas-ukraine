unit NagScreenUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TNagScreen = class(TForm)
    Animate1: TAnimate;
    Label1: TLabel;
    StatusLabel: TLabel;
    procedure SetStatusText(S : String);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


{  TMyThread = class(TThread)
  private
    { Private declarations }
{    FormToRefresh : TNagScreen;
  protected
    procedure Execute; override;
    procedure DoRefresh;
  end;}


var
  NagScreen: TNagScreen;
  //Thread : TMyThread;

resourcestring
    NagCaption = 'Процесс триває...';

implementation

//Procedure TMyThread.Execute;
//begin
//    While not Terminated do
//    begin
        //Synchronize(DoRefresh);
//    end;
//end;

{procedure TMyThread.DoRefresh;
begin
    if FormToRefresh <> nil then
    with FormToRefresh do
    begin
       if Animate1 <> nil then
       begin
           Animate1.Refresh;
           Animate1.Repaint;
       end;
       FormToRefresh.Refresh;
       FormToRefresh.Repaint;
    end;
end;}

procedure TNagScreen.SetStatusText(S : String);
begin
    StatusLabel.Caption := S;
    Refresh;
    Repaint;
end;
{$R *.dfm}

procedure TNagScreen.FormCreate(Sender: TObject);
begin
    //Thread := TMyThread.Create(True);
    //Thread.FormToRefresh := Self;
    //Thread.Resume;
    Caption := NagCaption;
end;

procedure TNagScreen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    //Thread.Suspend;
    //Thread.DoTerminate;
    //Thread.Free;
    if FormStyle = fsMDIChild then action := caFree;
end;

end.
