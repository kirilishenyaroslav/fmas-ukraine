unit SmGlobalWizardForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, ComCtrls, cxLookAndFeelPainters, cxControls, cxContainer,
  cxEdit, cxLabel, StdCtrls, cxButtons, ExtCtrls, jpeg, cxImage,
  FIBDatabase, pFIBDatabase, RxGIF, ShellApi;

type
  TfrmSmGlobalWizard = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    Workdatabase: TpFIBDatabase;
    ReadTransaction:TpFibTransaction;
    cxLabel8: TcxLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    cxLabel11: TcxLabel;
    Button10: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton1GetDrawParams(Sender: TcxCustomButton;
      AState: TcxButtonState; var AColor: TColor; AFont: TFont);
    procedure cxButton2GetDrawParams(Sender: TcxCustomButton;
      AState: TcxButtonState; var AColor: TColor; AFont: TFont);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    LocalId_user:Int64;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DBHanlde:TISC_DB_HANDLE;id_user:Int64; FirstOnce:Integer);reintroduce;
  end;

implementation

{$R *.dfm}

uses GlobalSpr, USmetsContainer, UCreateByShablon, UGetNewSmWay, USmModifyWay;

constructor TfrmSmGlobalWizard.Create(AOwner: TComponent; DBHanlde: TISC_DB_HANDLE; id_user: Int64;FirstOnce:Integer);
var I:Integer;
begin
     inherited Create(AOwner);

     Workdatabase.Handle:=DBHanlde;
     ReadTransaction.StartTransaction;

     PageControl1.ActivePageIndex:=0;
     if (FirstOnce=1)
     then begin
               TabSheet1.TabVisible:=True;
               for I:=1 to PageControl1.PageCount-1 do
               begin
                    PageControl1.Pages[i].TabVisible:=False;
               end;
     end
     else begin
               TabSheet1.TabVisible:=False;
               for I:=1 to PageControl1.PageCount-1 do
               begin
                    PageControl1.Pages[i].TabVisible:=True;
               end;
     end;
     LocalId_user:=id_user;

end;

procedure TfrmSmGlobalWizard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmSmGlobalWizard.cxButton2Click(Sender: TObject);
begin
     SendMessage(Application.Handle,WM_CLOSE,0,0);
end;

procedure TfrmSmGlobalWizard.cxButton1Click(Sender: TObject);
var I:Integer;
begin
     if TabSheet1.TabVisible
     then begin
               TabSheet1.TabVisible:=False;
               for I:=1 to PageControl1.PageCount-1 do
               begin
                    PageControl1.Pages[i].TabVisible:=True;
               end;
     end;
end;

procedure TfrmSmGlobalWizard.cxButton1GetDrawParams(
  Sender: TcxCustomButton; AState: TcxButtonState; var AColor: TColor;
  AFont: TFont);
begin
      AColor:=clBlue;
end;

procedure TfrmSmGlobalWizard.cxButton2GetDrawParams(
  Sender: TcxCustomButton; AState: TcxButtonState; var AColor: TColor;
  AFont: TFont);
begin
      AColor:=clBlue;
end;

procedure TfrmSmGlobalWizard.cxButton3Click(Sender: TObject);
var Res:Variant;
    Filter:TSmetaFilterValues;
begin
     //реализация шагов мастера
     Res:=NULL;
     Filter.DateFilter:=false;
     Filter.GroupFilter:=false;
     Filter.NOTEqual:=-1;
     Res:=GlobalSpr.WIZARD_GetPlan(Application.MainForm,
                      WorkDatabase.Handle,
                      fsNormal,
                      Date,
                      Filter,
                      LocalId_user);
     if  (Res>0)
     then begin
               //Выбор бюджета + периода функционирования
               GlobalSpr.UseSmeta(Application.MainForm,
                                  Workdatabase.Handle,
                                  fsNormal,
                                  Date,
                                  -1,
                                  Res);
     end;
end;

procedure TfrmSmGlobalWizard.cxButton4Click(Sender: TObject);
var Res,ResDates:Variant;
    Filter:TSmetaFilterValues;
    T:TfrmGetSmForAnalize;
begin
     //Выбираем бюджетs
     T:=TfrmGetSmForAnalize.Create(self, Workdatabase.Handle, LocalId_user);
     if T.ShowModal=mrYes
     then begin
               
     end;
     T.Free;
end;

procedure TfrmSmGlobalWizard.FormCreate(Sender: TObject);
begin
     SendMessage(self.Handle,wm_mdimaximize,0,0);
end;

procedure TfrmSmGlobalWizard.Button1Click(Sender: TObject);
var I:Integer;
begin
     if TabSheet1.TabVisible
     then begin
               //TabSheet1.TabVisible:=False;
               PageControl1.ActivePageIndex:=1;
               for I:=1 to PageControl1.PageCount-1 do
               begin
                    PageControl1.Pages[i].TabVisible:=True;
               end;
     end;

     Button1.Enabled:=false;
end;

procedure TfrmSmGlobalWizard.Button2Click(Sender: TObject);
begin
     SendMessage(Application.Handle,WM_CLOSE,0,0);
end;

procedure TfrmSmGlobalWizard.Button3Click(Sender: TObject);
var  T: TfrmNewSmWay;
     N:TfrmCreateSmByShablon;
begin
     T:=TfrmNewSmWay.Create(self);
     if T.ShowModal=mrYes
     then begin
               if (t.cxRadioGroup1.ItemIndex=0)
               then begin
                         GlobalSpr.WIZARDInsertBudget(Self,Workdatabase.Handle,LocalId_user);
               end
               else begin
                         //Показываем форму для мастера
                         N:=TfrmCreateSmByShablon.Create(self,Workdatabase.Handle,LocalId_user);
                         if (N.ShowModal=mrYes)
                         then begin

                         end;
                         N.Free;
               end;
     end;
     T.Free;
end;

procedure TfrmSmGlobalWizard.Button10Click(Sender: TObject);
begin
     GlobalSpr.ShowHtmlReport(self,wORKDatabase.Handle,LocalId_user);
end;

procedure TfrmSmGlobalWizard.Button8Click(Sender: TObject);
begin
     shellexecute(Handle,
     'Open',
     PAnsiChar(ExtractFilePath(Application.ExeName)+'HELP\FINANCE.chm'),
     nil,
     nil,
     SW_RESTORE);
end;

procedure TfrmSmGlobalWizard.Button9Click(Sender: TObject);
begin
     shellexecute(Handle,
     'Open',
     PAnsiChar(ExtractFilePath(Application.ExeName)+'HELP\EXPIERENCE.chm'),
     nil,
     nil,
     SW_RESTORE);
end;

procedure TfrmSmGlobalWizard.Button7Click(Sender: TObject);
begin
shellexecute(Handle,
     'Open',
     PAnsiChar(ExtractFilePath(Application.ExeName)+'HELP\FINANCE.chm'),
     nil,
     nil,
     SW_RESTORE);
end;

procedure TfrmSmGlobalWizard.Button5Click(Sender: TObject);
var T:TfrmSmModifyWay;
begin
     T:=TfrmSmModifyWay.Create(self,Workdatabase.Handle,LocalId_user);
     if T.ShowModal=mrYes
     then begin

     end;
     T.Free;
end;

end.
