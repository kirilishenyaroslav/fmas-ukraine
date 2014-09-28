unit TestMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FIBDatabase, pFIBDatabase, DB, RxMemDS,
  Menus, ExtCtrls, uCommonSp, iniFiles;

type
  TTestForm = class(TForm)
    MainMenu1: TMainMenu;
    OpenSpravItem: TMenuItem;
    Panel1: TPanel;
    SelectOneButton: TButton;
    Label1: TLabel;
    OutMemo: TMemo;
    MultiSelect: TButton;
    Database: TpFIBDatabase;
    procedure OpenSpravItemClick(Sender: TObject);
    procedure SelectOneButtonClick(Sender: TObject);
    procedure MultiSelectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TestForm: TTestForm;

implementation

{$R *.dfm}

procedure TTestForm.OpenSpravItemClick(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(Database.Handle);
                // MDI-окно
            FieldValues['ShowStyle'] := 1;
                // без выборки
            FieldValues['Select'] := 0;

                // в управлении персоналом корневое подразделение 2612
            FieldValues['Root_Department'] := 2612;
                // смотрим на текущую дату
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
end;

procedure TTestForm.SelectOneButtonClick(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(Database.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;

            FieldValues['Root_Department'] := 2612;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
        // показать справочник и проанализировать результат (выбор одного подр.)
    sp.Show;
    if sp.Output = nil then
        ShowMessage('BUG: Output is NIL!!!')
    else
    if not sp.Output.IsEmpty then
        Label1.Caption := IntToStr(sp.Output['Id_Department']) + ' ' +
            sp.Output['Name_Short'];
    sp.Free;
end;

procedure TTestForm.MultiSelectClick(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(Database.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // множественный выбор
            FieldValues['Select'] := 2;

            FieldValues['Root_Department'] := 2612;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;

        // выбрать несколько подразделений
    sp.Show;
    if sp.Output = nil then
        ShowMessage('Output is NIL!!!')
    else
    begin
        sp.Output.First;
        while not sp.Output.Eof do
        begin
            OutMemo.Lines.Add(sp.Output['Name_Full']);
            sp.Output.Next;
        end;
    end;
    sp.Free;
end;

procedure TTestForm.FormCreate(Sender: TObject);
var
	reg: TIniFile;
begin
		// загрузить параметры базы из ini-файла
	reg := TIniFile.Create('.\test.ini');
    with Database do
    begin
        DatabaseName := reg.ReadString('Database','Path', '');
		DBParams.Clear;
		DBParams.Add('user_name=' +
    	reg.ReadString('Database','USER','SYSDBA'));
		DBParams.Add('password=' +
			reg.ReadString('Database','PASSWORD','masterkey'));
		DBParams.Add('lc_ctype=' +
			reg.ReadString('Database','CHARSET','WIN1251'));
        Connected := True;
    end;
end;

end.
