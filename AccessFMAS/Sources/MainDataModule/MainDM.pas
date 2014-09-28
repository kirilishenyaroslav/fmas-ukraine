unit MainDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBDatabase, IBQuery, Db, ImgList, IniFiles, IBCustomDataSet, FIBDatabase,
  pFIBDatabase, IBExternals, IB_Externals;


const
     //Системные константы
     scSystemName = 'Система управління доступом';
     scDevOrganization = 'Донецький національний університет';
     scDeveloper = ' Яновський Андрій Петрович, '+#13+
                   ' Кропов Валентин Олександрович, '+#13+
                   ' Кирилишен Ярослав Вікторович.   '+#13+
                   ' Особиста подяка: Сєров О.М.';
     scStartDate = '04.2003';
     // Режимы запуска форм
     fmAdd           = 1;
     fmEdit          = 2;
     fmView          = 3;
     fmDelete        = 4;
     fmSelect        = 5;
     fmMultiSelect   = 6;
     fmWork          = 7;


// Функция работы со справочником сотрудников
procedure WorkWithPeople(ResultQuery: TIBQuery; Database: TIBDatabase); stdcall; external 'people.dll';

var
    DeveloperMode : Boolean;

type
  TDMMain = class(TDataModule)
    KruAccessDB: TIBDatabase;
    DefaultTransaction: TIBTransaction;
    KruAccImageList: TImageList;
    RowImageList: TImageList;
    TreeObjectImageList: TImageList;
    WriteTransaction: TIBTransaction;
    ReadTransaction: TIBTransaction;
    WorkQuery: TIBQuery;
    InputQuery: TIBQuery;
    InputQueryID_USER: TIntegerField;
    InputQueryNAME: TIBStringField;
    InputQueryPASSWD: TIBStringField;
    InputQueryFULL_NAME: TIBStringField;
    InputQueryID_USER_EXT: TIntegerField;
    InputQueryPASSWD_MD5_HASH: TIBStringField;
    SmallImages: TImageList;
    WorkDatabase: TpFIBDatabase;
    FReadTransaction: TpFIBTransaction;
    FWriteTransaction: TpFIBTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    UseMD5 : Boolean;
    Login:String;
    Password:String;
  end;

procedure ShowErrorMessage(Msg: string);

var
  DMMain: TDMMain;

implementation

uses LoginFormUnit, SysAdmin, IBase, MainForm, Kistory;

{$R *.DFM}

procedure ShowErrorMessage(Msg: string);
begin
     MessageBox(0,PChar(Msg),PChar('Помилка!'),MB_OK+MB_ICONERROR);
end;

procedure TDMMain.DataModuleCreate(Sender: TObject);
var
  Inistr : String;
  SystemIni : TIniFile;
begin
                IniStr := ExtractFilePath(Application.Exename) + 'config.ini';
                SystemIni := TIniFile.Create(IniStr);
                KruAccessDB.Close;

                KruAccessDB.DatabaseName := SystemIni.ReadString('CONNECTION', 'Server', '') + ':' + SystemIni.ReadString('CONNECTION', 'Path', '');
                UseMD5 := (SystemIni.ReadString('Params', 'UseMD5', 'F') = 'T');

                KruAccessDB.Params.Add('user_name=' + FormMain.Login);
                KruAccessDB.Params.Add('password=' + FormMain.Password);

                DeveloperMode := (SystemIni.ReadString('Params','DeveloperMode','F') = 'T');

                try
                    KruAccessDB.Open;
                    WorkDatabase.Handle:=IBExternals.Void(KruAccessDB.Handle);
                    FReadTransaction.StartTransaction;
                    Kistory.StartConnHistory(WorkDatabase.Handle);

                except
                  on exc: Exception do
                  begin
                       ShowErrorMessage('При підключенні до БД виникла помилка: "' + exc.Message + '"');
                       PostQuitMessage(-1);
                       Application.ProcessMessages;
                       SystemIni.Free;
                       exit;
                  end;
                end;

                SystemIni.Free;
end;

end.
