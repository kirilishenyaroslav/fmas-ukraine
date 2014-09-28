unit UWMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, Menus, RxMenus, cxControls, dxStatusBar,
  ImgList, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
  pFIBDataSet, IniFiles, Registry, ActnList, ExtCtrls, dxBar, StdCtrls;

type
  TfmUWMainForm = class(TForm)
    dxStatusBar1: TdxStatusBar;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    ImageList1: TImageList;
    N2: TMenuItem;
    Database: TpFIBDatabase;
    pFIBDataSet1: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    N3: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    ActionList1: TActionList;
    SelectLang: TAction;
    N4: TMenuItem;
    Timer1: TTimer;
    ActionClose: TAction;
    N11: TMenuItem;
    N33: TMenuItem;
    N12: TMenuItem;
    BarManager: TdxBarManager;
    N34: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Show_Main_Form_Vedomost;
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N31Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure LoadCaption;
    procedure SelectLangExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    jj : integer;
    sf : boolean;
    index_lang : integer;
  public
    id_user : int64;
    id_pcard : int64;
  end;

var
  fmUWMainForm: TfmUWMainForm;

implementation
uses AccMgmt,
     SplashFormUW,
     UWLoaderUnit,
     UWResourcesUnit,
     MDIToolBar,
     UWProgressForm,
     Un_What_new,
     AArray;

{$R *.dfm}

{ TfmUVMainForm }


procedure TfmUWMainForm.FormCreate(Sender: TObject);
begin
    sf := false;
    LoadCaption;
    Show_Main_Form_Vedomost;
end;

procedure TfmUWMainForm.Show_Main_Form_Vedomost;
var
    reg : TIniFile;
    NagScreen : TfmSplashFormUW;
//    Res : WIN32_FIND_DATA;
//    Res_file : THandle;
//    name, path : string;
    Layout: array[0.. KL_NAMELENGTH] of char;
begin
    jj := 1;
    // Запускаем логотип системы
    NagScreen := TfmSplashFormUW.Create(self);
    NagScreen.Label1.Caption := '';
    NagScreen.Show;
    NagScreen.Repaint;
    // Читаем настройки из файла настроек
    NagScreen.DrawText(UWResourcesUnit.MY_CONST_OPEN_CONFIG[index_lang]);
    reg := TIniFile.Create('.\config.ini');
    dxStatusBar1.Panels[0].Text := UWResourcesUnit.MY_CONST_BASA[index_lang] + ' : ' + reg.ReadString('CONNECTION','Path','');
    NagScreen.DrawText(UWResourcesUnit.MY_CONST_FORM_DATABASE_OPEN[index_lang]);
    NagScreen.cxProgressBar1.Position := 20;
    NagScreen.Update;
    try
{        path     := ExtractFilepath(Application.ExeName)+'Bank\BankDay.bpl';
        NagScreen.Label1.Caption := 'Загрузка пакета '+'BankDay.bpl';
        NagScreen.cxProgressBar1.Position := NagScreen.cxProgressBar1.Position + 10;
        NagScreen.Update;

        path     := ExtractFilepath(Application.ExeName)+'Bank\BankDocument.bpl';
        NagScreen.Label1.Caption := 'Загрузка пакета '+'BankDocument.bpl';
        NagScreen.cxProgressBar1.Position := NagScreen.cxProgressBar1.Position + 10;
        NagScreen.Update;
//       LoadPackage(path);
        path     := ExtractFilepath(Application.ExeName)+'WorkDog\'+'dogMain.bpl';
        NagScreen.Label1.Caption := 'Загрузка пакета '+'dogMain.bpl';
        NagScreen.cxProgressBar1.Position := NagScreen.cxProgressBar1.Position + 10;
        NagScreen.Update;
        LoadPackage(path);

        path     := ExtractFilepath(Application.ExeName)+'Bank\BankFindDocument.bpl';
        NagScreen.Label1.Caption := 'Загрузка пакета '+'BankFindDocument.bpl';
        NagScreen.cxProgressBar1.Position := NagScreen.cxProgressBar1.Position + 10;
        NagScreen.Update;
                         }
        NagScreen.cxProgressBar1.Position := 100;
        NagScreen.Update;
    finally
        NagScreen.Free;
    end;
    id_user := GetUserID;
                                             {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,'00000422'),KLF_ACTIVATE);
//    Label1.Caption   := GetUserFIO;

    sf := true;
end;

procedure TfmUWMainForm.N2Click(Sender: TObject);
begin
    Close;
end;

procedure TfmUWMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
    s1, s2 : string;
begin
    s1 := UWResourcesUnit.MY_CONST_MESSAGE_WARNING[index_lang];
    s2 := UWResourcesUnit.MY_CONST_VIHOD[index_lang];
    if sf then
        CanClose := MessageBox(Handle, Pchar(s2), Pchar(s1), mb_YesNO)=mrYes;
end;

procedure TfmUWMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
    j : integer;
begin
    for j := 0 to Database.ActiveTransactionCount do
    begin
        if Database.Transactions[j].Active then
        begin
            try
                Database.Transactions[j].Active := false;
            finally
            end;
        end;
    end;

   for j:=0 to self.MDIChildCount-1 do
   begin
       if (MDIChildren[j].Owner as TForm).Handle=self.Handle
       then begin
           MDIChildren[j].Release;
       end;
   end;

  if jj = 1 then
//     FinalizeAdminSystem;
end;

procedure TfmUWMainForm.N31Click(Sender: TObject);
begin
    UWLoaderUnit.LoadUVSpBankCardEditing(Self, id_user, Database);
end;

procedure TfmUWMainForm.N32Click(Sender: TObject);
begin
    UWLoaderUnit.LoadUVSpBankCardEditingDog(Self, id_user, Database, true, true);
end;

procedure TfmUWMainForm.LoadCaption;
var
    reg : TRegistry;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12303706759837\gnal\v\', False) then
        begin
            index_lang := StrToInt(reg.ReadString('index'));
        end else
            index_lang := 1;
    finally
        reg.Free;
    end;

    Caption                     := UWResourcesUnit.UV_MAIN_CAPTION[index_lang];
    N2.Caption                  := UWResourcesUnit.MY_CONST_VIH[index_lang];
    N1.Caption                  := UWResourcesUnit.MY_CONST_WORK[index_lang];
    N3.Caption                  := UWResourcesUnit.MY_CONST_SP[index_lang];
    N4.Caption                  := UWResourcesUnit.MY_CONST_INFO[index_lang];
    N31.Caption                 := UWResourcesUnit.SPBANKCARD_CAPTION[index_lang];
    N32.Caption                 := UWResourcesUnit.SPBANKCARD_DOG_CAPTION[index_lang];
    N33.Caption                 := UWResourcesUnit.UV_MAIN_N33[index_lang];
    N34.Caption                 := UWResourcesUnit.UV_MAIN_N34[index_lang];
    N11.Caption                 := UWResourcesUnit.UV_MAIN_N11[index_lang];
    N12.Caption                 := UWResourcesUnit.UV_MAIN_N12[index_lang];

    N41.Caption                 := UWResourcesUnit.MY_ABOUT_SYSTEM[index_lang];
    N42.Caption                 := UWResourcesUnit.MY_N_42[index_lang];

    dxStatusBar1.Panels[1].Text := UWResourcesUnit.MY_CONST_USER[index_lang] + '  -  ' + GetUserFIO;

    Update;
    Refresh;
end;

procedure TfmUWMainForm.SelectLangExecute(Sender: TObject);
var
    reg : TRegistry;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12303706759837\gnal\v\',true) then
        begin
            if index_lang + 1 > UWResourcesUnit.IndexLang
                then reg.writeString('index', '1')
                else reg.writeString('index', IntToStr(index_lang + 1));
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;

    LoadCaption;
end;

procedure TfmUWMainForm.Timer1Timer(Sender: TObject);
begin
    LoadCaption;
end;

procedure TfmUWMainForm.N11Click(Sender: TObject);
begin
    UWLoaderUnit.LoadVedomostEditing(Self, Database, id_user, -1);
end;

procedure TfmUWMainForm.ActionCloseExecute(Sender: TObject);
begin
    close;
end;

procedure TfmUWMainForm.N33Click(Sender: TObject);
begin
    UWLoaderUnit.LoadSelectVedomostTypeVd(Self, Database, id_user, false, true);
end;

procedure TfmUWMainForm.N12Click(Sender: TObject);
begin
    UWLoaderUnit.LoadUWReestrEditing(Self, Database, id_user);
end;

procedure TfmUWMainForm.FormShow(Sender: TObject);
var
 p : TMDITool;
begin
 p := TMDITool.Create;
 p.AddMDIToolBar(Self);
end;

procedure TfmUWMainForm.N34Click(Sender: TObject);
begin
    UWLoaderUnit.LoadImportBankCard(Self, Database, id_user);
end;

procedure TfmUWMainForm.N42Click(Sender: TObject);
begin
    Show_What_New(self, 33);
end;

procedure TfmUWMainForm.Button1Click(Sender: TObject);
begin
    UWLoaderUnit.LoadSelectVedomostOutput(Self, Database, id_user, -1, IncMonth(date, -2), date)
end;

procedure TfmUWMainForm.Button2Click(Sender: TObject);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UWspTypeViplat.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant      := fsMDIChild;
    UWLoaderUnit.ShowAllUwBpl(self, InputParam);
end;

procedure TfmUWMainForm.Button3Click(Sender: TObject);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UwVedomost2.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Database.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant      := fsMDIChild;
    InputParam['Input']['id_user'].AsVariant        := id_user;
    UWLoaderUnit.ShowAllUwBpl(self, InputParam);
end;

end.
