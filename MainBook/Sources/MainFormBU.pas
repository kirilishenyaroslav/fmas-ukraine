unit MainFormBU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, FIBDatabase, pFIBDatabase, ExtCtrls,
  ComCtrls, ImgList,TypInfo,IBase,DB,
  RxMemDS , GlobalSPR ;

type

TfrmMainFormBU = class(TForm)
    MainMenu1: TMainMenu;
    new1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    StatusBar1: TStatusBar;
    N7: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    Images: TImageList;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    Timer1: TTimer;
    N12: TMenuItem;
    N15: TMenuItem;
    HTML1: TMenuItem;
    N9: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N23: TMenuItem;
    N16: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var frmMainFormBU:TfrmMainFormBU;

implementation

uses dmMain_Bookbu;

{$R *.dfm}



procedure TfrmMainFormBU.N4Click(Sender: TObject);
begin
     Cascade;
end;

procedure TfrmMainFormBU.N5Click(Sender: TObject);
begin
          TileMode:=tbVertical;
          Tile;
end;

procedure TfrmMainFormBU.FormShow(Sender: TObject);
begin
          StatusBar1.Panels[1].Text:=dmMainbu.MainDatabase.DatabaseName;

end;

procedure TfrmMainFormBU.N6Click(Sender: TObject);
begin
     TileMode:=tbHorizontal;
     Tile;
end;

procedure TfrmMainFormBU.N22Click(Sender: TObject);
begin
   GetKEKVSpr(self, dmMainbu.MainDatabase.handle,fsMDIChild, dmmainbu.MAIN_BOOK_DATE, DEFAULT_ROOT_ID);
end;

procedure TfrmMainFormBU.FormClose(Sender: TObject;
  var Action: TCloseAction);
var  i:integer;
begin
  for i:=0 to self.MDIChildCount-1 do
  begin
     if (MDIChildren[i].Owner as TForm).Handle=self.Handle
     then begin
               MDIChildren[i].Release;
     end;
  end;

end;

procedure TfrmMainFormBU.FormCreate(Sender: TObject);
begin
     self.WindowMenu:=N3;
     SendMessage(handle,WM_SIZE,SIZE_MAXIMIZED,0);
end;

procedure TfrmMainFormBU.N21Click(Sender: TObject);
begin
   GetRazdStSpr(self, dmMainbu.MainDatabase.Handle,fsMDIChild, dmmainbu.MAIN_BOOK_DATE, DEFAULT_ROOT_ID,allData,cmNone);
end;

procedure TfrmMainFormBU.N20Click(Sender: TObject);
var Filter:TSmetaFilterValues;
begin
  Filter.DateFilter:=false;
  Filter.GroupFilter:=false;
   GetSmetaSpr(self, dmMainbu.MainDatabase.handle,fsMDIChild, dmmainbu.MAIN_BOOK_DATE,Filter);
end;



procedure TfrmMainFormBU.N30Click(Sender: TObject);
begin
    GlobalSPR.GetSmets(self,dmmainbu.MainDatabase.Handle,dmmainbu.MAIN_BOOK_DATE,psmSmet);
end;

procedure TfrmMainFormBU.N31Click(Sender: TObject);
begin
    GlobalSPR.GetSmets(self,dmmainbu.MainDatabase.Handle,dmmainbu.MAIN_BOOK_DATE,psmRazdSt);
end;


procedure TfrmMainFormBU.N40Click(Sender: TObject);
var i:integer;
begin
  for i:=self.MDIChildCount-1 downto 0 do
  begin
     if (MDIChildren[i].Owner as TForm).Handle=self.Handle
     then begin
               MDIChildren[i].Close;
     end;
  end;

end;

procedure TfrmMainFormBU.N2Click(Sender: TObject);
begin
    GlobalSPR.GetSmGrp(self,dmmainbu.MainDatabase.Handle,fsMdiChild,0);
end;

procedure TfrmMainFormBU.Timer1Timer(Sender: TObject);
var
   dc:HDC;
   Cc:TCanvas;
   s:string;
begin

  dc:=GetWindowDC(Handle);
  Cc:=TCanvas.Create;
  cc.Handle:=dc;
  s:=TimeToStr(time);
  cc.Brush.Color:=8388608;
  cc.Font.Size:=10;
  cc.Font.Color:=clWhite;
  cc.TextOut(Width div 2,5,s);
  ReleaseDc(Handle,dc);
end;

procedure TfrmMainFormBU.N11Click(Sender: TObject);
begin
   GlobalSPR.GetSmPKV(self,dmmainbu.MainDatabase.Handle,fsMdiChild,0);
end;

procedure TfrmMainFormBU.N15Click(Sender: TObject);
begin
      GetPropertiesSpr(self,dmMainbu.MainDatabase.Handle,dmmainbu.MAIN_BOOK_DATE);
end;

procedure TfrmMainFormBU.N10Click(Sender: TObject);
var Filter:TSmetaFilterValues;
begin
     Filter.DateFilter:=false;
     Filter.GroupFilter:=false;
     GlobalSpr.GetWorkSmetaReestrMdi(self,
                                     dmMainbu.MainDatabase.Handle,
                                     fsMdiChild,
                                     dmmainbu.MAIN_BOOK_DATE,
                                     Filter);
end;

procedure TfrmMainFormBU.N17Click(Sender: TObject);
begin
     GlobalSpr.PrintSmetPlusPeriods(self,dmMainbu.MainDatabase.Handle);
end;

procedure TfrmMainFormBU.N23Click(Sender: TObject);
begin
     GlobalSpr.Dotch(self,dmMainbu.MainDatabase.Handle);
end;

procedure TfrmMainFormBU.N24Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmMainFormBU.N14Click(Sender: TObject);
begin
     GlobalSpr.GetSysOptBu(self,dmMainbu.MainDatabase.Handle);
end;

end.
