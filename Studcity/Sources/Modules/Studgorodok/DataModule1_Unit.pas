//***********************************************************************
//* Проект "Студгородок"                                                *
//* Модуль данных (контейнер для компонентов)                           *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit DataModule1_Unit;

interface

uses
  Windows, Graphics, Forms, Messages, ExtCtrls, ComCtrls, StdActns, ShellAPI,

  SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, Controls,
  FIBQuery, pFIBQuery, pFIBStoredProc, pFIBErrorHandler, FIB, StdCtrls, Dialogs, ToolWin;

type
  TDataModule1 = class(TDataModule)
    DB: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    ReadTimestampDataSet: TpFIBDataSet;
    DataSet_main: TpFIBDataSet;
    DataSet_read: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    procedure DBAfterRestoreConnect;
    procedure DBLostConnect(Database: TFIBDatabase;
      E: EFIBError; var Actions: TOnLostConnectActions);
  private
    //--------------------------------------------------------------------------
  public
    CURRENT_TIMESTAMP : TDatetime;
  end;

var
  DataModule1: TDataModule1;

implementation

uses Main, ST_DT_SQL_WaitForm;

{$R *.dfm}

procedure TDataModule1.DBAfterRestoreConnect;
begin
MessageDlg('Соединение с базой данных было восстановлено!',
       mtInformation, [mbOk], 0  );
       Screen.Cursor:=crDefault;
       SQL_Wait_Form.Free;
MainForm.StatusBar.Panels[1].Text:='Соединение удачно восстановлено';
end;

procedure TDataModule1.DBLostConnect(Database: TFIBDatabase;
  E: EFIBError; var Actions: TOnLostConnectActions);
//var
//    i:Integer;
begin
  If MessageBox(Application.Handle,PChar('Внимание! Соединение с базой данных потеряно! Попытаться восстановить соединение ?'),'Ошибка сети',MB_YESNO or MB_ICONQUESTION)= mrYes then
   begin
    MessageDlg('В течение минуты приложение автоматически будет пытаться возобновить соединение. Пожалуйста, подождите...',
              mtInformation, [mbOk], 0);
    MainForm.Update;
    Screen.Cursor:=crHourGlass;
    SQL_Wait_Form:= TSQL_Wait_Form.Create(Self);
    SQL_Wait_Form.Zapis_Label.Caption:='Восстановление связи';
    SQL_Wait_Form.Show;
    SQL_Wait_Form.FormStyle:=fsStayOnTop;
    SQL_Wait_Form.Update;
    Actions := laWaitRestore;
   end
  else
   begin
    MessageDlg('Приложение будет закрыто. Обратитесь к администратору сети.',
       mtInformation, [mbOk], 0);
    Actions := laTerminateApp;
   end
end;

end.

