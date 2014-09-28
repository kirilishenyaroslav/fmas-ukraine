unit MainFormHtml;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, FIBDatabase, pFIBDatabase, ExtCtrls,
  ComCtrls, ImgList,TypInfo,IBase,DB,
  RxMemDS , GlobalSPR, SysAdmin;

type

TfrmMainFormHtml = class(TForm)
    StatusBar1: TStatusBar;
    Images: TImageList;
    Timer1: TTimer;
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    id_user:Integer;
  end;

var frmMainFormHtml:TfrmMainFormHtml;

implementation

uses dmMain_BookHtml;

{$R *.dfm}



procedure TfrmMainFormHtml.N4Click(Sender: TObject);
begin
     Cascade;
end;

procedure TfrmMainFormHtml.N5Click(Sender: TObject);
begin
          TileMode:=tbVertical;
          Tile;
end;

procedure TfrmMainFormHtml.FormShow(Sender: TObject);
begin
          StatusBar1.Panels[1].Text:=dmMainHtml.MainDatabase.DatabaseName;
          Timer1.Enabled:=true;

         InitializaAdminSystem(self,
                     dmmainhtml.MainDatabase.Handle,
                     331, dmmainhtml.id_user_dm);

end;

procedure TfrmMainFormHtml.FormCreate(Sender: TObject);
begin
          SendMessage(handle,WM_SIZE,SIZE_MAXIMIZED,0);
end;

procedure TfrmMainFormHtml.Timer1Timer(Sender: TObject);
begin
     ShowHtmlReport(self,dmMainHtml.MainDatabase.Handle,id_user);
     Timer1.Enabled:=false;     
end;

procedure TfrmMainFormHtml.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     FinalizeAdminSystem;
end;

end.
